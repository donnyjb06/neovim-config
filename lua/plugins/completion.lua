return {
  {
    "hrsh7th/nvim-cmp",

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },

    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()

      require("luasnip.loaders.from_lua").load({
        paths = "~/.config/nvim/lua/snippets",
      })

      luasnip.filetype_extend("typescript", { "javascript" })
      luasnip.filetype_extend("javascriptreact", { "javascript" })
      luasnip.filetype_extend("typescriptreact", { "javascript" })

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,noinsert",
        },

        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        window = {
          completion = {
            border = "rounded",

            winhighlight =
            "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",

            col_offset = -3,
            side_padding = 1,

            max_width = 50,
            max_height = 8,

            scrollbar = false,
          },

          documentation = {
            border = "rounded",
            max_width = 60,
            max_height = 12,
          },
        },

        formatting = {
          fields = {
            "abbr",
            "menu",
          },

          format = function(entry, item)
            local source_names = {
              nvim_lsp = "[LSP]",
              luasnip = "[Snippet]",
              buffer = "[Buffer]",
              path = "[Path]",
            }

            local detail =
                entry.completion_item.detail
                or (
                  entry.completion_item.labelDetails
                  and entry.completion_item.labelDetails.description
                )
                or ""

            if detail ~= "" then
              item.menu = detail
            else
              item.menu = source_names[entry.source.name]
            end

            return item
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({
                select = true,
              })
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<Up>"] = cmp.mapping.select_prev_item(),
          ["<Down>"] = cmp.mapping.select_next_item(),
        }),

        sources = cmp.config.sources({
          {
            name = "nvim_lsp",
            priority = 1000,
          },

          {
            name = "path",
            priority = 750,
          },

          {
            name = "buffer",
            priority = 500,
          },

          {
            name = "luasnip",
            priority = 250,
          },
        }),

        sorting = {
          priority_weight = 2,

          comparators = {
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
      })

      vim.api.nvim_set_hl(0, "Pmenu", {
        bg = "#181616",
        fg = "#dcd7ba",
      })

      vim.api.nvim_set_hl(0, "PmenuSel", {
        bg = "#2d4f67",
        fg = "#dcd7ba",
      })

      vim.api.nvim_set_hl(0, "FloatBorder", {
        bg = "#181616",
        fg = "#54546d",
      })
    end,
  },
}

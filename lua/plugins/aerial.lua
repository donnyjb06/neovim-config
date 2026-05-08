return {
  {
    "stevearc/aerial.nvim",

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      require("aerial").setup({
        backends = { "lsp", "treesitter", "markdown", "man" },

        layout = {
          min_width = 32,
          max_width = 45,
          default_direction = "right",
          placement = "edge",
        },

        attach_mode = "window",
        close_on_select = false,

        show_guides = true,

        guides = {
          mid_item = "├─",
          last_item = "└─",
          nested_top = "│ ",
          whitespace = "  ",
        },

        icons = {
          Array = "󰅪 ",
          Boolean = " ",
          Class = " ",
          Constant = " ",
          Constructor = " ",
          Enum = " ",
          EnumMember = " ",
          Event = " ",
          Field = " ",
          File = " ",
          Function = "󰊕 ",
          Interface = " ",
          Key = " ",
          Method = "󰊕 ",
          Module = " ",
          Namespace = "󰦮 ",
          Null = " ",
          Number = "󰎠 ",
          Object = " ",
          Operator = " ",
          Package = " ",
          Property = " ",
          String = " ",
          Struct = "󰆼 ",
          TypeParameter = " ",
          Variable = "󰀫 ",
        },

        filter_kind = false,
      })

      vim.keymap.set("n", "<leader>o", function()
        require("aerial").toggle({
          focus = true,
        })
      end, {
        desc = "Toggle Code Outline",
      })

      vim.keymap.set("n", "]s", "<cmd>AerialNext<CR>", {
        desc = "Next Symbol",
      })

      vim.keymap.set("n", "[s", "<cmd>AerialPrev<CR>", {
        desc = "Previous Symbol",
      })
    end,
  },
}

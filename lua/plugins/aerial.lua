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

        filter_kind = {
          "Class",
          "Constructor",
          "Enum",
          "Function",
          "Interface",
          "Method",
          "Module",
          "Struct",
          "Type",
        },

        keymaps = {
          ["?"] = "actions.show_help",
          ["q"] = "actions.close",

          ["<CR>"] = "actions.jump",
          ["<Tab>"] = "actions.jump",

          ["o"] = "actions.tree_toggle",
          ["O"] = "actions.tree_toggle_recursive",

          ["J"] = "actions.down_and_scroll",
          ["K"] = "actions.up_and_scroll",

          ["}"] = "actions.next",
          ["{"] = "actions.prev",

          ["]]"] = "actions.next_up",
          ["[["] = "actions.prev_up",
        },

        icons = {
          Class = " ",
          Constructor = " ",
          Enum = " ",
          Function = "󰊕 ",
          Interface = " ",
          Method = "󰊕 ",
          Module = " ",
          Struct = "󰆼 ",
          Type = " ",
        },
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

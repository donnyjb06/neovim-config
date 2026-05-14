return {
  {
    "romgrk/barbar.nvim",

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    init = function()
      vim.g.barbar_auto_setup = false
      vim.o.showtabline = 2
    end,

    config = function()
      require("barbar").setup({
        animation = true,
        auto_hide = 1,
        tabpages = false,
        clickable = true,

        maximum_padding = 1,
        minimum_padding = 1,
        maximum_length = 22,

        icons = {
          buffer_index = false,
          buffer_number = false,
          button = false,

          modified = {
            button = "●",
          },

          separator = {
            left = "",
            right = "",
          },

          inactive = {
            separator = {
              left = "",
              right = "",
            },
          },
        },

        exclude_ft = {
          "alpha",
          "dashboard",
          "snacks_dashboard",
          "neo-tree",
          "aerial",
          "Trouble",
          "qf",
          "toggleterm",
        },

        exclude_name = {
          "Lazy",
        },

        sidebar_filetypes = {
          ["neo-tree"] = {
            event = "BufWipeout",
            text = "Files",
            align = "center",
          },

          aerial = {
            event = "BufWipeout",
            text = "Outline",
            align = "center",
          },
        },
      })

      vim.keymap.set("n", "<leader>bn", "<cmd>BufferNext<CR>", {
        desc = "[B]uffer [N]ext",
      })

      vim.keymap.set("n", "<leader>bp", "<cmd>BufferPrevious<CR>", {
        desc = "[B]uffer [P]revious",
      })

      vim.keymap.set("n", "<leader>bd", "<cmd>BufferClose<CR>", {
        desc = "[B]uffer [D]elete",
      })

      vim.keymap.set("n", "<leader>bo", "<cmd>BufferCloseAllButCurrent<CR>", {
        desc = "[B]uffer Close [O]thers",
      })

      vim.api.nvim_set_hl(0, "BufferCurrent", {
        fg = "#dcd7ba",
        bg = "#181616",
        bold = true,
      })

      vim.api.nvim_set_hl(0, "BufferVisible", {
        fg = "#c8c093",
        bg = "#181616",
      })

      vim.api.nvim_set_hl(0, "BufferInactive", {
        fg = "#727169",
        bg = "#181616",
      })

      vim.api.nvim_set_hl(0, "BufferTabpageFill", {
        bg = "#181616",
      })

      vim.api.nvim_set_hl(0, "BufferCurrentMod", {
        fg = "#98bb6c",
        bg = "#181616",
      })

      vim.api.nvim_set_hl(0, "BufferInactiveMod", {
        fg = "#98bb6c",
        bg = "#181616",
      })
    end,
  },
}

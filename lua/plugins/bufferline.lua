return {
  {
    "akinsho/bufferline.nvim",

    version = "*",

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",

          numbers = "none",

          close_command = "bdelete! %d",
          right_mouse_command = "bdelete! %d",

          diagnostics = "nvim_lsp",

          show_buffer_close_icons = false,
          show_close_icon = false,

          show_duplicate_prefix = false,

          separator_style = "thin",

          always_show_bufferline = true,

          offsets = {
            {
              filetype = "neo-tree",
              text = "Files",
              text_align = "center",
              separator = true,
            },
            {
              filetype = "aerial",
              text = "Outline",
              text_align = "center",
              separator = true,
            },
          },
        },

        highlights = {
          fill = {
            bg = "#181616",
          },

          background = {
            fg = "#727169",
            bg = "#181616",
          },

          buffer_visible = {
            fg = "#c8c093",
            bg = "#181616",
          },

          buffer_selected = {
            fg = "#dcd7ba",
            bg = "#181616",
            bold = true,
            italic = false,
          },

          modified = {
            fg = "#98bb6c",
            bg = "#181616",
          },

          modified_visible = {
            fg = "#98bb6c",
            bg = "#181616",
          },

          modified_selected = {
            fg = "#98bb6c",
            bg = "#181616",
          },

          separator = {
            fg = "#181616",
            bg = "#181616",
          },

          separator_visible = {
            fg = "#181616",
            bg = "#181616",
          },

          separator_selected = {
            fg = "#181616",
            bg = "#181616",
          },

          indicator_selected = {
            fg = "#7e9cd8",
            bg = "#181616",
          },

          diagnostic = {
            fg = "#727169",
            bg = "#181616",
          },

          diagnostic_selected = {
            fg = "#dcd7ba",
            bg = "#181616",
            bold = true,
          },

          error = {
            fg = "#e82424",
            bg = "#181616",
          },

          error_selected = {
            fg = "#e82424",
            bg = "#181616",
            bold = true,
          },

          warning = {
            fg = "#ff9e3b",
            bg = "#181616",
          },

          warning_selected = {
            fg = "#ff9e3b",
            bg = "#181616",
            bold = true,
          },
        },
      })

      vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", {
        desc = "[B]uffer [N]ext",
      })

      vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", {
        desc = "[B]uffer [P]revious",
      })

      vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", {
        desc = "[B]uffer [D]elete",
      })
    end,
  },
}

return {
  {
    "folke/noice.nvim",

    event = "VeryLazy",

    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },

    config = function()
      require("notify").setup({
        background_colour = "#181616",

        fps = 60,

        icons = {
          ERROR = "",
          WARN = "",
          INFO = "",
          DEBUG = "",
          TRACE = "",
        },

        level = 2,

        minimum_width = 30,

        render = "compact",

        stages = "fade_in_slide_out",

        timeout = 3000,

        top_down = false,
      })

      require("noice").setup({
        lsp = {
          progress = {
            enabled = false,
          },

          hover = {
            enabled = true,
            silent = true,
          },

          signature = {
            enabled = true,
          },

          message = {
            enabled = true,
          },

          documentation = {
            view = "hover",
          },
        },

        presets = {
          bottom_search = false,

          command_palette = true,

          long_message_to_split = true,

          inc_rename = false,

          lsp_doc_border = true,
        },

        cmdline = {
          enabled = true,

          view = "cmdline_popup",

          format = {
            cmdline = {
              pattern = "^:",
              icon = "",
              lang = "vim",
            },

            search_down = {
              kind = "search",
              pattern = "^/",
              icon = "",
              lang = "regex",
            },

            search_up = {
              kind = "search",
              pattern = "^%?",
              icon = "",
              lang = "regex",
            },
          },
        },

        views = {
          cmdline_popup = {
            position = {
              row = "40%",
              col = "50%",
            },

            size = {
              width = 60,
              height = "auto",
            },

            border = {
              style = "rounded",
              padding = { 0, 1 },
            },

            win_options = {
              winhighlight = {
                Normal = "Normal",
                FloatBorder = "FloatBorder",
              },
            },
          },

          popupmenu = {
            relative = "editor",

            position = {
              row = "50%",
              col = "50%",
            },

            size = {
              width = 60,
              height = 10,
            },

            border = {
              style = "rounded",
              padding = { 0, 1 },
            },

            win_options = {
              winhighlight = {
                Normal = "Normal",
                FloatBorder = "FloatBorder",
              },
            },
          },
        },

        routes = {
          {
            filter = {
              event = "msg_show",
              find = "written",
            },

            opts = {
              skip = true,
            },
          },

          {
            filter = {
              event = "notify",
              level = vim.log.levels.ERROR,
            },

            opts = {
              timeout = false,
            },
          },

          {
            filter = {
              event = "notify",
              level = vim.log.levels.WARN,
            },

            opts = {
              timeout = 8000,
            },
          },
        },
      })

      vim.notify = require("notify")

      vim.api.nvim_set_hl(0, "NotifyBackground", {
        bg = "#181616",
      })

      vim.keymap.set("n", "<leader>un", "<cmd>Noice history<CR>", {
        desc = "[U]I [N]otification History",
      })

      vim.keymap.set("n", "<leader>uN", "<cmd>Noice last<CR>", {
        desc = "[U]I Last [N]otification",
      })

      vim.keymap.set("n", "<leader>ud", "<cmd>Noice dismiss<CR>", {
        desc = "[U]I [D]ismiss Notifications",
      })
    end,
  },
}

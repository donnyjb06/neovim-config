return {
  {
    "folke/trouble.nvim",

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      local trouble = require("trouble")

      trouble.setup({
        focus = true,

        auto_preview = true,

        preview = {
          type = "main",
          scratch = false,
        },

        modes = {
          diagnostics = {
            win = {
              position = "bottom",
              size = 12,
            },
          },

          qflist = {
            win = {
              position = "bottom",
              size = 12,
            },
          },
        },
      })

      vim.keymap.set("n", "<leader>dd", function()
        trouble.toggle("diagnostics", {
          filter = {
            buf = 0,
          },
          focus = true,
        })
      end, {
        desc = "[D]ocument [D]iagnostics",
      })

      vim.keymap.set("n", "<leader>dx", function()
        trouble.toggle("diagnostics", {
          focus = true,
        })
      end, {
        desc = "[D]iagnostics Workspace",
      })

      vim.keymap.set("n", "<leader>dq", function()
        trouble.toggle("qflist", {
          focus = true,
        })
      end, {
        desc = "[D]iagnostics Quickfix",
      })

      vim.api.nvim_set_hl(0, "TroubleNormal", {
        bg = "#181616",
      })

      vim.api.nvim_set_hl(0, "TroubleNormalNC", {
        bg = "#181616",
      })

      vim.api.nvim_set_hl(0, "TroubleText", {
        fg = "#dcd7ba",
      })
    end,
  },
}

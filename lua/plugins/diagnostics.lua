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
    end,
  },
}

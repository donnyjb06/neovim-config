return {
  {
    "nvim-neotest/neotest",

    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",

      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-python",
    },

    config = function()
      local neotest = require("neotest")

      neotest.setup({
        adapters = {
          require("neotest-vitest"),

          require("neotest-python")({
            runner = "pytest",
            python = ".venv/bin/python",
          }),
        },

        output_panel = {
          enabled = true,
          open = "botright split | resize 15",
        },
      })

      vim.keymap.set("n", "<leader>xx", function()
        neotest.run.run()
      end, {
        desc = "Test nearest",
      })

      vim.keymap.set("n", "<leader>xf", function()
        neotest.run.run(vim.fn.expand("%"))
      end, {
        desc = "Test file",
      })

      vim.keymap.set("n", "<leader>xo", function()
        neotest.output_panel.toggle()
      end, {
        desc = "Test output panel",
      })

      vim.keymap.set("n", "<leader>xs", function()
        neotest.summary.toggle()
      end, {
        desc = "Test summary",
      })

      vim.keymap.set("n", "<leader>xw", function()
        neotest.watch.toggle(vim.fn.expand("%"))
      end, {
        desc = "Watch test file",
      })
    end,
  },
}

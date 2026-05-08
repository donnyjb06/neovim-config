return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},

    config = function()
      require("persistence").setup({
        dir = vim.fn.stdpath("state") .. "/sessions/",
        need = 1,
        branch = true,
      })

      vim.keymap.set("n", "<leader>ql", function()
        require("persistence").load({ last = true })
      end, { desc = "[Q] Restore [L]ast Session" })

      vim.keymap.set("n", "<leader>qs", function()
        require("persistence").load()
      end, { desc = "[Q] Restore Current [S]ession" })

      vim.keymap.set("n", "<leader>qd", function()
        require("persistence").stop()
      end, { desc = "[Q] [D]isable Session Save" })
    end,
  },
}

return {
  {
    "cbochs/grapple.nvim",

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    opts = {
      scope = "git",

      icons = true,

      win_opts = {
        width = 80,
        height = 12,
        border = "rounded",
        footer = " Grapple Tags ",
      },
    },

    config = function(_, opts)
      local grapple = require("grapple")

      grapple.setup(opts)

      vim.keymap.set("n", "<leader>a", function()
        grapple.toggle()
      end, {
        desc = "[A]dd/remove file tag",
      })

      vim.keymap.set("n", "<leader>e", function()
        grapple.toggle_tags()
      end, {
        desc = "[E]dit tagged files",
      })

      vim.keymap.set("n", "<leader>sh", function()
        grapple.toggle_tags()
      end, {
        desc = "[S]earch tagged files",
      })

      vim.keymap.set("n", "<C-h>", function()
        grapple.select({ index = 1 })
      end, {
        desc = "Go to tagged file 1",
      })

      vim.keymap.set("n", "<C-j>", function()
        grapple.select({ index = 2 })
      end, {
        desc = "Go to tagged file 2",
      })

      vim.keymap.set("n", "<C-k>", function()
        grapple.select({ index = 3 })
      end, {
        desc = "Go to tagged file 3",
      })

      vim.keymap.set("n", "<C-l>", function()
        grapple.select({ index = 4 })
      end, {
        desc = "Go to tagged file 4",
      })
    end,
  },
}

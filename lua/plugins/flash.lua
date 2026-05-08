return {
  {
    "folke/flash.nvim",

    event = "VeryLazy",

    opts = {
      labels = "asdfghjklqwertyuiopzxcvbnm",

      search = {
        multi_window = true,
        forward = true,
        wrap = true,
        incremental = true,
      },

      jump = {
        jumplist = true,
        pos = "start",
        history = false,
        register = false,
        nohlsearch = false,
        autojump = false,
      },

      label = {
        uppercase = false,

        rainbow = {
          enabled = false,
        },
      },

      highlight = {
        backdrop = true,
        matches = true,
      },

      modes = {
        search = {
          enabled = true,
        },

        char = {
          enabled = false,
        },
      },

      prompt = {
        enabled = true,
      },
    },

    config = function(_, opts)
      local flash = require("flash")

      flash.setup(opts)

      vim.keymap.set({ "n", "x", "o" }, "<leader><leader>", function()
        flash.jump()
      end, {
        desc = "Flash Jump",
      })

      vim.keymap.set({ "n", "x", "o" }, "<leader>j", function()
        flash.treesitter()
      end, {
        desc = "Flash Treesitter Jump",
      })

      vim.keymap.set("o", "r", function()
        flash.remote()
      end, {
        desc = "Remote Flash",
      })

      vim.keymap.set({ "o", "x" }, "R", function()
        flash.treesitter_search()
      end, {
        desc = "Treesitter Search",
      })

      vim.keymap.set("c", "<C-s>", function()
        flash.toggle()
      end, {
        desc = "Toggle Flash Search",
      })

      vim.api.nvim_set_hl(0, "FlashLabel", {
        fg = "#181616",
        bg = "#7e9cd8",
        bold = true,
      })

      vim.api.nvim_set_hl(0, "FlashMatch", {
        fg = "#dcd7ba",
        bg = "#2a2a37",
      })

      vim.api.nvim_set_hl(0, "FlashCurrent", {
        fg = "#181616",
        bg = "#98bb6c",
        bold = true,
      })

      vim.api.nvim_set_hl(0, "FlashBackdrop", {
        fg = "#54546d",
      })
    end,
  },
}

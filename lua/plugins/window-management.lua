return {
  {
    "mrjones2014/smart-splits.nvim",

    event = "VeryLazy",

    config = function()
      local smart_splits = require("smart-splits")

      smart_splits.setup({
        ignored_filetypes = {
          "nofile",
          "quickfix",
          "prompt",
        },

        ignored_buftypes = {
          "NvimTree",
        },

        default_amount = 3,
        at_edge = "stop",
      })

      vim.keymap.set("n", "<A-h>", smart_splits.move_cursor_left, {
        desc = "Move to window left",
      })

      vim.keymap.set("n", "<A-j>", smart_splits.move_cursor_down, {
        desc = "Move to window below",
      })

      vim.keymap.set("n", "<A-k>", smart_splits.move_cursor_up, {
        desc = "Move to window above",
      })

      vim.keymap.set("n", "<A-l>", smart_splits.move_cursor_right, {
        desc = "Move to window right",
      })

      vim.keymap.set("n", "<C-Left>", smart_splits.resize_left, {
        desc = "Resize window left",
      })

      vim.keymap.set("n", "<C-Down>", smart_splits.resize_down, {
        desc = "Resize window down",
      })

      vim.keymap.set("n", "<C-Up>", smart_splits.resize_up, {
        desc = "Resize window up",
      })

      vim.keymap.set("n", "<C-Right>", smart_splits.resize_right, {
        desc = "Resize window right",
      })
    end,
  },
}

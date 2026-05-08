return {
  {
    "nvim-treesitter/nvim-treesitter-context",

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },

    config = function()
      require("treesitter-context").setup({
        enable = true,
        multiwindow = true,

        max_lines = 3,
        min_window_height = 0,

        line_numbers = true,
        multiline_threshold = 1,

        trim_scope = "outer",
        mode = "cursor",

        separator = nil,
        zindex = 20,
      })

      vim.keymap.set("n", "<leader>ut", function()
        require("treesitter-context").toggle()
      end, {
        desc = "[U]I Toggle [T]reesitter Context",
      })
    end,
  },
}

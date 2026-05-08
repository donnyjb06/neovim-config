return {
  {
    "stevearc/oil.nvim",

    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    opts = {
      default_file_explorer = true,

      columns = {
        "icon",
      },

      delete_to_trash = true,

      skip_confirm_for_simple_edits = true,

      view_options = {
        show_hidden = true,
      },

      float = {
        padding = 2,
        max_width = 100,
        max_height = 30,
        border = "rounded",
      },

      keymaps = {
        ["q"] = "actions.close",
      },
    },

    config = function(_, opts)
      require("oil").setup(opts)

      vim.keymap.set("n", "-", "<CMD>Oil<CR>", {
        desc = "Open parent directory",
      })
    end,
  },
}

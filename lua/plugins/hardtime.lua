return {
  {
    "m4xshen/hardtime.nvim",
    event = "VeryLazy",

    dependencies = {
      "MunifTanjim/nui.nvim",
    },

    opts = {
      enabled = true,
      restriction_mode = "hint",

      disabled_filetypes = {
        "qf",
        "netrw",
        "NvimTree",
        "lazy",
        "mason",
        "oil",
        "help",
        "TelescopePrompt",
        "toggleterm",
      },
    },

    keys = {
      {
        "<leader>uh",
        "<cmd>Hardtime toggle<CR>",
        desc = "Toggle Hardtime",
      },
      {
        "<leader>uH",
        "<cmd>Hardtime report<CR>",
        desc = "Hardtime Report",
      },
    },
  },
}

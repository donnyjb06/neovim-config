return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("dashboard").setup({
        theme = "doom",
        config = {
          header = {
            " ",
            "███╗   ██╗██╗   ██╗██╗███╗   ███╗",
            "████╗  ██║██║   ██║██║████╗ ████║",
            "██╔██╗ ██║██║   ██║██║██╔████╔██║",
            "██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
            "██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
            "╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
            " ",
          },

          center = {
            {
              icon = "  ",
              desc = "Find File",
              action = "Telescope find_files",
              key = "f",
            },
            {
              icon = "󰱼  ",
              desc = "Live Grep",
              action = "Telescope live_grep",
              key = "g",
            },
            {
              icon = "󰒲  ",
              desc = "Lazy",
              action = "Lazy",
              key = "l",
            },
            {
              icon = "  ",
              desc = "LazyGit",
              action = "LazyGit",
              key = "b",
            },
            {
              icon = "  ",
              desc = "Quit",
              action = "qa",
              key = "q",
            },
          },

          footer = {
            "Neovide + Neovim",
          },
        },
      })
    end,
  },
}

return {
  {
    "folke/snacks.nvim",

    priority = 1000,

    lazy = false,

    opts = {
      dashboard = {
        enabled = true,

        preset = {
          header = [[

   ███╗   ██╗██╗   ██╗██╗███╗   ███╗
   ████╗  ██║██║   ██║██║████╗ ████║
   ██╔██╗ ██║██║   ██║██║██╔████╔██║
   ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
   ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
   ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

            Modern Neovim Workspace
          ]],

          keys = {
            {
              icon = " ",
              key = "f",
              desc = "Find File",
              action = ":Telescope find_files",
            },

            {
              icon = "󰱼 ",
              key = "g",
              desc = "Live Grep",
              action = ":Telescope live_grep",
            },

            {
              icon = " ",
              key = "r",
              desc = "Recent Files",
              action = ":Telescope oldfiles",
            },

            {
              icon = "󰦛 ",
              key = "s",
              desc = "Restore Session",
              action = ":lua require('persistence').load({ last = true })",
            },

            {
              icon = "󰉋 ",
              key = "p",
              desc = "Open Projects",
              action = ":cd ~/projects",
            },

            {
              icon = " ",
              key = "c",
              desc = "Open Config",
              action = ":edit ~/.config/nvim/init.lua",
            },

            {
              icon = " ",
              key = "n",
              desc = "Neovim Config Repo",
              action = function()
                vim.cmd("cd ~/.config/nvim")
                vim.cmd("edit ~/.config/nvim/init.lua")
              end,
            },

            {
              icon = "󰒲 ",
              key = "l",
              desc = "Lazy",
              action = ":Lazy",
            },

            {
              icon = " ",
              key = "b",
              desc = "LazyGit",
              action = ":LazyGit",
            },

            {
              icon = " ",
              key = "q",
              desc = "Quit",
              action = ":qa",
            },
          },
        },
      },

      notifier = {
        enabled = true,
      },

      indent = {
        enabled = false,
      },

      scroll = {
        enabled = false,
      },

      input = {
        enabled = true,
      },

      picker = {
        enabled = false,
      },
    },

    config = function(_, opts)
      require("snacks").setup(opts)

      vim.keymap.set("n", "<leader>h", function()
        Snacks.dashboard()
      end, {
        desc = "[H]ome Dashboard",
      })

      vim.api.nvim_set_hl(0, "SnacksDashboardHeader", {
        fg = "#7e9cd8",
      })

      vim.api.nvim_set_hl(0, "SnacksDashboardDesc", {
        fg = "#dcd7ba",
      })

      vim.api.nvim_set_hl(0, "SnacksDashboardIcon", {
        fg = "#98bb6c",
      })

      vim.api.nvim_set_hl(0, "SnacksDashboardKey", {
        fg = "#727169",
      })

      vim.api.nvim_set_hl(0, "SnacksDashboardFooter", {
        fg = "#54546d",
        italic = true,
      })
    end,
  },
}

return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        theme = "dragon",
      })
      vim.cmd("colorscheme kanagawa-dragon")
    end,
  },

  {
    "nvim-tree/nvim-web-devicons",
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      preset = "modern",
      win = {
        border = "rounded",
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)

      wk.add({
        { "<leader>s", group = "[S]earch" },
        { "<leader>c", group = "[C]ode" },
        { "<leader>r", group = "[R]un / Refactor" },
        { "<leader>g", group = "[G]oto" },
        { "<leader>d", group = "[D]iagnostics / Document" },
        { "<leader>x", group = "[T]ests" },
        { "<leader>l", group = "[L]azyGit / Git" },
        { "<leader>q", group = "[Q] Sessions" },
        { "<leader>u", group = "[U]I Toggles" },
        { "<leader>b", group = "[B]uffers" },
      })
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,

        filesystem = {
          hijack_netrw_behavior = "disabled",

          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },

        event_handlers = {
          {
            event = "file_opened",
            handler = function()
              require("neo-tree.command").execute({ action = "close" })
            end,
          },
        },
      })

      vim.keymap.set("n", "<leader>T", "<cmd>Neotree reveal toggle<CR>", {
        desc = "Open File [T]ree",
      })

      vim.keymap.set("n", "<C-s>", "<cmd>Neotree close<CR>", {
        desc = "Close File Tree",
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "javascript",
          "typescript",
          "tsx",
          "html",
          "css",
          "json",
          "lua",
          "bash",
          "python",
          "java",
          "c",
          "cpp",
          "go",
          "rust",
          "yaml",
          "sql",
          "graphql",
        },

        sync_install = false,
        auto_install = true,

        highlight = {
          enable = true,

          disable = {
            "python",
          },

          additional_vim_regex_highlighting = false,
        },

        indent = {
          enable = true,
          disable = {
            "javascript",
            "typescript",
            "tsx",
            "javascriptreact",
            "typescriptreact",
            "html",
            "python",
            "css",
            "json",
            "bash",
            "lua",
          },
        },
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "rebelot/kanagawa.nvim",
    },
    opts = function()
      return require("minim")
    end,
  },
}

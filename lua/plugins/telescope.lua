return {
  {
    "nvim-telescope/telescope.nvim",

    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },

    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          initial_mode = "insert",

          hidden = true,

          file_ignore_patterns = {
            "node_modules",
            ".git/",
            "dist/",
            "build/",
            "%.lock",
          },
        },

        pickers = {
          find_files = {
            hidden = true,
          },

          live_grep = {
            additional_args = function()
              return { "--hidden" }
            end,
          },
        },

        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })

      telescope.load_extension("fzf")

      -- File search
      vim.keymap.set("n", "<leader>sf", builtin.find_files, {
        desc = "[S]earch [F]iles",
      })

      -- Live grep project
      vim.keymap.set("n", "<leader>sg", builtin.live_grep, {
        desc = "[S]earch by [G]rep",
      })

      -- Command palette
      vim.keymap.set("n", "<leader>sp", builtin.commands, {
        desc = "[S]earch Command [P]alette",
      })

      -- Recent files
      vim.keymap.set("n", "<leader>s.", builtin.oldfiles, {
        desc = "[S]earch Recent Files",
      })

      -- Current buffer fuzzy search
      vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, {
        desc = "[/] Fuzzy search in current editor",
      })
    end,
  },
}

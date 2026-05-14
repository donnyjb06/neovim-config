return {
  {
    "folke/todo-comments.nvim",

    event = {
      "BufReadPost",
      "BufNewFile",
    },

    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    config = function()
      require("todo-comments").setup({
        signs = true,

        sign_priority = 8,

        keywords = {
          TODO = {
            icon = " ",
            color = "info",
            alt = { "todo" },
          },

          FIX = {
            icon = " ",
            color = "error",
            alt = { "FIXME", "BUG", "fixme", "bug" },
          },

          HACK = {
            icon = " ",
            color = "warning",
            alt = { "hack" },
          },

          WARN = {
            icon = " ",
            color = "warning",
            alt = { "WARNING", "XXX", "warn", "warning" },
          },

          PERF = {
            icon = " ",
            color = "perf",
            alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE", "perf" },
          },

          NOTE = {
            icon = " ",
            color = "hint",
            alt = { "INFO", "note", "info" },
          },

          TEST = {
            icon = "⏲ ",
            color = "test",
            alt = { "TESTING", "PASSED", "FAILED", "test" },
          },

          ARCH = {
            icon = "󰌗 ",
            color = "arch",
            alt = { "ARCHITECTURE", "DESIGN", "arch", "design" },
          },

          REFACTOR = {
            icon = "󰑕 ",
            color = "refactor",
            alt = { "CLEANUP", "REWORK", "refactor", "cleanup" },
          },

          QUESTION = {
            icon = " ",
            color = "question",
            alt = { "ASK", "QUESTION", "question", "ask" },
          },
        },

        gui_style = {
          fg = "NONE",
          bg = "BOLD",
        },

        merge_keywords = true,

        highlight = {
          multiline = true,
          multiline_pattern = "^.",
          multiline_context = 10,

          before = "",
          keyword = "wide",
          after = "fg",

          pattern = [[.*<(KEYWORDS)\s*:]],
          comments_only = true,

          max_line_len = 400,
          exclude = {},
        },

        colors = {
          error = { "#e82424" },
          warning = { "#ff9e3b" },
          info = { "#7e9cd8" },
          hint = { "#98bb6c" },
          default = { "#dcd7ba" },

          perf = { "#957fb8" },
          test = { "#7fb4ca" },
          arch = { "#ffa066" },
          refactor = { "#d27e99" },
          question = { "#c8c093" },
        },

        search = {
          command = "rg",

          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
          },

          pattern = [[\b(KEYWORDS):]],
        },
      })

      vim.keymap.set("n", "]t", function()
        require("todo-comments").jump_next()
      end, {
        desc = "Next Todo Comment",
      })

      vim.keymap.set("n", "[t", function()
        require("todo-comments").jump_prev()
      end, {
        desc = "Previous Todo Comment",
      })
    end,
  },
}

return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",

    branch = "main",

    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },

    build = "make tiktoken",

    config = function()
      require("CopilotChat").setup({
        debug = false,

        temperature = 0.1,

        window = {
          layout = "vertical",
          width = 0.38,
          border = "rounded",
        },

        mappings = {
          complete = {
            insert = "<Tab>",
          },

          close = {
            normal = "q",
            insert = "<C-c>",
          },

          reset = {
            normal = "<C-r>",
            insert = "<C-r>",
          },

          submit_prompt = {
            normal = "<CR>",
            insert = "<C-CR>",
          },

          accept_diff = {
            normal = "<C-y>",
            insert = "<C-y>",
          },

          yank_diff = {
            normal = "gy",
          },

          show_diff = {
            normal = "gd",
          },

          show_system_prompt = {
            normal = "gp",
          },

          show_user_selection = {
            normal = "gs",
          },
        },
      })

      vim.keymap.set("n", "<leader>Aa", "<cmd>CopilotChatToggle<CR>", {
        desc = "[A]I Toggle Chat",
      })

      vim.keymap.set("v", "<leader>Ae", function()
        require("CopilotChat").ask("Explain this code in detail.")
      end, {
        desc = "[A]I [E]xplain Code",
      })

      vim.keymap.set("v", "<leader>Ar", function()
        require("CopilotChat").ask("Review this code and suggest improvements.")
      end, {
        desc = "[A]I Code [R]eview",
      })

      vim.keymap.set("v", "<leader>Af", function()
        require("CopilotChat").ask("Fix bugs and issues in this code.")
      end, {
        desc = "[A]I [F]ix Code",
      })

      vim.keymap.set("v", "<leader>At", function()
        require("CopilotChat").ask("Generate comprehensive tests for this code.")
      end, {
        desc = "[A]I Generate [T]ests",
      })

      vim.keymap.set("v", "<leader>Ao", function()
        require("CopilotChat").ask("Optimize and refactor this code.")
      end, {
        desc = "[A]I [O]ptimize Code",
      })
    end,
  },
}

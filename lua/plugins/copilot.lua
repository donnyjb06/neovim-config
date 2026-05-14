return {
  {
    "zbirenbaum/copilot.lua",

    cmd = "Copilot",
    event = "InsertEnter",

    config = function()
      require("copilot").setup({
        panel = {
          enabled = false,
        },

        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 5000,
          -- Important:
          -- Keep Copilot visible even if nvim-cmp has suggestions open.
          hide_during_completion = false,

          keymap = {
            accept = "<C-y>",
            accept_word = "<C-w>",
            accept_line = "<C-l>",

            next = "<M-]>",
            prev = "<M-[>",

            dismiss = "<C-e>",
          },
        },

        filetypes = {
          yaml = true,
          markdown = true,
          help = false,
          gitcommit = true,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
      })
    end,
  },
}

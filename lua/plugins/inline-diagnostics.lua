return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",

    event = "VeryLazy",

    priority = 1000,

    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "modern",

        transparent_bg = true,
        transparent_cursorline = true,

        options = {
          show_source = {
            enabled = false,
          },

          multilines = {
            enabled = false,
          },

          overflow = {
            mode = "wrap",
          },

          virt_texts = {
            priority = 2048,
          },
        },
      })

      vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#e82424" })
      vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#ff9e3b" })
      vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#7e9cd8" })
      vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#98bb6c" })
    end,
  },
}

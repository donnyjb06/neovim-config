return {
  {
    "stevearc/conform.nvim",

    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },

        typescript = { "prettier" },
        typescriptreact = { "prettier" },

        json = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },

        lua = { "stylua" },

        python = { "ruff_format" },

        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
      },

      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    },
  },
}

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "[G]oto [R]eferences" })
      vim.keymap.set("n", "<leader>gI", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
      vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
      vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Jump to Type [D]efinition" })

      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
      vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[N]ame Symbol" })

      vim.keymap.set("n", "<leader>dn", function()
        vim.diagnostic.jump({ count = 1, float = true })
      end, { desc = "[D]iagnostic [N]ext Problem" })

      vim.keymap.set("n", "<leader>dp", function()
        vim.diagnostic.jump({ count = -1, float = true })
      end, { desc = "[D]iagnostic [P]revious Problem" })

      vim.keymap.set("n", "<leader>ds", function()
        require("telescope.builtin").lsp_document_symbols()
      end, { desc = "[D]ocument [S]ymbols" })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },

    opts = {
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "eslint",
        "jsonls",
        "pyright",
        "jdtls",
        "rust_analyzer",
        "bashls",
        "lua_ls",
        "yamlls",
        "dockerls",
        "docker_compose_language_service",
        "sqlls",
        "prismals",
        "graphql",
        "marksman",
      },
    },
  },
}

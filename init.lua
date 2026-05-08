require("config.options")
require("config.keymaps")
require("config.autocmds")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins.ui" },
  { import = "plugins.dashboard" },
  { import = "plugins.telescope" },
  { import = "plugins.grapple" },
  { import = "plugins.lsp" },
  { import = "plugins.completion" },
  { import = "plugins.formatting" },
  { import = "plugins.git" },
  { import = "plugins.terminal" },
  { import = "plugins.session" },
  { import = "plugins.diagnostics" },
  { import = "plugins.autopairs" },
  { import = "plugins.testing" },
  { import = "plugins.aerial" },
  { import = "plugins.file-operations" },
  { import = "plugins.autotag" },
  { import = "plugins.context" },
  { import = "plugins.oil" },
  { import = "plugins.inline-diagnostics" },
  { import = "plugins.indentscope" },
  { import = "plugins.flash" },
  { import = "plugins.bufferline" },
  { import = "plugins.noice" },
  { import = "plugins.surround" },
})

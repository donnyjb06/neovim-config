vim.keymap.set("n", "<leader>f", "<cmd>write<CR>", { desc = "[F]save File" })

vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], {
  desc = "Exit terminal mode",
})

if vim.g.neovide then
  vim.keymap.set({ "n", "v" }, "<C-v>", '"+p', { desc = "Paste from system clipboard" })
  vim.keymap.set("i", "<C-v>", "<C-r>+", { desc = "Paste from system clipboard" })
  vim.keymap.set("c", "<C-v>", "<C-r>+", { desc = "Paste into command line" })

  vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy to system clipboard" })
end

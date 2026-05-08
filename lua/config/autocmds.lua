vim.api.nvim_create_autocmd({
  "FocusLost",
  "BufLeave",
  "TabLeave",
}, {
  callback = function()
    if vim.bo.modified and vim.bo.modifiable and vim.bo.buftype == "" then
      vim.cmd("silent! write")
    end
  end,
})

vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.wrap = false
vim.opt.softtabstop = 2
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.mouse = "a"
vim.opt.undofile = true

vim.o.guifont = "JetBrainsMono Nerd Font:h14"

-- Transparency
vim.g.neovide_opacity = 0.92
vim.g.transparency = 0.92
vim.g.neovide_background_color =
    "#0f1117" .. string.format("%x", math.floor(255 * vim.g.transparency))

vim.g.neovide_title_background_color =
    "#0f1117" .. string.format("%x", math.floor(255 * vim.g.transparency))
vim.g.neovide_window_vibrancy = "dark"

-- Fullscreen
vim.g.neovide_scale_factor = 1.0
vim.g.neovide_fullscreen = false
vim.g.neovide_corner_preference = "round"

-- Cursor VFX
vim.g.neovide_cursor_vfx_mode = "railgun"

-- Cursor animation
vim.g.neovide_cursor_animation_length = 0.08
vim.g.neovide_cursor_trail_size = 0.3
vim.g.neovide_cursor_antialiasing = true

-- Smooth scrolling
vim.g.neovide_scroll_animation_length = 0.15

-- Blur
vim.g.neovide_floating_blur_amount_x = 1.0
vim.g.neovide_floating_blur_amount_y = 1.0

-- Padding
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_left = 0
vim.g.neovide_padding_right = 0

-- Hide mouse while typing
vim.g.neovide_hide_mouse_when_typing = true

-- Refresh rate
vim.g.neovide_refresh_rate = 144

local nvm_node_bin = vim.fn.expand("~/.nvm/versions/node/v24.15.0/bin")

if vim.fn.isdirectory(nvm_node_bin) == 1 then
  vim.env.PATH = nvm_node_bin .. ":" .. vim.env.PATH
end

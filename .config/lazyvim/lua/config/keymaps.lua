-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- In the terminal, use ESC to go from TERMINAL mode to NORMAL mode.
vim.api.nvim_set_keymap(
  't', '<ESC>', '<C-\\><C-n>', {noremap=true}
)

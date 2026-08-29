-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- In the terminal, use ESC to go from TERMINAL mode to NORMAL mode.
vim.api.nvim_set_keymap(
  't', '<ESC>', '<C-\\><C-n>', {noremap=true}
)

-- Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard", noremap = true })
vim.keymap.set("n", "<leader>Y", '"+y$', { desc = "Yank to end of line to system clipboard", noremap = true })
-- Paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard", noremap = true })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste before from system clipboard", noremap = true })

-- Use \ instead of | for side-by-side (vertical) splits
vim.keymap.del("n", "<leader>|")
vim.keymap.set("n", "<leader>\\", "<C-W>v", { desc = "Split window right", remap = true })

-- Yank absolute path of current file to system clipboard
vim.keymap.set("n", "<leader>fy", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end, { desc = "Yank absolute file path to system clipboard" })

-- Zen/zoom: <leader>uz zooms, <leader>uZ is the fuller zen window
Snacks.toggle.zoom():map("<leader>uz")
Snacks.toggle.zen():map("<leader>uZ")

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.snacks_animate = false

-- Use absolute line numbers instead of relative
vim.opt.relativenumber = false

-- Width used by gq/gw to reflow text
vim.opt.textwidth = 80

-- Disable LazyVim auto format
vim.g.autoformat = false

vim.g.lazyvim_python_lsp = "ty"

-- Fix yank freezing when connected via zellij.
-- OSC 52 to write the clipboard, but read locally: zellij never answers the
-- OSC 52 read query, which otherwise freezes nvim ~10s on register ops.
local function osc52_paste()
  return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
end
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = osc52_paste,
    ["*"] = osc52_paste,
  },
}

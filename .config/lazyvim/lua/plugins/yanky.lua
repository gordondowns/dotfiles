-- Move yanky's "Open Yank History" off <leader>p (freed for system-clipboard
-- paste in config/keymaps.lua) to <leader>sy, alongside LazyVim's other pickers.
return {
  {
    "gbprod/yanky.nvim",
    keys = {
      { "<leader>p", false }, -- drop default; reclaimed for clipboard paste
      {
        "<leader>sy",
        function()
          if LazyVim.pick.picker.name == "telescope" then
            require("telescope").extensions.yank_history.yank_history({})
          elseif LazyVim.pick.picker.name == "snacks" then
            Snacks.picker.yanky()
          else
            vim.cmd([[YankyRingHistory]])
          end
        end,
        mode = { "n", "x" },
        desc = "Open Yank History",
      },
    },
  },
}

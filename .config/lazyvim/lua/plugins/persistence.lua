-- Override LazyVim's default <leader>qd to *also* quit, not just disable
-- session-save. The default is silent and easy to mistake for "nothing happened".
return {
  "folke/persistence.nvim",
  keys = {
    { "<leader>qd", false }, -- drop default binding
    {
      "<leader>qd",
      function()
        require("persistence").stop()
        vim.cmd("qa")
      end,
      desc = "Quit Without Saving Session",
    },
  },
}

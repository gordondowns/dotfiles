return {
  {
    "akinsho/git-conflict.nvim",
    lazy = false,
    opts = {
      -- Merged over git-conflict's defaults; next/prev stay ]x/[x.
      -- Set buffer-local only in files that contain conflict markers,
      -- so if they appear to be missing from the menu, that's probably why.
      default_mappings = {
        ours = "<leader>gho",
        theirs = "<leader>ght",
        none = "<leader>ghn",
        both = "<leader>gh2",
      },
    },
    keys = {
      {
        "<leader>gx",
        "<cmd>GitConflictListQf<cr>",
        desc = "List Conflicts",
      },
      {
        "<leader>gX",
        "<cmd>GitConflictRefresh<cr>",
        desc = "Refresh Conflicts",
      },
    },
  },
}

return {
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      {
        "<leader>hb",
        "<cmd>Gitsigns blame_line<cr>",
        desc = "Blame Line",
      },
      {
        "<leader>hs",
        "<cmd>Gitsigns stage_hunk<cr>",
        desc = "Stage Hunk",
      },
      {
        "<leader>hS",
        "<cmd>Gitsigns stage_buffer<cr>",
        desc = "Stage Buffer",
      },
      {
        "<leader>hr",
        "<cmd>Gitsigns reset_hunk<cr>",
        desc = "Reset Hunk",
      },
      {
        "<leader>hR",
        "<cmd>Gitsigns reset_buffer<cr>",
        desc = "Reset Buffer",
      },
      {
        "<leader>hu",
        "<cmd>Gitsigns undo_stage_hunk<cr>",
        desc = "Undo Stage Hunk",
      },
    },
    {
      "akinsho/git-conflict.nvim",
      lazy = false,
      opts = {
        default_mappings = {
          ours = "<leader>ho",
          theirs = "<leader>ht",
          none = "<leader>h0",
          both = "<leader>hb",
          next = "]x",
          prev = "[x",
        },
      },
      keys = {
        {
          "<leader>gx",
          "<cmd>GitConflictListQf<cr>",
          desc = "List Conflicts",
        },
        {
          "<leader>gr",
          "<cmd>GitConflictRefresh<cr>",
          desc = "Refresh Conflicts",
        },
      },
    },
  },
}

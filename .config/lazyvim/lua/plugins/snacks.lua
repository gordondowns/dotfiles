return {
  {
    "folke/snacks.nvim",
    -- <leader>gd is diffview's (see plugins/diffview.lua); drop the picker's
    -- claim on it so the two don't race to own the key at startup.
    keys = {
      { "<leader>gd", false },
    },
    opts = {
      -- Zen is a zoom with extra chrome removed; the scope dimming just gets
      -- in the way of reading the rest of the buffer.
      zen = { toggles = { dim = false } },
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
          files = {
            hidden = true,
            ignored = true,
          },
          grep = {
            hidden = true,
            ignored = true,
          },
        },
      },
    },
  },
}

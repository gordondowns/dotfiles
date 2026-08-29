return {
  -- add tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "night",
      on_colors = function(colors)
        colors.border = "#404040"
      end,
      on_highlights = function(hl, colors)
        -- Inline `code` background: a subtle lift off Normal (#1a1b26) instead
        -- of the default ColorColumn, which is too strong for code-heavy prose.
        hl.RenderMarkdownCodeInline = { bg = "#1f2230" }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}

-- Accept completions with <Tab> only: super-tab leaves <CR> unmapped so it
-- always inserts a newline, and <C-y> is disabled since LazyVim binds it to
-- select_and_accept.
return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "super-tab",
      ["<C-y>"] = false,
    },
  },
}

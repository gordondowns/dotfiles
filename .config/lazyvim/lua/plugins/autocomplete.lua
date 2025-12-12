return {
  'saghen/blink.cmp',
  opts = {
    keymap = {
      -- Change from enter completion to tab completion
      preset = 'super-tab',
      ['<Tab>'] = {
        function(cmp)
          if cmp.snippet_active() then return cmp.accept()
          else return cmp.select_and_accept() end
        end,
        'snippet_forward',
        'fallback'
      }
    },
    -- I couldn't get the ghost text to go away. This seems to be the right solution
    -- based on what I read online, but it makes blink.cmp stop working entirely.
    -- ghost_text = {enabled = false},
  }
}

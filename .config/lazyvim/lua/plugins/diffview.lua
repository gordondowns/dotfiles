-- Side-by-side diff review (Gerrit-style): file panel + 2-way diff for a
-- revision range. Read a change here, edit small things in place, and leave the
-- rest to whichever AI CLI is running in the worktree. diffview's in-view
-- keymaps are buffer-local to its own tab, so only <leader>gd / <leader>gv are
-- global.
--
-- Navigate a review once open: <tab> / <s-tab> across files, ]h / [h across hunks.

-- Open the review. Empty (the default) shows uncommitted changes vs HEAD. Type a
-- rev (HEAD~1) to diff it against the working tree, or a range (rev..HEAD /
-- rev...HEAD) for committed diffs only. Untracked files show in every view that
-- involves the working tree (see the show_untracked override below).
local function open_review()
  vim.ui.input({
    prompt = "Diffview range (empty = HEAD..<working-tree>): ",
    default = "",
  }, function(input)
    -- nil means the prompt was cancelled; "" means accept the working-tree view.
    if input ~= nil then
      vim.cmd("DiffviewOpen " .. input)
    end
  end)
end

-- Toggle: close the review tab if one is already showing, else open it.
local function toggle_review()
  if require("diffview.lib").get_current_view() then
    vim.cmd("DiffviewClose")
  else
    open_review()
  end
end

-- diffview has no hunk action of its own; its buffers are vim diff-mode, so the
-- change motions ]c / [c are what actually move between hunks. Bind ]h / [h to
-- them to keep the gitsigns muscle memory inside the review view.
local function next_hunk()
  vim.cmd("normal! ]c")
end
local function prev_hunk()
  vim.cmd("normal! [c")
end

-- diffview only lists untracked files when comparing the index against the
-- working tree, so any explicit rev hides them. Widen that to every comparison
-- where the working tree is one side (a bare view or a single rev), while still
-- hiding them for commit-to-commit ranges where they don't belong. This adjusts
-- only diffview's in-memory file listing and never touches git state. It reaches
-- into a plugin internal, so it may need revisiting if diffview restructures.
local function show_untracked_against_revs()
  local GitAdapter = require("diffview.vcs.adapters.git").GitAdapter
  local RevType = require("diffview.vcs.rev").RevType
  local orig = GitAdapter.show_untracked
  GitAdapter.show_untracked = function(self, opt)
    opt = opt or {}
    if opt.revs and opt.revs.right and opt.revs.right.type == RevType.LOCAL then
      local out = self:exec_sync(
        { "config", "status.showUntrackedFiles" },
        { cwd = self.ctx.toplevel, silent = true }
      )
      return vim.trim(out[1] or "") ~= "no"
    end
    return orig(self, opt)
  end
end

return {
  {
    -- diffview shadows the fold keys (zR, za, ...) in its diff buffers with
    -- shims that replay the fold command in every diff window, all tagged
    -- desc = "diffview_ignore" so diffview's own help panel skips them.
    -- Which-key would otherwise display that sentinel as the label; filter
    -- those maps out of its tree so its preset fold descriptions show
    -- instead. The maps themselves still run — which-key feeds the keys
    -- back with remap, which hits the buffer-local shims.
    "folke/which-key.nvim",
    opts = {
      filter = function(mapping)
        return mapping.desc ~= "diffview_ignore"
      end,
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory", "DiffviewFocusFiles" },
    keys = {
      { "<leader>gd", toggle_review, desc = "Diffview: review range" },
      { "<leader>gv", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview: file history" },
    },
    opts = {
      keymaps = {
        view = {
          { "n", "]h", next_hunk, { desc = "Next hunk" } },
          { "n", "[h", prev_hunk, { desc = "Previous hunk" } },
        },
      },
    },
    config = function(_, opts)
      require("diffview").setup(opts)
      show_untracked_against_revs()
    end,
  },
}

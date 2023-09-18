require("copilot").setup({
  suggestion = { enabled = false },
  panel = {
    enabled = true,
    auto_refresh = true,
  },
})

require("copilot_cmp").setup()

vim.keymap.set('n', '<leader>cop', function() require("copilot.panel").open({ position = "right" }) end, { desc = "[CoPi] Open suggestions pannel" })

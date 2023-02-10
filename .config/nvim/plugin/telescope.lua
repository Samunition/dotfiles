local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>rr', builtin.lsp_references)
vim.keymap.set('n', '<leader>d', builtin.lsp_definitions)
vim.keymap.set('n', '<leader>dd', builtin.diagnostics)

local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  }
}

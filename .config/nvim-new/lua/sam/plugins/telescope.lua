return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        vim.keymap.set('n', '<leader>ff', builtin.find_files)
        vim.keymap.set('n', '<leader>fg', builtin.live_grep)
        vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols)
        vim.keymap.set('n', '<leader>fw', builtin.grep_string)
        vim.keymap.set('n', '<leader>rr', builtin.lsp_references)
        vim.keymap.set('n', '<leader>d', builtin.lsp_definitions)
        vim.keymap.set('n', '<leader>td', builtin.lsp_type_definitions)
        vim.keymap.set('n', '<leader>dd', builtin.diagnostics)
        vim.keymap.set('n', '<leader>man', builtin.man_pages)
        vim.keymap.set('n', '<leader>help', builtin.help_tags)

        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<ESC>"] = actions.close,
                    },
                },
                file_ignore_patterns = { "node_modules", ".git", "target", "dist", "build", ".cargo" },
            },
            pickers = {
                find_files = {
                    find_command = { "fd", "--type", "f", "--hidden" },
                },
            },
        })
        require('telescope').load_extension('fzf')
    end,
}

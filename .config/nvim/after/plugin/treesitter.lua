require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "html",
        "javascript",
        "typescript",
        "markdown",
        "kotlin",
        "hcl",
        "rust",
    },

    sync_install = false,
    highlight = { enable = true, additional_vim_regex_highlighting = false }
}

-- Reset overriden starting fold level :(
vim.wo.foldlevel = 99

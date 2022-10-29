require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "html",
        "javascript",
        "typescript",
        "markdown",
        "kotlin",
        "hcl"
    },

    highlight = { enable = true },
}

-- Reset overriden starting fold level :(
vim.wo.foldlevel = 99

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        vim.opt.foldenable = false
        vim.opt.foldlevel = 99
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "vim",
                "vimdoc",
                "javascript",
                "typescript",
                "markdown",
                "bash",
                "lua",
                "rust",
                "hcl",
            },
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true,
            sync_install = false,
        })
    end,
}

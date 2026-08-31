return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        vim.opt.foldenable = false
        vim.opt.foldlevel = 99
        require("nvim-treesitter").setup()

        local ensureInstalled = {
            "awk",
            "bash",
            "c",
            "c_sharp",
            "cpp",
            "css",
            "csv",
            "diff",
            "dockerfile",
            "editorconfig",
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",
            "go",
            "groovy",
            "hcl",
            "helm",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "nginx",
            "nix",
            "python",
            "regex",
            "rust",
            "sql",
            "terraform",
            "typescript",
            "vim",
            "vimdoc",
            "yaml",
            "zig",
        }
        local alreadyInstalled = require('nvim-treesitter').get_installed()
        local parsersToInstall = vim.iter(ensureInstalled)
            :filter(function(parser)
                return not vim.tbl_contains(alreadyInstalled, parser)
            end)
            :totable()
        require('nvim-treesitter').install(parsersToInstall)

        vim.api.nvim_create_autocmd('FileType', {
            callback = function()
                pcall(vim.treesitter.start)
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}

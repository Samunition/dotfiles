return {
    "nvim-lua/plenary.nvim",
    "tpope/vim-commentary",
    "tpope/vim-fugitive",
    "sindrets/diffview.nvim",
    {
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup() end,
    },
    {
        "stevearc/quicker.nvim",
        ft = "qf",
        event = 'QuickFixCmdPost',
        opts = {},
    },
}

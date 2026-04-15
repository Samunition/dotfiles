return {
    "nvim-lua/plenary.nvim",
    "tpope/vim-commentary",
    "tpope/vim-fugitive",
    "sindrets/diffview.nvim",
    {
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup() end,
    },
}

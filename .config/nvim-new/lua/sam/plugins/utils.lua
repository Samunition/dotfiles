return {
    "nvim-lua/plenary.nvim",
    "tpope/vim-commentary",
    "sindrets/diffview.nvim",
    {
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup() end,
    },
}

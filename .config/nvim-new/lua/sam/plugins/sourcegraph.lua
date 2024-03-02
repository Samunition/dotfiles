return {
    "sourcegraph/sg.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("sg").setup()
    end
}

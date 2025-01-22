return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-Space'] = cmp.mapping.complete(),
                ['<C-a>'] = cmp.mapping.complete({
                    sources = {
                        { name = "copilot" },
                        { name = "cody" },
                    },
                }),
            }),
            sources = cmp.config.sources({
                { name = "cody" },
                { name = "nvim_lsp" },
                { name = 'nvim_lsp_signature_help' },
                { name = "copilot" },
                { name = "path" },
                { name = "buffer" },
            }),
            formatting = {
                format = function(entry, vim_item)
                    local tags = {
                        buffer = "[Buff]",
                        nvim_lsp = "[LSP]",
                        nvim_lsp_signature_help = "[LSP]",
                        luasnip = "[Snip]",
                        copilot = "[CoPi]",
                        cody = "[Cody]",
                    }
                    vim_item.menu = tags[entry.source.name]
                    return vim_item
                end,
            },
        })
    end,
}

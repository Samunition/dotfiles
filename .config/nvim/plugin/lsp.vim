set completeopt=menuone,noinsert,noselect
nnoremap <leader>d <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>i <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>sd <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>rr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>sh <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>K <cmd>lua vim.lsp.buf.hover()<CR>

autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua <<EOLUA
    local cmp = require('cmp')

    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
            ['<C-y>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), { 'i', 's' }),
            ['<C-e>'] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
            { name = 'path' },
            { name = 'buffer', keyword_length = 5 },
        }),
        formatting = {
            format = function(entry, vim_item)
                local tags = {
                    buffer = "[Buff]",
                    nvim_lsp = "[LSP]",
                    vsnip = "[Snip]",
                    nvim_lua = "[Lua]",
                }
                vim_item.menu = tags[entry.source.name]
                return vim_item
            end,
        },
    })
    
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = {
            "bashls", "clangd", "eslint", "gopls", "tsserver", "sumneko_lua",
            "kotlin_language_server", "rust_analyzer", "terraformls", "tflint",
        },
    })
    require('lspconfig').bashls.setup({ capabilities = capabilities })
    require('lspconfig').tsserver.setup({ capabilities = capabilities })
    require('lspconfig').eslint.setup({ capabilities = capabilities })
    require('lspconfig').kotlin_language_server.setup({ capabilities = capabilities, settings = { kotlin = { compiler = { jvm = { target = "1.8" }}}} })
    require('lspconfig').java_language_server.setup({ cmd = { 'java-language-server' }, capabilities = capabilities })
    require('lspconfig').rust_analyzer.setup({ capabilities = capabilities })
    require('lspconfig').gopls.setup({ capabilities = capabilities })
    require('lspconfig').terraformls.setup({ capabilities = capabilities })
    require('lspconfig').tflint.setup({ capabilities = capabilities })
    require('lspconfig').clangd.setup({ capabilities = capabilities })
    require('lspconfig').sumneko_lua.setup({ capabilities = capabilities })
EOLUA

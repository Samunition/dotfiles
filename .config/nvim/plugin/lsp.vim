set completeopt=menuone,noinsert,noselect
nnoremap <leader>d <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>i <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>sd <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>rr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>sh :lua vim.lsp.buf.signature_help()<CR>

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua <<EOLUA
    local cmp = require('cmp')
    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        mapping = {
            ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 's' }),
            ['<C-y>'] = cmp.config.disable,
            ['<C-e>'] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
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
    
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    require('lspconfig').tsserver.setup{ capabilities = capabilities }
    require('lspconfig').eslint.setup{ capabilities = capabilities }
    -- require('lspconfig').sonarlint.setup{ capabilities = capabilities }
    require('lspconfig').kotlin_language_server.setup{ capabilities = capabilities, settings = { kotlin = { compiler = { jvm = { target = "1.8" }}}} }
    require('lspconfig').java_language_server.setup{ cmd = { 'java-language-server' }, capabilities = capabilities }
EOLUA

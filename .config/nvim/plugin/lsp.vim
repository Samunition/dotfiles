set completeopt=menuone,noinsert,noselect
nnoremap <leader>d <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <leader>i <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>sd <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>rr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require('lspconfig').tsserver.setup{ on_attach=require('completion').on_attach } 


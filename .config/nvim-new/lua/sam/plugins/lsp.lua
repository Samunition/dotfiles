return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
    },
    config = function()
        vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, { desc = "[d]efinition" })
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, { desc = "[g]oto [d]eclaration" })
        vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation, { desc = "[i]mplementation" })
        vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, { desc = "[s]how [d]iagnostics" })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[r]e[n]ame" })
        vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, { desc = "[r]efe[r]ences" })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode [a]ction" })
        vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "[s]ignature [h]elp" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover)

        local capabilities = vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        )
        -- updated_capabilities.textDocument.completion.completionItem.insertReplaceSupport = false ??
        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",
                "lua_ls",
                "tsserver",
                "rust_analyzer",
                "bashls",
                "gopls",
            },
            handlers = {
                function(server_name) -- default handler
                    require("lspconfig")[server_name].setup({ capabilities = capabilities })
                end,
                ["lua_ls"] = function ()
                    require("lspconfig")["lua_ls"].setup({
                        settings = {
                            Lua = {
                                runtime = { version = "LuaJIT" },
                                workspace = {
                                    checkThirdParty = false,
                                    library = {
                                        "${3rd}/luv/library",
                                        unpack(vim.api.nvim_get_runtime_file("", true)),
                                    }
                                },
                                completion = {
                                    callSnippet = "Replace",
                                },
                            },
                        },
                    })
                end
            },
        })
    end,
}

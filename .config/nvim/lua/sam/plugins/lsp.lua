return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
        "stevearc/conform.nvim",
        "https://gitlab.com/schrieveslaach/sonarlint.nvim",
    },
    config = function()
        vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, { desc = "[d]efinition" })
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, { desc = "[g]oto [d]eclaration" })
        vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation, { desc = "[i]mplementation" })
        vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, { desc = "[s]how [d]iagnostics" })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[r]e[n]ame" })
        -- handled by telescope
        -- vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, { desc = "[r]efe[r]ences" })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode [a]ction" })
        vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, { desc = "[s]ignature [h]elp" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover)

        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",
                "lua_ls",
                "ts_ls",
                "rust_analyzer",
                "bashls",
                "gopls",
                "zls",
            },
            handlers = {
                function(server_name) -- default handler
                    require("lspconfig")[server_name].setup({ capabilities = capabilities })
                end,
                ["lua_ls"] = function()
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

        require("sonarlint").setup({
            server = {
                cmd = {
                    'sonarlint-language-server',
                    '-stdio',
                    '-analyzers',
                    -- paths to the analyzers you need, using those for python and java in this example
                    vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjs.jar"),
                },
            },
            filetypes = { "javascript", "typescript", "sh" }
        })

        require("conform").setup {
            formatters_by_ft = {
                typescript = { "prettier" },
                javascript = { "prettier" },
            },
        }

        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function(args)
                require("conform").format {
                    bufnr = args.buf,
                    lsp_fallback = true,
                    -- quiet = true,
                }
            end,
        })
    end,
}

return {
    {
        "zbirenbaum/copilot.lua",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end
    },
    {
        "zbirenbaum/copilot-cmp",
        config = function()
            require("copilot_cmp").setup()
        end
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        build = "make tiktoken",
        config = function()
            local chat = require("CopilotChat")
            chat.setup({
                prompts = {
                    Review = {
                        prompt =
                        "/COPILOT_REVIEW\n\nOnly include responses where the line(s) have issues",
                    },
                },
            })

            local review = function()
                vim.diagnostic.enable(true, { ns_id = vim.api.nvim_create_namespace("copilot_diagnostics") })
                vim.cmd("CopilotChatReview")
            end

            local toggle_diagnostics = function()
                local filter = { ns_id = vim.api.nvim_create_namespace("copilot_diagnostics") }
                vim.diagnostic.enable(not vim.diagnostic.is_enabled(filter), filter)
            end

            vim.keymap.set('n', "<leader>ai", "<cmd>CopilotChatToggle<cr>", { desc = "[a][i] toggle" })
            vim.keymap.set('n', "<leader>ar", review, { desc = "[a]i [r]eview" })
            vim.keymap.set('n', "<leader>ad", toggle_diagnostics, { desc = "[a]i [d]iagnostics toggle" })
        end
    },
}

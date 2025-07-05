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
                chat_autocomplete = false,
                providers = {
                    github_models = {
                        disabled = true,
                    },
                },
                prompts = {
                    Review = {
                        prompt =
                        "/COPILOT_REVIEW\n\nTitle your output as Review\nOnly include responses where the line(s) have issues",
                        callback = function(response, source)
                            -- Adapted from CopilotChat.nvim/lua/CopilotChat/config.lua
                            local lines = response:gmatch('[^\r\n]+')
                            if (lines() ~= "# Review") then
                                return
                            end

                            local diagnostics = {}
                            for line in lines do
                                if line:find('^line=') then
                                    local start_line = nil
                                    local end_line = nil
                                    local message = nil
                                    local single_match, message_match = line:match('^line=(%d+): (.*)$')
                                    if not single_match then
                                        local start_match, end_match, m_message_match = line:match(
                                            '^line=(%d+)-(%d+): (.*)$')
                                        if start_match and end_match then
                                            start_line = tonumber(start_match)
                                            end_line = tonumber(end_match)
                                            message = m_message_match
                                        end
                                    else
                                        start_line = tonumber(single_match)
                                        end_line = start_line
                                        message = message_match
                                    end

                                    if start_line and end_line then
                                        table.insert(diagnostics, {
                                            lnum = start_line - 1,
                                            end_lnum = end_line - 1,
                                            col = 0,
                                            message = message,
                                            severity = vim.diagnostic.severity.HINT,
                                            source = 'Copilot Review',
                                            underline = false,
                                        })
                                    end
                                end
                            end
                            vim.diagnostic.set(
                                vim.api.nvim_create_namespace('copilot_review'),
                                source.bufnr,
                                diagnostics
                            )
                        end,

                    },
                },
            })

            local review = function()
                vim.diagnostic.enable(true, { ns_id = vim.api.nvim_create_namespace("copilot_review") })
                vim.cmd("CopilotChatReview")
            end

            local toggle_diagnostics = function()
                local filter = { ns_id = vim.api.nvim_create_namespace("copilot_review") }
                vim.diagnostic.enable(not vim.diagnostic.is_enabled(filter), filter)
            end

            vim.keymap.set('n', "<leader>ai", "<cmd>CopilotChatToggle<cr>", { desc = "[a][i] toggle" })
            vim.keymap.set('n', "<leader>ar", review, { desc = "[a]i [r]eview" })
            vim.keymap.set('n', "<leader>ad", toggle_diagnostics, { desc = "[a]i [d]iagnostics toggle" })
        end
    },
}

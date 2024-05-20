return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui",
        "mxsdev/nvim-dap-vscode-js",
        {
            "microsoft/vscode-js-debug",
            tag= "v1.74.1",
            build = "PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=true npm install --legacy-peer-deps && npm run compile",
        },
    },
    config = function ()
        local dap = require("dap")
        local dapui = require("dapui")

        dapui.setup()
        vim.keymap.set('n', '<leader>bp', dap.toggle_breakpoint, { desc = "[DAP] toggle_breakpoint" })
        vim.keymap.set("n", "<F1>", dap.step_back, { desc = "[DAP] step_back" })
        vim.keymap.set("n", "<F2>", dap.step_into, { desc = "[DAP] step_into" })
        vim.keymap.set("n", "<F3>", dap.step_over, { desc = "[DAP] step_over" })
        vim.keymap.set("n", "<F4>", dap.step_out, { desc = "[DAP] step_out" })
        vim.keymap.set("n", "<F5>", dap.continue, { desc = "[DAP] continue" })
        vim.keymap.set("n", "<leader>dap", dap.repl.open, { desc = "[DAP] open repl" })
        vim.keymap.set("n", "<leader>dapui", dapui.toggle, { desc = "[DAP] toggle ui" })

        require("dap-vscode-js").setup({
            debugger_path = "/home/sam/.local/share/nvim/lazy/vscode-js-debug",
            adapters = { 'pwa-node', 'node-terminal' },
        })

        for _, language in ipairs({ "typescript", "javascript" }) do
            dap.configurations[language] = {
                {
                    type = "pwa-node",
                    request = "attach",
                    name = "Attach",
                    processId = require("dap.utils").pick_process,
                    cwd = "${workspaceFolder}",
                }
            }
        end
    end,
}

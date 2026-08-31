return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui",
        "mxsdev/nvim-dap-vscode-js",
        {
            "microsoft/vscode-js-debug",
            build = "npm install --legacy-peer-deps && npx gulp dapDebugServer",
        },
        "leoluz/nvim-dap-go",
    },
    config = function()
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
            debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
            adapters = { 'pwa-node', 'node-terminal' },
        })

        for _, adapter in ipairs({ "pwa-node", "node-terminal" }) do
            dap.adapters[adapter] = {
                type = "server",
                host = "localhost",
                port = "${port}",
                executable = {
                    command = "node",
                    args = { vim.fn.stdpath("data") .. "/lazy/vscode-js-debug/dist/src/dapDebugServer.js", "${port}" },
                },
            }
        end

        for _, language in ipairs({ "typescript", "javascript", "typescriptreact" }) do
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

        dap.adapters.codelldb = {
            type = "executable",
            command = "codelldb",
        }

        dap.configurations.zig = {{
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = "${workspaceFolder}/zig-out/bin/lindale",
            args = {"serve"},
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
        }}


        require("dap-go").setup()
    end,
}

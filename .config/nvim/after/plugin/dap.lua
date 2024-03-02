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
    -- debugger_path = "/home/sam/.vim/plugged/vscode-js-debug",
    debugger_path = "/home/sam/.local/share/vim/plugged/vscode-js-debug/",
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
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

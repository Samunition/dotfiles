vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "CursorHold" }, {
    group = vim.api.nvim_create_augroup("sam_checktime", { clear = true }),
    callback = function()
        if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
        end
    end,
})

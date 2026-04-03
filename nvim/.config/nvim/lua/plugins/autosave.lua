vim.opt.autowrite = true
vim.opt.autowriteall = true

local autosave_group = vim.api.nvim_create_augroup("local_autosave", { clear = true })

local function autosave(bufnr)
    local buf = vim.bo[bufnr]

    if buf.buftype ~= "" or not buf.modifiable or buf.readonly or not buf.modified then
        return
    end

    if vim.api.nvim_buf_get_name(bufnr) == "" then
        return
    end

    vim.api.nvim_buf_call(bufnr, function()
        vim.cmd("silent! write")
    end)
end

vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave", "FocusLost" }, {
    group = autosave_group,
    callback = function(args)
        autosave(args.buf)
    end,
})

return {}

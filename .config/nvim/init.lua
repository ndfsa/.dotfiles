require("core")

local status, err = pcall(require, "plugin-config")
if not status then
    print(err)
end

local AUG = vim.api.nvim_create_augroup("convenient", {
    clear = true,
})
vim.api.nvim_create_autocmd("TextYankPost", {
    group = AUG,
    callback = function()
        vim.highlight.on_yank({
            higroup = "Visual",
            timeout = 300,
        })
    end,
})
vim.api.nvim_create_autocmd("VimEnter", {
    group = AUG,
    callback = function()
        vim.cmd("clearjumps")
    end,
})
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = AUG,
    command = "normal zx",
})

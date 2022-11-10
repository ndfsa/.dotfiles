local M = {}

function M.opts(desc, extra)
    local res = { silent = true }
    if desc then
        res.desc = desc
    end
    if extra then
        res = vim.tbl_extend('force', res, extra)
    end
    return res
end

return M

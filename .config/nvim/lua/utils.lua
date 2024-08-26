local M = {}

--- helper function to build silent keymaps with descriptions
-- @param desc string description of the keymap
-- @param extra table with extra options for keymap
function M.opts(desc, extra)
    local res = { silent = true }
    if desc then
        res.desc = desc
    end
    if extra then
        res = vim.tbl_extend("force", res, extra)
    end
    return res
end

--- find files function with fallbacks, shows git_files in a git repository, fallback to
--- find_files.
M.project_files = function(tl_builtin)
    return function()
        local success = pcall(tl_builtin.git_files, { show_untracked = true })
        if not success then
            tl_builtin.find_files({})
        end
    end
end

return M

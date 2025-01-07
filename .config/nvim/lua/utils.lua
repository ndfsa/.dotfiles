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

local cwd = ""
local is_git_repo = false

local function check_git_repo()
  local new_cwd = vim.fn.getcwd()
  if new_cwd ~= cwd then
    cwd = new_cwd
    vim.fn.system("git rev-parse --is-inside-work-tree")
    is_git_repo = vim.v.shell_error == 0
  end
  return is_git_repo
end

--- find files function with fallbacks, shows git_files in a git repository, fallback to
--- find_files.
M.project_files = function()
  if check_git_repo() then
    require("fzf-lua").git_files()
  else
    require("fzf-lua").files()
  end
end

return M

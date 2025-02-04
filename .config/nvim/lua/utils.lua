local M = {
  is_git_repo = false,
}

--- Helper function to build silent keymaps with descriptions
-- @param desc string description of the keymap
-- @param extra table with extra options for keymap
function M.opts(desc, extra)
  if extra == nil then
    extra = {}
  end

  extra.silent = true
  if desc then
    extra.desc = desc
  end
  return extra
end

function M.key(mode, lhs, rhs, ...)
  vim.keymap.set(mode, lhs, rhs, ...)
end

function M:check_git_repo()
  vim.fn.system("git rev-parse --is-inside-work-tree")
  self.is_git_repo = vim.v.shell_error == 0
  return self.is_git_repo
end

function M:find_files()
  if self.is_git_repo then
    require("telescope.builtin").git_files()
  else
    require("telescope.builtin").find_files()
  end
end

vim.api.nvim_create_user_command("FindFiles", function()
  require("utils"):find_files()
end, {})

vim.api.nvim_create_autocmd("DirChanged", {
  group = vim.api.nvim_create_augroup("utils", {
    clear = true,
  }),
  callback = function()
    M:check_git_repo()
  end,
})

M:check_git_repo()

return M

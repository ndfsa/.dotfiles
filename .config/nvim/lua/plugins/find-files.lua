local M = {}

M.project_files = function()
	local opts = {}
	local ok = false
	if (vim.fn.empty(vim.fn.glob('./.git')) ~= 1) then
		ok = pcall(require('telescope.builtin').git_files, opts)
	end
	if not ok then require('telescope.builtin').find_files(opts) end
end

return M

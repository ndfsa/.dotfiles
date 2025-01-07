local M = {
  "ibhagwan/fzf-lua",
  lazy = false,
  opts = {
    git = {
      cmd = "git ls-files -co --exclude-standard",
    },
    grep = {
      rg_opts = table.concat({
        "--hidden",
        "--column",
        "--line-number",
        "--no-heading",
        "--color=always",
        "--smart-case",
        "--max-columns=4096",
        [[--glob="!.git/"]],
        "-e",
      }, " "),
    },
  },
  keys = function()
    return {
      {
        "<leader><space>",
        function()
          require("utils").project_files()
        end,
        desc = "Find file",
      },
      {
        "<leader>bz",
        function()
          require("fzf-lua").lgrep_curbuf()
        end,
        desc = "Buffer fuzzy find",
      },
      {
        "<leader>fg",
        function()
          require("fzf-lua").live_grep_native()
        end,
        desc = "Find grep",
      },
      {
        "<leader>fr",
        function()
          require("fzf-lua").registers()
        end,
        desc = "Find registers",
      },
      {
        "<leader>fb",
        function()
          require("fzf-lua").buffers()
        end,
        desc = "Find buffers",
      },
      {
        "<leader>fh",
        function()
          require("fzf-lua").helptags()
        end,
        desc = "Find help",
      },
      {
        "<leader>gb",
        function()
          require("git_branches").git_branches()
        end,
        desc = "Git branches",
      },
    }
  end,
}

local _ = {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("env")
    telescope.load_extension("ui-select")
    telescope.load_extension("undo")
  end,
  opts = function(_, opts)
    local vimgrep_arguments = {
      "rg",
      "--color=never",
      "--hidden",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim",
    }
    if vim.uv.fs_stat(".gitignore") then
      table.insert(vimgrep_arguments, "--ignore-file")
      table.insert(vimgrep_arguments, ".gitignore")
    end
    opts.defaults = require("telescope.themes").get_ivy({
      layout_config = {
        prompt_position = "top",
        height = 0.6,
      },
      vimgrep_arguments = vimgrep_arguments,
      preview = true,
      file_ignore_patterns = { "%.git[/\\]" },
    })
  end,
  dependencies = {
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "debugloop/telescope-undo.nvim" },
    { "LinArcX/telescope-env.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  keys = function()
    return {
      {
        "<leader><space>",
        function()
          require("utils").project_files()
        end,
        desc = "Find file",
      },
      {
        "<leader>bz",
        function()
          require("telescope.builtin").current_buffer_fuzzy_find()
        end,
        desc = "Buffer fuzzy find",
      },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Find grep",
      },
      {
        "<leader>fr",
        function()
          require("telescope.builtin").registers()
        end,
        desc = "Find registers",
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Find buffers",
      },
      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Find help",
      },
      {
        "<leader>fu",
        function()
          require("telescope").extensions.undo.undo()
        end,
        desc = "Find undo",
      },
      {
        "<leader>fE",
        function()
          require("telescope").extensions.env.env()
        end,
        desc = "Find environment variables",
      },
      {
        "<leader>gb",
        function()
          require("telescope.builtin").git_branches()
        end,
        desc = "Git branches",
      },
    }
  end,
}

return M

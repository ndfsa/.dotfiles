return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      opts.defaults = {
        layout_config = {
          prompt_position = "top",
          height = 0.6,
        },
        sorting_strategy = "ascending",
        preview = false,
        file_ignore_patterns = { "%.git[/\\]" },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--hidden",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
      }
      opts.pickers = {
        git_files = {
          show_untracked = true,
        },
      }
      opts.extensions = {
        picker_list = {
          excluded = {
            "fzy_native",
          },
        },
      }
    end,
    dependencies = {
      {
        "nvim-telescope/telescope-fzy-native.nvim",
        config = function()
          require("telescope").load_extension("fzy_native")
        end,
      },
      {
        "prochri/telescope-all-recent.nvim",
        opts = {},
        dependencies = {
          "kkharji/sqlite.lua",
        },
      },
    },
    keys = {
      { "<leader><space>", "<cmd>FindFiles<cr>", desc = "Find file" },
      { "<leader>ot", "<cmd>Telescope<cr>", desc = "Open Telescope" },
      { "<leader>bz", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer fuzzy find" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Find grep" },
      { "<leader>fr", "<cmd>Telescope registers<cr>", desc = "Find registers" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find help" },
      { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
      { "<leader>sF", "<cmd>Telescope filetype<cr>", desc = "Set file type" },
    },
  },
  require("fuzzy-finder.ext-environment"),
  require("fuzzy-finder.ext-changes"),
  require("fuzzy-finder.ext-picker-list"),
}

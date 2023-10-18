return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      renderer = {
        group_empty = false,
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        indent_markers = { enable = true },
      },
      filters = {
        git_ignored = true, -- hide files that are git ignored
        dotfiles = false,    -- hide dot files
        git_clean = true,    -- hide the .git dir
        no_buffer = false,   -- hide files that are not being edited
        custom = {},
        exclude = {},
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      view = {
        float = {
          enable = true,
          quit_on_focus_loss = true,
          open_win_config = {
            relative = "editor",
            border = "rounded",
            width = 40,
            height = 30,
            row = 1,
            col = 42,
          },
        },
      },
    }
  end,
}


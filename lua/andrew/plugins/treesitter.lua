return {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "cpp",
                "css",
                "glsl",
                "hlsl",
                "html",
                "javascript",
                "json",
                "lua",
                "make",
                "python",
                "query",
                "regex",
                "rust",
                "toml",
                "wgsl",
                "vim",
                "vimdoc",
            },
            sync_install = false,
            auto_install = false,
            ignore_install = {},
            highlight = {
                enable = true,
                disable = {},
                additional_vim_regex_highlighting = false,
            },
        }
    end
}


return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        lazy = false,
        config = function()
            require("lualine").setup {
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    component_separators = { left = "╲", right = "╱" },
                    section_separators = { left = "", right = "" },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = {
                        { "filename", path = 1, shorten = true }
                    },
                    lualine_x = {
                        {
                            "lsp_progress",
                            separators = {
                                component = " ",
                                progress = " | ",
                                message = { pre = "(", post = ")" },
                                percentage = { pre = "", post = "%% " },
                                title = { pre = "", post = " " },
                                lsp_client_name = { pre = "[", post = "]" },
                                spinner = { pre = "", post = "" },
                            },
                            display_components = {
                                "lsp_client_name",
                                { "title", "percentage" }
                            },
                        }
                    },
                    lualine_y = { "encoding", "fileformat", "filetype" },
                    lualine_z = { "progress", "location" }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end
    },
    { "arkav/lualine-lsp-progress" }
}

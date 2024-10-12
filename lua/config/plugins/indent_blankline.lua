return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "VeryLazy",
    opts = {},
    config = function()
        require("ibl").setup {
            indent = {
                char = "┊",
                smart_indent_cap = true,
            },
        }
    end
}

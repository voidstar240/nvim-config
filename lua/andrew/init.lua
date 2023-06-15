require("andrew.packer")
require("andrew.set")
require("andrew.remap")



------------------
-- Theme Config --
------------------

local onedark = require("onedark")
onedark.setup {
    style = "warmer"
}
onedark.load()



-----------------------
-- Treesitter Config --
-----------------------

require("nvim-treesitter.configs").setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

    sync_install = false,
    auto_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}



----------------
-- LSP Config --
----------------

local lsp = require("lsp-zero").preset({})

lsp.preset("recommended")

lsp.ensure_installed({
    "lua_ls",
    "rust_analyzer",
    "clangd",
})

local cmp = require("cmp")
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.set_preferences({
    sign_icons = {}
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition,
        { buffer = bufnr, desc = "[G]o to [D]efinition" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
        { buffer = bufnr, desc = "[G]o to [D]eclaration" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover,
        { buffer = bufnr, desc = "Hover" })
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol,
        { buffer = bufnr, desc = "[V]iew [W]orkspace [S]ymbol" })
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float,
        { buffer = bufnr, desc = "[V]iew [D]iagnostics" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next,
        { buffer = bufnr, desc = "Next [D]iagnostic" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev,
        { buffer = bufnr, desc = "Prev [D]iagnostic" })
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action,
        { buffer = bufnr, desc = "[V]iew [C]ode [A]ction" })
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references,
        { buffer = bufnr, desc = "[V]iew [R]eferences" })
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename,
        { buffer = bufnr, desc = "[R]e[N]ame Symbol" })
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help,
        { buffer = bufnr, desc = "Signature [H]elp" })
end)

lsp.setup()



--------------------
-- Lualine Config --
--------------------

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
            { "filename", path = 1 }
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { {
            function()
                local msg = "None"
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return msg
            end,
            icon = " LSP:",
        } },
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



-----------------------------
-- Indent Blankline Config --
-----------------------------

require("indent_blankline").setup {
    char = "|",
    show_trailing_blankline_indent = false,
}



----------------------
-- Which Key Config --
----------------------

require("which-key").setup()

return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                local opts = {buffer = bufnr, remap = false}

                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "[G]o to [D]efinition", unpack(opts) })
                vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, { desc = "[G]o to [D]eclaration", unpack(opts) })
                vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, { desc = "[G]o to [T]ype definition", unpack(opts) })
                vim.keymap.set("n", "<Leader><Leader>", function() vim.lsp.buf.hover() end, {desc = "View hover documentation", unpack(opts) })
                vim.keymap.set("n", "<Leader>d", function() vim.diagnostic.goto_next() end, { desc = "Go to next [D]iagnostic", unpack(opts) })
                vim.keymap.set("n", "<Leader>D", function() vim.diagnostic.goto_prev() end, { desc = "Go to previous [D]iagnostic", unpack(opts) })
                vim.keymap.set("n", "<Leader>vd", function() vim.diagnostic.open_float() end, { desc = "[V]iew [D]iagnostic under cursor", unpack(opts) })
                vim.keymap.set("n", "<Leader>vws", function() vim.lsp.buf.workspace_symbol() end, { desc = "[V]iew [W]orkspace [S]ymbol", unpack(opts) })
                vim.keymap.set("n", "<Leader>vca", function() vim.lsp.buf.code_action() end, { desc = "[V]iew [C]ode [A]ctions", unpack(opts) })
                vim.keymap.set("n", "<Leader>vrr", function() vim.lsp.buf.references() end, { desc = "[V]iew [R]eferences", unpack(opts) })
                vim.keymap.set("n", "<Leader>vrn", function() vim.lsp.buf.rename() end, { desc = "[R]e[N]ame Symbol", unpack(opts) })
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { desc = "Signature [H]elp", unpack(opts) })
            end)

            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {"lua_ls", "clangd", "rust_analyzer"},
                handlers = {
                    lsp_zero.default_setup,
                    lua_ls = function()
                        local lua_opts = lsp_zero.nvim_lua_ls()
                        require("lspconfig").lua_ls.setup(lua_opts)
                    end,
                }
            })

            local cmp = require("cmp")
            local cmp_select = {behavior = cmp.SelectBehavior.Select}

            cmp.setup({
                sources = {
                    { name = "path" },
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                },
                formatting = lsp_zero.cmp_format(),
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
            })
        end
    },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" }
}

----------------
-- VIM Remaps --
----------------

-- Unbind Space
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Open file explorer (netrw)
vim.keymap.set("n", "<leader>vf", vim.cmd.Ex, { desc = "[V]iew [F]iles" })

-- Move selected blocks of text up and down and auto indent
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection down" })

-- Append next line to end of this line, keep cursor at same spot
vim.keymap.set("n", "J", "mzJ`z", { desc = "Append next line to this line" })

-- Keep the cursor centered when moving half page up/down and next/prev search 
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move half page [D]own" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move half page [U]p" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Go to next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Go to prev search result" })

-- Replace selection with what's in register but don't overwrite the register
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "[P]aste and preserve register" })

-- Paste from system clipboard (reg * windows, reg + linux)
vim.keymap.set("n", "<leader>P", "\"+p", { desc = "[P]aste from system clipboard" })
vim.keymap.set("v", "<leader>P", "\"+p", { desc = "[P]aste from system clipboard" })

-- Yank into system clipboard (reg + windows, reg + linux)
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "[Y]ank to system clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "[Y]ank to system clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "[Y]ank and append to system clipboard" })

-- Delete text but dont fill register
vim.keymap.set("n", "<leader>d", "\"_d", { desc = "[D]elete text and preserve register" })
vim.keymap.set("v", "<leader>d", "\"_d", { desc = "[D]elete text and preserve register" })

-- Unbind Q
vim.keymap.set("n", "Q", "<nop>")

-- Format buffer
vim.keymap.set("n", "<leader>f", function ()
  vim.lsp.buf.format()
end, { desc = "[F]ormat the buffer" })

-- Quick fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Find and replace on word under cursor
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
{ desc = "Find and replace word under cursor" })



--------------------
-- Harpoon Remaps --
--------------------

local harp_mark = require("harpoon.mark")
local harp_ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", harp_mark.add_file, { desc = "[A]dd file to harpoon" })
vim.keymap.set("n", "<C-e>", harp_ui.toggle_quick_menu, { desc = "Toggle Harpoon menu" })

vim.keymap.set("n", "<C-h>", function() harp_ui.nav_file(1) end, { desc = "Jump to file 1" })
vim.keymap.set("n", "<C-t>", function() harp_ui.nav_file(2) end, { desc = "Jump to file 2" })
vim.keymap.set("n", "<C-n>", function() harp_ui.nav_file(3) end, { desc = "Jump to file 3" })
vim.keymap.set("n", "<C-s>", function() harp_ui.nav_file(4) end, { desc = "Jump to file 4" })



----------------------
-- Telescope Remaps --
----------------------

local tlscp = require("telescope.builtin")
vim.keymap.set("n", "<leader>sf", tlscp.find_files, { desc = "[S]earch [F]iles in project" })
vim.keymap.set("n", "<leader>gf", tlscp.git_files, { desc = "Search [G]it [F]iles" })
vim.keymap.set("n", "<leader>sh", tlscp.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", tlscp.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", tlscp.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", tlscp.diagnostics, { desc = "[S]earch [D]iagnostics" })

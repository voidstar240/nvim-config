-- set <Space> leader
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- open netrw (uncomment if using netrw)
-- vim.keymap.set("n", "<Leader>vf", vim.cmd.Ex, { desc = "[V]iew [F]iles" })
vim.keymap.set("n", "<Leader>vf", vim.cmd.NvimTreeOpen, { desc = "[V]iew [F]iles" })

-- unbind macro commands
vim.keymap.set("n", "Q", "<Nop>")
vim.keymap.set({ "n", "v" }, "q", "<Nop>")
vim.keymap.set({ "n", "v" }, "<C-Q>", "q", { desc = "Start/Stop recording macro" })

-- copy and paste from system clipboard
vim.keymap.set({ "n", "v" }, "<Leader>y", "\"+y", { desc = "[Y]ank to system clipboard" })
vim.keymap.set({ "n", "v" }, "<Leader>P", "\"+p", { desc = "[P]aste from system clipboard" })

-- center cursor during searches
vim.keymap.set("n", "n", "nzzzv", { desc = "Go to next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Go to prev search result" })

-- move half page up/down and center cursor
vim.keymap.set("n", "J", "<C-D>zz", { desc = "Move half page down" })
vim.keymap.set("n", "K", "<C-U>zz", { desc = "Move half page up" })

-- move cursor to start and end of line
vim.keymap.set({ "n", "v" }, "H", "^", { desc = "Move cursor to start of line" })
vim.keymap.set({ "n", "v" }, "L", "$", { desc = "Move cursor to end of line" })

-- move selection up/down and smart indent it
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection down" })

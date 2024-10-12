return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup();

        vim.keymap.set("n", "<Leader>a", function() harpoon:list():append() end, { desc = "[A]dd file to harpoon" })
        vim.keymap.set("n", "<C-h>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open [H]arpoon menu" })

        vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end, { desc = "Go to harpoon file 1" })
        vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end, { desc = "Go to harpoon file 2" })
        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end, { desc = "Go to harpoon file 3" })
        vim.keymap.set("n", "<C-;>", function() harpoon:list():select(4) end, { desc = "Go to harpoon file 4" })
    end
}

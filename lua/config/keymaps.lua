vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Parent Directory in Oil" })

vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open diagnostic in float" })

vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, { desc = "Format current file" })

-- Remap word motion to include punctuation
vim.keymap.set("n", "w", "W", { noremap = true, desc = "Move forward by word (including punctuation)" })
vim.keymap.set("n", "b", "B", { noremap = true, desc = "Move backward by word (including punctuation)" })
vim.keymap.set("v", "w", "W", { noremap = true, desc = "Move forward by word (including punctuation)" })
vim.keymap.set("v", "b", "B", { noremap = true, desc = "Move backward by word (including punctuation)" })

-- Remap 'W' to move to the end of the current word
vim.keymap.set("n", "W", "E", { noremap = true, desc = "Move to the end of the current word" })
vim.keymap.set("v", "W", "E", { noremap = true, desc = "Move to the end of the current word" })

vim.keymap.set("n", "cw", "ciw", { noremap = true, desc = "Change inner word" })

vim.keymap.set("n", "cW", "cw", { noremap = true, desc = "Change rest of the word" })

-- Remap Ctrl-Z to Undo
vim.keymap.set("n", "<C-z>", "<Cmd>undo<CR>", { noremap = true, desc = "Undo" })
vim.keymap.set("i", "<C-z>", "<Esc><Cmd>undo<CR>i", { noremap = true, desc = "Undo" })
vim.keymap.set("v", "<C-z>", "<Esc><Cmd>undo<CR>", { noremap = true, desc = "Undo" })

-- Remap Ctrl-Shift-Z to Redo
-- vim.keymap.set("n", "<C-Z>", "<Cmd>redo<CR>", { noremap = true, desc = "Redo" })
-- vim.keymap.set("i", "<C-Z>", "<Esc><Cmd>redo<CR>i", { noremap = true, desc = "Redo" })
-- vim.keymap.set("v", "<C-Z>", "<Esc><Cmd>redo<CR>", { noremap = true, desc = "Redo" })

-- Remap Ctrl-A to Select All
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, desc = "Select All" })
vim.keymap.set("i", "<C-a>", "<Esc>ggVG", { noremap = true, desc = "Select All" })

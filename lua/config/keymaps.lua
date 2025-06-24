vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Parent Directory in Oil" })

-- navigate between windows
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
-- navigate between buffers
vim.keymap.set("n", "<M-j>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<M-k>", ":bnext<CR>", opts)
-- navigate between tabs
vim.keymap.set("n", "<M-h>", ":-tabnext<CR>", { noremap = true, silent = true, desc = "Previous tab" })
vim.keymap.set("n", "<M-l>", ":+tabnext<CR>", { noremap = true, silent = true, desc = "Next tab" })

-- buffers
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Go to buffer N
for i = 1, 9 do
	map("n", "<Leader>" .. i, function()
		require("nvim-smartbufs").goto_buffer(i)
	end, opts)
end

-- Go to terminal buffers
for i = 1, 4 do
	map("n", "<Leader>c" .. i, function()
		require("nvim-smartbufs").goto_terminal(i)
	end, opts)
end

-- Close current buffer
map("n", "<Leader>qq", function()
	require("nvim-smartbufs").close_current_buffer()
end, opts)

-- Close buffer N
for i = 1, 9 do
	map("n", "<Leader>q" .. i, function()
		require("nvim-smartbufs").close_buffer(i)
	end, opts)
end

-- tabby
vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })

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

-- CRTL-s to save
vim.keymap.set("n", "<C-s>", "<Cmd>w<CR>", { noremap = true, desc = "Save file" })

-- using LSP shift to header/source
vim.keymap.set("n", "<M-S-o>", "<Cmd>ClangdSwitchSourceHeader<CR>", { desc = "Shift source/header" })

-- COMMENT SHORTCUTS --------------------------------------------

-- Toggle comment on current line (normal mode)
vim.keymap.set("n", "<C-k>c", "<Cmd>Comment<CR>", { desc = "Toggle comment (normal)" })

-- Toggle comment in insert mode (escapes, comments, returns to insert)
vim.keymap.set("i", "<C-k>c", "<Esc><Cmd>Comment<CR>i", { desc = "Toggle comment (insert)" })

-- Toggle comment on visual selection (visual mode)
vim.keymap.set("v", "<C-k>c", "<Cmd>CommentMore<CR>", { desc = "Toggle comment (visual)" })

-- CMAKE SHORTCUT ----------------------------------------------

-- Run CMake project
vim.keymap.set("n", "<F4>", "<Cmd>CMakeRun<CR>", { desc = "Run CMake project" })
vim.keymap.set("n", "<F5>", "<Cmd>CMakeDebug<CR>", { desc = "Debug CMake project" })
vim.keymap.set("n", "<F7>", "<Cmd>CMakeBuild<CR>", { desc = "Build CMake project" })
vim.keymap.set("n", "<F8>", "<Cmd>CMakeBuild[!]<CR>", { desc = "ReBuild CMake project" })
vim.keymap.set("n", "<F10>", "<Cmd>CMakeGenerate<CR>", { desc = "Generate CMake project" })
vim.keymap.set("n", "<F11>", "<Cmd>CMakeGenrate[!]<CR>", { desc = "Clean and regenrate CMake project" })

-- SAFE YANK & PASTE -------------------------------------------

-- Yank to register 'a' (safe from deletes)
vim.keymap.set({ "n", "v" }, "y", '"ay', { desc = "Yank to register a" })

-- Paste from register 'a'
vim.keymap.set("n", "p", '"ap', { desc = "Paste from register a" })

-- Paste from last delete (register 1) using 'P'
vim.keymap.set("n", "P", '"1p', { desc = "Paste from last delete" })

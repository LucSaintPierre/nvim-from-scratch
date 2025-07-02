return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "main",
	dependencies = {
		{ "zbirenbaum/copilot.lua" },
		{ "nvim-lua/plenary.nvim" },
		{ "ibhagwan/fzf-lua" },
	},
	opts = {
		debug = false,
		show_help = true,
		window = { layout = "vertical" },
	},
	config = function(_, opts)
		local chat = require("CopilotChat")
		chat.setup(opts)

		-- Use fzf-lua for prompt/model/agent pickers
		require("fzf-lua").register_ui_select()

		-- Handy keymaps
		local map = vim.keymap.set
		local chat_cmd = function(cmd)
			return function()
				vim.cmd(cmd)
			end
		end

		map({ "n", "v" }, "<leader>ccv", chat_cmd("CopilotChatVisual"), { desc = "Chat with selection" })
		map("n", "<leader>ccc", chat_cmd("CopilotChatToggle"), { desc = "Chat about buffer" })
		map("n", "<leader>ccx", chat_cmd("CopilotChatInline"), { desc = "Inline chat" })
		map("n", "<leader>cce", chat_cmd("CopilotChatExplain"), { desc = "Explain code" })
		map("n", "<leader>ccr", chat_cmd("CopilotChatReview"), { desc = "Review buffer" })
		map("n", "<leader>ccR", chat_cmd("CopilotChatRefactor"), { desc = "Refactor buffer" })
		map("n", "<leader>ccn", chat_cmd("CopilotChatBetterNamings"), { desc = "Improve names" })
		map("n", "<leader>ccm", chat_cmd("CopilotChatCommit"), { desc = "Commit msg (diff)" })
		map("n", "<leader>ccM", chat_cmd("CopilotChatCommitStaged"), { desc = "Commit msg (staged)" })
		map("n", "<leader>ccp", chat_cmd("CopilotChatPromptPicker"), { desc = "Pick prompt" })
		map("n", "<leader>cch", chat_cmd("CopilotChatHelpPicker"), { desc = "Pick help action" })
	end,
	event = "VeryLazy",
}

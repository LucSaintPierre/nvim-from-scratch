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
		local select = require("CopilotChat.select")
		chat.setup(opts)

		-- Use fzf-lua for picker integrations
		require("fzf-lua").register_ui_select()

		-- Custom context selector for "project view" (all listed buffers)
		local function all_buffers()
			local bufs = {}
			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_option(buf, "buflisted") then
					local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
					table.insert(bufs, table.concat(lines, "\n"))
				end
			end
			return table.concat(bufs, "\n\n-- BUFFER SPLIT --\n\n")
		end

		-- Custom context selector for all .cpp and .h files in the project
		local function all_project_cpp_h_files()
			local plenary_scan = require("plenary.scandir")
			local cwd = vim.loop.cwd()
			local files = plenary_scan.scan_dir(cwd, { depth = nil, search_pattern = ".*%.%a+$" })
			local contents = {}
			for _, file in ipairs(files) do
				if file:match("%.cpp$") or file:match("%.h$") then
					local f = io.open(file, "r")
					if f then
						local text = f:read("*a")
						f:close()
						table.insert(contents, ("-- FILE: %s --\n%s"):format(file, text))
					end
				end
			end
			return table.concat(contents, "\n\n-- FILE SPLIT --\n\n")
		end

		-- Commands
		vim.api.nvim_create_user_command("CopilotChatToggleBuffer", function()
			chat.toggle({ selection = select.buffer })
			vim.cmd("startinsert")
		end, {})

		vim.api.nvim_create_user_command("CopilotChatToggleBuffers", function()
			chat.toggle({ selection = all_buffers })
			vim.cmd("startinsert")
		end, {})

		vim.api.nvim_create_user_command("CopilotChatToggleProject", function()
			chat.toggle({ selection = all_project_cpp_h_files })
			vim.cmd("startinsert")
		end, {})

		-- Keymaps
		local map = vim.keymap.set
		local chat_cmd = function(cmd)
			return function()
				vim.cmd(cmd)
			end
		end

		map({ "n", "v" }, "<leader>ccv", chat_cmd("CopilotChatVisual"), { desc = "Chat with selection" })
		map("n", "<leader>ccc", chat_cmd("CopilotChatToggleBuffer"), { desc = "Chat about buffer" })
		map("n", "<leader>ccb", chat_cmd("CopilotChatToggleBuffers"), { desc = "Chat about listed buffers" })
		map("n", "<leader>ccp", chat_cmd("CopilotChatToggleProject"), { desc = "Chat about all project .cpp/.h files" })
		map("n", "<leader>ccx", chat_cmd("CopilotChatInline"), { desc = "Inline chat" })
		map("n", "<leader>cce", chat_cmd("CopilotChatExplain"), { desc = "Explain code" })
		map("n", "<leader>ccr", chat_cmd("CopilotChatReview"), { desc = "Review buffer" })
		map("n", "<leader>ccR", chat_cmd("CopilotChatRefactor"), { desc = "Refactor buffer" })
		map("n", "<leader>ccn", chat_cmd("CopilotChatBetterNamings"), { desc = "Improve names" })
		map("n", "<leader>ccm", chat_cmd("CopilotChatCommit"), { desc = "Commit msg (diff)" })
		map("n", "<leader>ccM", chat_cmd("CopilotChatCommitStaged"), { desc = "Commit msg (staged)" })
		map("n", "<leader>ccP", chat_cmd("CopilotChatPromptPicker"), { desc = "Pick prompt" })
		map("n", "<leader>cch", chat_cmd("CopilotChatHelpPicker"), { desc = "Pick help action" })
	end,
	event = "VeryLazy",
}

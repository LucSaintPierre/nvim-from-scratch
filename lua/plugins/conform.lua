return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			cmake = { "cmake-format" },
			cpp = { "clang-format", args = { "-style=file" } },
			c = { "clang-format", args = { "-style=file" } }, -- Add C files as well, if desired
			--
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}

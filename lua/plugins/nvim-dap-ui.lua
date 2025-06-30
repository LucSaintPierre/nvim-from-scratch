return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio", -- 👈 Add this line
	},
	config = function()
		require("dapui").setup()
	end,
}

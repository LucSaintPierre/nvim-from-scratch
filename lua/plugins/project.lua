return {
	"ahmedkhalf/project.nvim",
	config = function ()
		require("project_nvim").setup {
			detection_methods = {"pattern", "lsp"}, --Enable different type of detection
			silent_chdir = false,
			patterns = { ".git", "compile_commands.json", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
		}

	end
}

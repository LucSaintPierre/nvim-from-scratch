return {
	"b0o/incline.nvim",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	config = function()
		local helpers = require("incline.helpers")
		local navic = require("nvim-navic")
		local devicons = require("nvim-web-devicons")

		require("incline").setup({
			window = {
				padding = 0,
				margin = { horizontal = 0, vertical = 0 },
			},
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				if filename == "" then
					filename = "[No Name]"
				end
				local ft_icon, ft_color = devicons.get_icon_color(filename)
				local modified = vim.bo[props.buf].modified

				local bg_color = props.focused and "#5e4fa2" or "#44406e"

				local res = {
					ft_icon and {
						" ",
						ft_icon,
						" ",
						guibg = ft_color,
						guifg = helpers.contrast_color(ft_color),
					} or "",
					" ",
					{
						filename,
						gui = modified and "bold,italic" or "bold",
					},
					guibg = bg_color,
				}

				if props.focused then
					for _, item in ipairs(navic.get_data(props.buf) or {}) do
						table.insert(res, {
							{ " > ", group = "NavicSeparator" },
							{ item.icon, group = "NavicIcons" .. item.type },
							{ item.name, group = "NavicText" },
						})
					end
				end

				table.insert(res, " ")
				-- Wrap the entire result in a bold style if focused
				return res
			end,
		})
	end,
}

return {
	{
		"marilari88/twoslash-queries.nvim",
		event = "VeryLazy",
		config = function()
			local twoslash = require("twoslash-queries")
			twoslash.setup({
				multi_line = true,
				is_enabled = false,
				highlight = "Type",
			})

			vim.keymap.set("n", "<leader>ti", ":TwoslashQueriesInspect<CR>")
			vim.keymap.set("n", "<leader>ts", function()
				if twoslash.config.is_enabled then
					vim.cmd("TwoslashQueriesDisable")
					return
				end

				vim.cmd(":TwoslashQueriesEnable")
			end, { desc = "Toggle [T]wo [S]lash queries" })
		end,
	},
}

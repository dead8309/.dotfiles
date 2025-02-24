-- require("snacks")
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		lazygit = {
			enabled = true,
		},
		picker = {
			enabled = true,
			layout = {
				preset = "telescope",
			},
		},
	},
	keys = {
		{
			"<leader>pf",
			function()
				Snacks.picker.files()
			end,
			{ desc = "Find Files" },
		},
		{
			"<C-p>",
			function()
				Snacks.picker.git_files()
			end,
			{ desc = "Find Git Files" },
		},
		{
			"<leader>pws",
			function()
				Snacks.picker.grep_word()
			end,
			{ desc = "Grep Current Word" },
		},
		{
			"<leader>pWs",
			function()
				local word = vim.fn.expand("<cWORD>")
				Snacks.picker.grep_word({ search = word })
			end,
			{ desc = "Grep Current WORD" },
		},
		{
			"<leader>ps",
			function()
				Snacks.picker.grep()
			end,
			{ desc = "Live Grep" },
		},
		{
			"<leader>vh",
			function()
				Snacks.picker.help()
			end,
			{ desc = "Help Tags" },
		},
		{
			"<leader>lg",
			function()
				Snacks.lazygit.open()
			end,
			{ desc = "Blame Line" },
		},
	},
}

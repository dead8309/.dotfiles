return {

	{
		"nvim-lua/plenary.nvim",
		name = "plenary",
	},

	"eandrju/cellular-automaton.nvim",
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	-- { 'numToStr/Comment.nvim',    opts = {} },
	-- { "tpope/vim-commentary" },
	{ "folke/ts-comments.nvim", opts = {}, event = "VeryLazy" },
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
}

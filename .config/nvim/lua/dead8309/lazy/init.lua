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
}

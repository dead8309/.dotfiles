return {
	"yugem",
	dir = "~/yugem",
	-- lazy = true,
	priority = 1000,
	config = function()
		require("yugem").setup({})
		vim.keymap.set("n", "<leader>yyy", function()
			ColorMyPencils("yugem")
		end)
	end,
}

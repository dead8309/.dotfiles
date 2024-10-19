function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = false,
				styles = {
					italic = false,
					transparency = true,
				},
			})
			-- ColorMyPencils()
			vim.cmd.colorscheme("rose-pine")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_disable_italic_comment = 1
			vim.g.gruvbox_material_background = "hard"
			-- vim.cmd.colorscheme("gruvbox-material")
			-- ColorMyPencils("gruvbox-material")
		end,
	},
}

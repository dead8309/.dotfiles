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
			-- vim.cmd.colorscheme("rose-pine")
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
	{
		"sho-87/kanagawa-paper.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"aktersnurra/no-clown-fiesta.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			require("no-clown-fiesta").setup({
				styles = {
					type = { bold = true },
					lsp = { underline = false },
					match_paren = { underline = true },
				},
			})
		end,
	},
	{
		"dgox16/oldworld.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("oldworld")
			-- ColorMyPencils("oldworld")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({
				style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
				light_style = "day", -- The theme is used when the background is set to light
				transparent = true, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
				day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
				dim_inactive = false, -- dims inactive windows
				lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
			})
			vim.cmd.colorscheme("tokyonight")
			-- ColorMyPencils("tokyonight")
		end,
	},
}

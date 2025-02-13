return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				filetypes = {
					zig = false,
					markdown = true,
				},
				panel = {
					enabled = true,
					auto_refresh = true,
					keymap = {
						jump_next = "<c-j>",
						jump_prev = "<c-k>",
						accept = "<c-b>",
						refresh = "r",
						open = "<M-CR>",
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4,
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					debounce = 75,
					keymap = {
						accept = "<c-b>",
						accept_word = false,
						accept_line = false,
						next = "<c-j>",
						prev = "<c-k>",
						dismiss = "<C-e>",
					},
				},
			})
		end,
	},
}

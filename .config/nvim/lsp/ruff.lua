local cmp = require("cmp_nvim_lsp")

return {
	-- lsp: https://docs.astral.sh/ruff/editors/setup/#neovim
	-- ref: https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/ruff.lua
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = { ".ruff.toml", "pyproject.toml", "requirements.txt", "ruff.toml" },
	init_options = {
		settings = {
			-- https://docs.astral.sh/ruff/editors/settings/
			configurationPreference = "filesystemFirst",
			lineLength = 88,
		},
	},
	on_attach = function(client, _)
		if client.name == "ruff" then
			client.server_capabilities.hoverProvider = false
		end
	end,
	-- HACK: explicitly setting offset encoding:
	-- https://github.com/astral-sh/ruff/issues/14483#issuecomment-2526717736
	capabilities = vim.tbl_deep_extend("force", {}, cmp.default_capabilities(), {
		general = {
			-- positionEncodings = { "utf-8", "utf-16", "utf-32" }  <--- this is the default
			positionEncodings = { "utf-16" },
		},
		fileOperations = {
			didRename = true,
			willRename = true,
		},
	}),
}

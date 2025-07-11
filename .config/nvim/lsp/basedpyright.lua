local cmp = require("cmp_nvim_lsp")

return {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", ".git" },
	single_file_support = true,
	settings = {
		basedpyright = {
			-- https://docs.basedpyright.com/#/settings
			disableOrganizeImports = true, -- deletgate to ruff
			analysis = {
				-- NOTE: uncomment this to ignore linting. Good for projects where
				-- basedpyright lights up as a christmas tree.
				-- ignore = { "*" },
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "openFilesOnly",
			},
		},
	},

	capabilities = vim.tbl_deep_extend("force", {}, cmp.default_capabilities(), {
		fileOperations = {
			didRename = true,
			willRename = true,
		},
	}),
}

local cmp = require("cmp_nvim_lsp")

vim.lsp.log.set_format_func(vim.inspect)
vim.lsp.set_log_level("debug")

return {
	cmd = { "sprocket", "analyzer", "--stdio", "-vvvv" },
	root_markers = {
		"Cargo.toml",
		"Sprocket.toml",
		".git",
	},
	filetypes = { "wdl" },
	capabilities = vim.tbl_deep_extend("force", {}, cmp.default_capabilities(), {
		fileOperations = {
			didRename = true,
			willRename = true,
		},
		textDocument = {
			diagnostic = {
				dynamicRegistration = true,
				relatedDocumentSupport = true,
			},
		},
	}),
}

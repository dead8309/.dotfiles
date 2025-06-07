local cmp = require("cmp_nvim_lsp")

return {
	cmd = { "rust-analyzer" },
	root_markers = { "Cargo.lock" },
	filetypes = { "rust" },
	settings = {
		["rust-analyzer"] = {
			check = {
				command = "clippy",
			},
			diagnostics = {
				enable = true,
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

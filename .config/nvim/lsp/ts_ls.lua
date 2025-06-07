return {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
	capabilities = vim.tbl_deep_extend("force", {}, cmp.default_capabilities(), {
		fileOperations = {
			didRename = true,
			willRename = true,
		},
	}),
}

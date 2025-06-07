local cmp = require("cmp_nvim_lsp")

vim.g.zig_fmt_parse_errors = 0
vim.g.zig_fmt_autosave = 0

return {
	cmd = { "zls" },
	filetypes = { "zig" },
	root_markers = {
		".git",
		"build.zig",
		"zls.json",
	},
	settings = {
		zls = {
			enable_inlay_hints = true,
			enable_snippets = true,
			warn_style = true,
		},
	},
	capabilities = vim.tbl_deep_extend("force", {}, cmp.default_capabilities(), {
		fileOperations = {
			didRename = true,
			willRename = true,
		},
	}),
}

local cmp = require("cmp_nvim_lsp")

return {
	cmd = { "bash-language-server", "start" },
	settings = {
		bashIde = {
			globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
		},
	},
	filetypes = { "bash", "sh" },
	root_markers = { ".git" },
	capabilities = vim.tbl_deep_extend("force", {}, cmp.default_capabilities(), {
		fileOperations = {
			didRename = true,
			willRename = true,
		},
	}),
}

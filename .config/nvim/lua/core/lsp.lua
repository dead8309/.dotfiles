vim.lsp.enable({
	"lua_ls",
	"bashls",
	"clangd",
	"docker_compose_language_service",
	"gopls",
	"pyright",
	"rust_analyzer",
	"sprocket",
	"zls",
    "ts_ls",
    -- "basedpyright",
    "ruff",
})
-- vim.lsp.enable("tsgo")

vim.diagnostic.config({
	-- update_in_insert = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
	},
})

local usercmd = vim.api.nvim_create_user_command
local utils = require("core.utils")
usercmd("LspStatus", utils.lsp_status, { desc = "Show detailed LSP status" })
usercmd("LspRestart", utils.restart_lsp, { desc = "Restart LSP" })
usercmd("LspCapabilities", utils.check_lsp_capabilities, { desc = "Show LSP capabilities" })
usercmd("LspDiagnostics", utils.lsp_diagnostics_info, { desc = "Show LSP diagnostics count" })
usercmd("LspInfo", utils.lsp_info, { desc = "Show comprehensive LSP information" })

usercmd("LspLog", function()
	vim.cmd(string.format("rightbelow vsplit %s", vim.lsp.get_log_path()))
end, {
	desc = "Open Log file",
})

function FormatBuf()
	local format_args = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	}

	local have_fmt, conform = pcall(require, "conform")
	if have_fmt then
		-- get current formatter names
		local formatters = conform.list_formatters()
		local fmt_names = {}

		if not vim.tbl_isempty(formatters) then
			fmt_names = vim.tbl_map(function(f)
				return f.name
			end, formatters)
		elseif conform.will_fallback_lsp(format_args) then
			fmt_names = { "lsp" }
		else
			return
		end

		local progress = require("fidget.progress")
		local fmt_info = table.concat(fmt_names, "/")
		local handle = progress.handle.create({
			title = "conform",
			lsp_client = { name = fmt_info },
			percentage = 0,
		})

		conform.format(format_args, function(err)
			handle:finish()
			if err then
				vim.notify(err, vim.log.levels.WARN, { title = fmt_info })
			end
		end)
	else
		vim.lsp.buf.format(format_args)
	end
end

return {
	"stevearc/conform.nvim",
	dependencies = {},
	event = { "BufReadPre", "BufNewFile" },

	config = function()
		--NOTE: use this prettier ver. only "prettier@2.8.8",

		-- local null_ls = require("null-ls")
		-- null_ls.setup({
		-- 	sources = {
		-- 		null_ls.builtins.formatting.prettier,
		-- 		null_ls.builtins.formatting.stylua,
		-- 	},
		-- })
		-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			FormatBuf()
		end, { desc = "Format file or range (in visual mode)" })
	end,
}

local augroup = vim.api.nvim_create_augroup
local dead8309Group = augroup("dead8309", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
})

autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

autocmd("LspAttach", {
	group = dead8309Group,
	callback = function(e)
		local map = function(mode, keys, func)
			vim.keymap.set(mode, keys, func, { buffer = e.buf })
		end

		map("n", "gd", vim.lsp.buf.definition)
		map("n", "K", vim.lsp.buf.hover)
		map("n", "<leader>vws", vim.lsp.buf.workspace_symbol)
		map("n", "<leader>vd", vim.diagnostic.open_float)
		map("n", "<leader>vca", vim.lsp.buf.code_action)
		map("n", "<leader>vrr", vim.lsp.buf.references)
		map("n", "<leader>vrn", vim.lsp.buf.rename)
		map("i", "<C-h>", vim.lsp.buf.signature_help)

		-- next
		map("n", "[d", function()
			-- vim.diagnostic.goto_next()
			vim.diagnostic.jump({ count = vim.v.count1, float = true })
		end)

		-- prev
		map("n", "]d", function()
			-- vim.diagnostic.goto_prev()
			vim.diagnostic.jump({ count = -vim.v.count1, float = true })
		end)

		local function client_supports_method(client, method, bufnr)
			if vim.fn.has("nvim-0.12") == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end

		local client = vim.lsp.get_client_by_id(e.data.client_id)

		if
			client
			and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, e.buf)
		then
			local highlight_group = augroup("lsp-highlight", { clear = false })
			autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = e.buf,
				group = highlight_group,
				callback = vim.lsp.buf.document_highlight,
			})

			autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = e.buf,
				group = highlight_group,
				callback = vim.lsp.buf.clear_references,
			})

			autocmd("LspDetach", {
				group = augroup("lsp-detach", { clear = true }),
				callback = function(event)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event.buf })
				end,
			})
		end

		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, e.buf) then
			map("n", "<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = e.buf }))
			end)
		end
	end,
})

autocmd("BufEnter", {
	group = dead8309Group,
	callback = function()
		if vim.bo.filetype == "zig" then
			vim.lsp.inlay_hint.enable(true)
		end
	end,
})

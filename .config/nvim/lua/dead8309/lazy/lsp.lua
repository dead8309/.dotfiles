return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"j-hui/fidget.nvim",
		"pmizio/typescript-tools.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"tsserver",
				"clangd",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					-- https://github.com/pmizio/typescript-tools.nvim/issues/300#issuecomment-2438576975
					if server_name == "tsserver" then
						return
					end
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "path" },
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		require("typescript-tools").setup({
			capabilities = capabilities,
			settings = {
				-- spawn additional tsserver instance to calculate diagnostics on it
				separate_diagnostic_server = true,
				-- "change"|"insert_leave" determine when the client asks the server about diagnostic
				publish_diagnostic_on = "insert_leave",
				-- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
				-- "remove_unused_imports"|"organize_imports") -- or string "all"
				-- to include all supported code actions
				-- specify commands exposed as code_actions
				expose_as_code_action = "all",
				-- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
				-- not exists then standard path resolution strategy is applied
				tsserver_path = nil,
				-- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
				-- (see 💅 `styled-components` support section)
				tsserver_plugins = {},
				-- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
				-- memory limit in megabytes or "auto"(basically no limit)
				tsserver_max_memory = "auto",
				-- described below
				tsserver_format_options = {},
				tsserver_file_preferences = {},
				-- locale of all tsserver messages, supported locales you can find here:
				-- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
				tsserver_locale = "en",
				-- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
				complete_function_calls = false,
				include_completions_with_insert_text = true,
				-- CodeLens
				-- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
				-- possible values: ("off"|"all"|"implementations_only"|"references_only")
				code_lens = "off",
				-- by default code lenses are displayed on all referencable values and for some of you it can
				-- be too much this option reduce count of them by removing member references from lenses
				disable_member_code_lens = true,
				-- JSXCloseTag
				-- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
				-- that maybe have a conflict if enable this feature. )
				jsx_close_tag = {
					enable = false,
					filetypes = { "javascriptreact", "typescriptreact" },
				},
			},
		})
	end,
}

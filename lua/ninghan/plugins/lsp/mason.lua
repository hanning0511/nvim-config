-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"lua_ls",
		"pyright",
		"rust_analyzer",
		"gopls",
		"bashls",
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettier", -- ts/js formatter
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
		"rustfmt", -- rust formatter
		"autopep8", -- python formatter
		"gofmt", -- go formatter
		"gofumpt", -- Enforce a stricter format than gofmt, while being backwards compatible. That is, gofumpt is happy with a subset of the formats that gofmt is happy with
		"goimports", -- Updates your Go import lines, adding missing ones and removing unreferenced ones
		"goimports_reviser", -- go formatter to sort goimports by 3 groups: std, general and project dependencies
		"golines", -- go formatter for long lines
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})

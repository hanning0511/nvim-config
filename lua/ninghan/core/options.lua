local opt = vim.opt
local api = vim.api

-- no swap file
opt.swapfile = false

-- line numbers
opt.number = true

-- search
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clpboard
opt.clipboard:append("unnamedplus")

-- indentation
api.nvim_create_autocmd("FileType", {
	pattern = "sh",
	command = "setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2",
})
api.nvim_create_autocmd("FileType", {
	pattern = "go",
	command = "setlocal tabstop=4 shiftwidth=4 softtabstop=4",
})
api.nvim_create_autocmd("FileType", {
	pattern = "json",
	command = "setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4",
})
api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	command = "setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2",
})
api.nvim_create_autocmd("FileType", {
	pattern = "javascript",
	command = "setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2",
})
api.nvim_create_autocmd("FileType", {
	pattern = "javascriptreact",
	command = "setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2",
})

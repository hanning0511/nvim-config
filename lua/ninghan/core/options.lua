local opt = vim.opt
local api = vim.api

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

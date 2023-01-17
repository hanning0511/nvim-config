-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({})

local keymap = vim.keymap.set

keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
-- rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")
-- peek definition
keymap("n", "pd", "<cmd>Lspsaga peek_definition<CR>")
-- goto definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
-- call hierarchy
keymap("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
-- toggle outline
keymap("n", "<leader>co", "<cmd>Lspsaga outline<CR>")
-- toggle float terminal
keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")

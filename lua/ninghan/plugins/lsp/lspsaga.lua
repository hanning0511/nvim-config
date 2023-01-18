-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
	return
end

saga.setup({})

local keymap = vim.keymap.set

-- lsp finder
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
-- rename
keymap("n", "rn", "<cmd>Lspsaga rename<CR>")
-- peek definition
keymap("n", "pd", "<cmd>Lspsaga peek_definition<CR>")
-- goto definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")
-- call hierarchy
keymap("n", "ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "co", "<cmd>Lspsaga outgoing_calls<CR>")
-- toggle outline
keymap("n", "<leader>co", "<cmd>Lspsaga outline<CR>")
-- toggle float terminal
keymap({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
-- code action
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
-- line diagnostics
keymap("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>")
keymap("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
keymap("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
-- hover document
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

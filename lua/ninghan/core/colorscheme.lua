local status, _ = pcall(vim.cmd, "colorscheme onelight")
if not status then
	print("Colorscheme not found!")
	return
end

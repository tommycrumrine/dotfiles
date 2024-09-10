vim.keymap.set("n", "<C-J>", "<C-W><C-J>", { desc = "switch panes down" })
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", { desc = "switch panes up" })
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", { desc = "switch panes right" })
vim.keymap.set("n", "<C-H>", "<C-W><C-H>", { desc = "switch panes left" })

vim.api.nvim_create_user_command("DiagnosticToggle", function()
	local config = vim.diagnostic.config
	local vt = config().virtual_text
	config {
		virtual_text = not vt,
		underline = not vt,
		signs = not vt,
	}
end, { desc = "toggle diagnostic" })

return {
  "thoughtbot/vim-rspec",
  config = function()
    vim.keymap.set("n", "<C-s>t", "<cmd>RunCurrentSpecFile<cr>")
    vim.keymap.set("n", "<C-s>s", "<cmd>RunNearestSpec<cr>")
    vim.keymap.set("n", "<C-s>l", "<cmd>RunLastSpec<cr>")
  end,
}

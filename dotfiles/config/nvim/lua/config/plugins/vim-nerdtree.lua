return {
  "preservim/nerdtree",
  config = function()
    vim.keymap.set("n", "<C-n>", "<cmd>NERDTreeToggle<cr>")
  end,
}

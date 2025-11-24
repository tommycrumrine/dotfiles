return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    "copilotlsp-nvim/copilot-lsp",
  },
  config = function()
    vim.lsp.enable("copilot")
  end,
}

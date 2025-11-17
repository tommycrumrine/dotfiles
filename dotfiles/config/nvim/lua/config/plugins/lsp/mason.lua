return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    mason.setup()

    mason_lspconfig.setup({
      ensure_installed = {
        "ts_ls",
        "html",
        "lua_ls",
        "ruby_lsp",
        "rubocop",
        "copilot",
      },
      automatic_installation = true,
    })
  end,
}

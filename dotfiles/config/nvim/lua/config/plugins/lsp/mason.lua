return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    mason.setup()

    mason_lspconfig.setup({
      ensure_installed = {
        "tsserver",
        "html",
        "lua_ls",
        "ruby_lsp",
        "rubocop",
      },
      automatic_installation = true,
    })
  end,
}

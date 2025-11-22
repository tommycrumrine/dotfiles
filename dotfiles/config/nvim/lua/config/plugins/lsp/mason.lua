return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = {
      "ts_ls",
      "html",
      "lua_ls",
      "ruby_lsp",
      "rubocop",
      "copilot",
    },
    automatic_installation = true,
  },
}

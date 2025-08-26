return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- servers are enabled by mason-lspconfig; keymaps apply to any LSP that attaches
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, silent = true, desc = desc })
        end

        map("n", "gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references")
        map("n", "gr", vim.lsp.buf.references, "List references")
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions")
        map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
        map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions")
        map("n", "<space>D", vim.lsp.buf.type_definition, "Go to type definition")
        map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, "See available code actions")
        map("n", "<space>rn", vim.lsp.buf.rename, "Smart rename")
        map("n", "<space>f", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")
        map("n", "K", vim.lsp.buf.hover, "Show documentation for what is under cursor")

        map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics")
        map("n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics")
        map("n", "[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Go to previous diagnostic")
        map("n", "]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Go to next diagnostic")
        map("n", "<space>q", vim.diagnostic.setloclist, "Diagnostics to loclist")

        map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
        map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
        map("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, "List workspace folders")

        map("n", "<leader>rs", "<cmd>LspRestart<CR>", "Restart LSP")
      end,
    })
  end,
}

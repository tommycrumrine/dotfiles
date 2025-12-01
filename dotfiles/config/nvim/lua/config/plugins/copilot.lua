return {
  "zbirenbaum/copilot.lua",
  opts = {},
  init = function()
    vim.g.copilot_nes_debounce = 500
    vim.lsp.enable("copilot_ls")
    vim.keymap.set("n", "<tab>", function()
      local bufnr = vim.api.nvim_get_current_buf()
      local state = vim.b[bufnr].nes_state
      if state then
        local _ = require("copilot-lsp.nes").walk_cursor_start_edit()
          or (
            require("copilot-lsp.nes").apply_pending_nes()
            and require("copilot-lsp.nes").walk_cursor_end_edit()
          )
        return nil
      else
        return "<C-i>"
      end
    end, { desc = "Accept Copilot NES suggestion", expr = true })
  end,
  dependencies = {
    { 
      "copilotlsp-nvim/copilot-lsp",
      opts = {}
    }
  },
  config = function()
    require("copilot").setup({
      nes = {
        enabled = true,
        keymap = {
          accept_and_goto = "<C-p",
          accept = false,
          dismiss = "<Esc>",
        },
      },
    })
    -- Clear copilot suggestion with Esc if visible, otherwise preserve default Esc behavior
    vim.keymap.set("n", "<esc>", function()
      if not require("copilot-lsp.nes").clear() then
        -- fallback to other functionality
        print("No Copilot suggestion to clear")
      end
    end, { desc = "Clear Copilot suggestion or fallback" })
  end,
}

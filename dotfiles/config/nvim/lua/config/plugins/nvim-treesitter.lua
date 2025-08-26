return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false, -- main branch does not support lazy-loading
    dependencies = {
      "RRethy/nvim-treesitter-endwise",
    },
    build = ":TSUpdate",
    config = function()
      -- requires tree-sitter-cli (brew install tree-sitter-cli) to build parsers
      require("nvim-treesitter").install({
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "ruby",
        "markdown",
        "lua",
        "vim",
        "vimdoc",
        "gitignore",
        "vue",
        "scss",
        "fish",
      })

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("UserTreesitter", {}),
        callback = function(ev)
          if not pcall(vim.treesitter.start, ev.buf) then
            return -- no parser for this filetype
          end
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })

      -- incremental selection via nvim 0.12's built-in an/in treesitter text objects
      vim.keymap.set("n", "<C-space>", "van", { remap = true, desc = "Start treesitter selection" })
      vim.keymap.set("x", "<C-space>", "an", { remap = true, desc = "Expand treesitter selection" })
      vim.keymap.set("x", "<bs>", "in", { remap = true, desc = "Shrink treesitter selection" })
    end,
  },
}

return {
  "prettier/vim-prettier",
  config = function()
    vim.cmd [[
      : let g:prettier#autoformat = 1
      : let g:prettier#autoformat_require_pragma = 0
      : augroup Prettier
      :   autocmd!
      :   autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.gql,*.markdown,*.md,*.mdown,*.mkd,*.mkdn,*.mdx,*.vue,*.svelte,*.yml,*.yaml,*.html,*.xml noautocmd call prettier#Autoformat()
      : augroup end
    ]]
  end,

}

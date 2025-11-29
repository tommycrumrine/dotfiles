return {
  name = "copilot",
  cmd = {
    "copilot-language-server",
    "--stdio",
  },
  settings = {
    nextEditSuggestions = {
      enabled = true,
    },
  },
  root_dir = vim.uv.cwd(),
}

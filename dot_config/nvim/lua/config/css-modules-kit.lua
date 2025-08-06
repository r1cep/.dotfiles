vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
      {
        name = '@css-modules-kit/ts-plugin',
        languages = { 'css' },
      },
    },
  },
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'css' },
})

vim.lsp.enable({ "ts_ls" })

-- LSP

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
        config = function()
          -- require('lspconfig').lua_ls.setup({})
          vim.lsp.config("lua_ls", {})
        end
      },
    }
  },
  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      -- Load CoC configuration
      vim.cmd('source ' .. vim.env.XDG_CONFIG_HOME .. '/nvim/plugins/coc.rc.vim')
    end,
  },
}

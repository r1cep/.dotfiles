return {
  -- CoC.nvim for LSP
  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      -- Load CoC configuration
      vim.cmd('source ' .. vim.env.XDG_CONFIG_HOME .. '/nvim/plugins/coc.rc.vim')
    end,
  },
}


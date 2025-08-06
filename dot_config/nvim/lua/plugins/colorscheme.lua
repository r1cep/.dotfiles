-- Molokai colorscheme

return {
  {
    "tomasr/molokai",
    priority = 1000,
    config = function()
      vim.g.molokai_original = 1
      vim.g.rehash256 = 1
      vim.cmd([[colorscheme molokai]])
    end,
  },
}

-- Vim-airline statusline

return {
  {
    "vim-airline/vim-airline",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      vim.g.airline_powerline_fonts = 1
      vim.g['airline#extensions#tabline#enabled'] = 1
      vim.g.airline_left_sep = '⮀'
      vim.g.airline_left_alt_sep = '⮁'
      vim.g.airline_right_sep = '⮂'
      vim.g.airline_right_alt_sep = '⮃'
      vim.g.airline_branch_prefix = '⭠'
      vim.g.airline_readonly_symbol = '⭤'
      vim.g.airline_linecolumn_prefix = '⭡'
    end,
  },
}


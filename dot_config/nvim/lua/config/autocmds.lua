-- autocmds

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Tmux settings {{{
-- ref. https://qiita.com/ssh0/items/9300a22954cf7016279d
local tmux = augroup("tmux", {});

autocmd("BufEnter", {
  group = tmux,
  pattern = "*",
  callback = function()
    vim.system({
      "tmux",
      "rename-window",
      "[vim] " .. vim.fn.expand("%:t"),
    })
  end
})

autocmd("VimLeave", {
  group = tmux,
  pattern = "*",
  callback = function()
    vim.system({
      "tmux",
      "rename-window",
      "fish"
    })
  end
})
-- }}}

-- HighlightTrailingSpaces {{{
local HighlightTrailingSpaces = augroup("HighlightTrailingSpaces", {})

autocmd({ "VimEnter", "WinEnter", "ColorScheme" }, {
  group = HighlightTrailingSpaces,
  pattern = "*",
  command = "highlight TrailingSpaces term=underline guibg=darkgray ctermbg=darkgray"
})
autocmd({ "VimEnter", "WinEnter" }, {
  group = HighlightTrailingSpaces,
  pattern = "*",
  command = "match TrailingSpaces /\\s\\+$/"
})
-- }}}

-- vim:foldmethod=marker:foldlevel=0

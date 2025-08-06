-- Neovim configuration with lazy.nvim

-- Vimscript configuration (from original init.vim)
vim.cmd [[
" Misc {{{
" faster redraw
set ttyfast
" enable backspace
set backspace=indent,eol,start
" }}}

" Spaces & Tabs {{{
set tabstop=4
set shiftwidth=4
" behavior when pressed backspace key.
set softtabstop=4
" replace TAB to spaces
set expandtab

augroup vimrc
  autocmd! FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType lua setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType toml setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType typescript setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType typescriptreact setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType twig setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

set autoindent
set smartindent
" }}}

" UI Layout {{{
set number
" show command in bottom bar
set showcmd
" Enable show Cursorline at rows.
set cursorline
" Enable show Cursoline at column.
"set cursorcolumn
"Completion command line
"set wildmenu
" higlight matching parenthesis
set showmatch
" time of highlight of matching parenthesis
set matchtime=1
" set East_Asian_Width @see :help ambiwidth
set ambiwidth=double

" Statusline
set laststatus=2
set statusline=%F%m%r%h%w%=%{&fileencoding}\ %{&fileformat}

" Enable to show space highlight trailing spaces.
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=darkgray ctermbg=darkgray
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END
" }}}

" UI Config {{{
" disable beep
set visualbell t_vb=
set noerrorbells
" Enable Using mouse
set mouse=a

" Search & Result {{{
set ignorecase
set smartcase
set hlsearch
" }}}

" Folding {{{
" fold based on indent level
set foldmethod=indent
" max 10 depth
set foldnestmax=10
" don't fold files by default on open
set foldenable
" space open/closes folds
nnoremap <space> za
" start with fold level of 1
set foldlevelstart=10
" }}}

" FileEncoding {{{
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp,cp932
" }}}

" Backups {{{
set noswapfile
" }}}

" Completion {{{
"Change max auto completion number
set pumheight=5
" }}}

" Key mapping {{{
map <space> <leader>

  " Insert mode {{{
    inoremap [] []<LEFT>
    inoremap {} {}<LEFT>
    inoremap () ()<LEFT>
    inoremap <> <><LEFT>
    inoremap '' ''<LEFT>
    inoremap "" ""<LEFT>
  " }}}

  " Normal mode {{{
    nnoremap + <C-a>
    nnoremap - <C-x>
    " Change nowrap keymap <\ + w> ON/OFF
    set nowrap
    nnoremap <Leader>w  :set wrap!<CR>
    "tags List when there are two or more when jumping
    nnoremap <C-]> g<C-]>
  " }}}
" }}}

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

"Tmux settings {{{
" ref. https://qiita.com/ssh0/items/9300a22954cf7016279d
if $TMUX != ""
  augroup titlesettings
    autocmd!
    autocmd BufEnter * call system("tmux rename-window " . "'[vim] " . expand("%:t") . "'")
    autocmd VimLeave * call system("tmux rename-window fish")
    autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
  augroup END
endif
" }}}

" Colors {{{
filetype plugin indent on
syntax enable

" True color settings
set termguicolors
" }}}
]]

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load lazy.nvim
require("lazy").setup("plugins", {
  defaults = {
    lazy = false, -- plugins are not lazy by default
  },
  install = {
    colorscheme = { "molokai" },
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
})
-- vim:foldmethod=marker:foldlevel=0


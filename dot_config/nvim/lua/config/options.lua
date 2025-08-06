-- Options

-- Spaces & Tabs {{{

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
--vim.o.smartindent = true

-- }}} Spaces & Tabs

-- UI Layout {{{

-- line number
vim.o.number = true
-- Enable show Cursorline at rows.
vim.o.cursorline = true
-- higlight matching parenthesis
vim.o.showmatch = true
-- nowrap
vim.o.wrap = false
-- time of highlight of matching parenthesis
vim.opt.matchtime = 1
-- set East_Asian_Width @see :help ambiwidth
vim.o.ambiwidth = "double"
-- Statusline
vim.o.laststatus = 2
vim.o.statusline = "%F%m%r%h%w%=%{&fileencoding} %{&fileformat}"

-- }}}

-- UI Config {{{

-- Mouse {{{
-- Enable Using mouse
vim.o.mouse = "a"
-- }}} Mouse

-- Search & Result {{{
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
-- }}}

-- Folding {{{
-- fold based on indent level
vim.o.foldmethod = "indent"
-- max 10 depth
vim.o.foldnestmax = 10
-- don't fold files by default on open
vim.o.foldenable = true
-- start with fold level of 1
vim.o.foldlevelstart = 10
-- }}}

-- FileEncoding {{{
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.fileencodings = "utf-8,sjis,euc-jp,iso-2022-jp,cp932"
-- }}}

-- Backups {{{
vim.o.swapfile = false
-- }}}

-- Completion {{{
--Change max auto completion number
vim.o.pumheight = 5
-- }}}

-- }}} UI Config

-- vim:foldmethod=marker:foldlevel=0

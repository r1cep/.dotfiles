-- Keymaps

local set = vim.keymap.set

vim.g.mapleader = " "

-- Insert mode {{{

set("i", '[]', '[]<left>', { noremap = true })
set("i", '{}', '{}<left>', { noremap = true })
set("i", '()', '()<left>', { noremap = true })
set("i", '<>', '<><left>', { noremap = true })
set("i", '""', '""<left>', { noremap = true })
set("i", "''", "''<left>", { noremap = true })
set("i", '----', '----<left>', { noremap = true })

-- }}}

-- Normal mode {{{

set("n", "+", "<C-a>", { noremap = true })
set("n", "-", "<C-x>", { noremap = true })
-- Change nowrap keymap <\ + w> ON/OFF
set("n", "<Leader>w", ":set wrap!<CR>", { noremap = true })
--tags List when there are two or more when jumping
set("n", "<C-]>", "g<C-]>", { noremap = true })

-- }}}

-- vim:foldmethod=marker:foldlevel=0

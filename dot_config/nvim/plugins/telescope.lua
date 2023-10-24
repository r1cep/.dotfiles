-- Keymap
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fs', builtin.help_tags, {})

-- Setup
local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-u>"] = false,
      },
      n = {
        ["q"] = actions.close,
      },
    },
  },
}

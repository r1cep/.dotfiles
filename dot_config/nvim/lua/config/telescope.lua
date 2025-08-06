-- Telescope configuration
local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require('telescope.builtin')

-- Keymaps
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fs', builtin.help_tags, {})
vim.keymap.set("n", "<leader>l", "<cmd>Telescope frecency<CR>", {
  noremap = true,
  silent = true
})

-- Setup
telescope.setup {
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
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    frecency = {
      disable_devicons = false,
      ignore_patterns = {
        "*.git/*",
        "*/tmp/*",
        "*/node_modules/*"
      },
    }
  },
}

-- Load extensions
telescope.load_extension('fzf')
telescope.load_extension("frecency")

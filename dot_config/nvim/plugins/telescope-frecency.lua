-- Keymap
vim.keymap.set("n", "<leader>l", "<cmd>Telescope frecency<CR>", {
  noremap = true,
  silent = true
})

-- Setup
require("telescope").load_extension("frecency")

require("telescope").setup {
  extensions = {
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

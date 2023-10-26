-- telescope-fzf-native.nvim
require('telescope').load_extension('fzf')

require("telescope").setup {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

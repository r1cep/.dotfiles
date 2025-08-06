-- Telescope (requires plenary)

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    keys = {
      -- ファイル検索
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Telescope: ファイルを検索",
      },
      -- ライブ検索
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Telescope: ライブ検索",
      },
      -- バッファ検索
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Telescope: バッファを検索",
      },
      -- ヘルプタグ検索
      {
        "<leader>fh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Telescope: ヘルプタグを検索",
      },
      -- カスタム文字列検索
      {
        "<leader>fs",
        function()
          require("telescope.builtin").grep_string({
            search = vim.fn.input("Search > "),
          })
        end,
        desc = "Telescope: カスタム検索文字列で検索",
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      -- Setup
      telescope.setup({
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
        },
      })

      -- Load extensions
      telescope.load_extension("fzf")
    end,
  },
}

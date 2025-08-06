return {
  -- Quickrun
  {
    "thinca/vim-quickrun",
  },

  -- Emmet for HTML/CSS
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascript", "typescript", "typescriptreact", "vue" },
    config = function()
      vim.g.user_emmet_settings = {
        variables = {
          lang = 'ja'
        }
      }
    end,
  },

  -- WakaTime
  {
    "wakatime/vim-wakatime",
  },
}
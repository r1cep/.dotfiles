-- nvim-web-devicons

return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      -- override = {
      --   ts = {
      --     icon = '󰛦',
      --     color = '#3178C6'
      --   }
      -- }
    },
    config = function()
      require("nvim-web-devicons").setup({
        override = {
          ts = {
            icon = '󰛦',
            color = '#3178C6'
          }
        }
      })
    end
  },
}

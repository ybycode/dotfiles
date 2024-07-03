return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      -- vim.cmd([[colorscheme carbonfox]])
      -- vim.cmd([[colorscheme dawnfox]])
      -- vim.cmd([[colorscheme dayfox]])
      -- vim.cmd([[colorscheme duskfox]])
      -- vim.cmd([[colorscheme nightfox]])
      -- vim.cmd([[colorscheme nordfox]])
      vim.cmd([[colorscheme terafox]])
    end,
  },
}

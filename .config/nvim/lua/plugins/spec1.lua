return {
  -- the colorscheme should be available when starting Neovim
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- load the colorscheme here
  --     vim.cmd([[colorscheme tokyonight]])
  --   end,
  -- },

  -- I have a separate config.mappings file where I require which-key.
  -- With lazy the plugin will be automatically loaded when it is required somewhere
  { "folke/which-key.nvim", lazy = true },

  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },

  -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
  -- So for api plugins like devicons, we can always set lazy=true
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- to improve the default vim.ui interfaces
  { "stevearc/dressing.nvim", event = "VeryLazy" },

  -- -- for splitting/joining blocks of code
  -- {
  --   "Wansmer/treesj",
  --   keys = {
  --     { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
  --   },
  --   opts = { use_default_keymaps = false, max_join_length = 150 },
  -- },
}

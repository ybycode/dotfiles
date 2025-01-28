  -- return {
  -- { dir = "~/plugins/plenary.nvim" },
  -- {
  --   dir = "~/plugins/telescope.nvim/",
  --   dependencies = {
  --     { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  --     "nvim-telescope/telescope-smart-history.nvim",
  --     "nvim-telescope/telescope-ui-select.nvim",
  --     "kkharji/sqlite.lua",
  --   },
  --   config = function()
  --     require "custom.telescope"
  --   end,
  -- },
  -- }
return {
  'nvim-telescope/telescope.nvim',
   branch = '0.1.x',
   dependencies = { 'nvim-lua/plenary.nvim' },
   opts = {
     defaults = {
       mappings = {
         i = {
           ["<C-j>"] = "move_selection_next",
           ["<C-k>"] = "move_selection_previous",
         },
       },
     },
   },
}

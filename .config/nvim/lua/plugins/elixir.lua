return {
  {
    "mhinz/vim-mix-format",
    config = function()
      --  Format elixir files on save:
      vim.g.mix_format_on_save = 1
    end,
  },
}


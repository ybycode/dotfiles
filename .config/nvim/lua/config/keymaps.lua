-- use jk for escape insert mode:
vim.keymap.set('i', 'jk', '<esc>', { noremap = true })
-- use leader w for saving:
vim.keymap.set('n', '<leader>w', ':update<CR>', { noremap = true, silent = true })
-- toggle the tree view
-- switch between the last two buffers
vim.keymap.set('n', '<leader><leader>', '<c-^>', { noremap = true })
-- window navigation with the control key:
vim.keymap.set('n', '<C-h>', '<C-W>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-W>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-W>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-W>l', { noremap = true })
-- remove highlight of search when asked:
-- nnoremap <silent> <leader>n :nohlsearch<CR>
vim.keymap.set('n', '<leader>n', ':nohlsearch<CR>', { noremap = true, silent = true})

local telescope_builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})
vim.keymap.set('n', '<leader>fw', telescope_builtin.grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>fd', telescope_builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>fr', telescope_builtin.resume, { desc = '[S]earch [R]esume' })
-- for the Most Recent Used files (what ctrl-p was providing):
local telescope_extensions = require('telescope').extensions
vim.keymap.set('n', '<leader>m', telescope_extensions.recent_files.pick, {})

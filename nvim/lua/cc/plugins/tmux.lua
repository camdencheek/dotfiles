vim.g.tmux_navigator_no_mappings = 1
local a = vim.api
a.nvim_set_keymap('',  '<C-h>', '<cmd>TmuxNavigateLeft<cr>',  { silent = true, noremap = true })
a.nvim_set_keymap('!', '<C-h>', '<cmd>TmuxNavigateLeft<cr>',  { silent = true, noremap = true })
a.nvim_set_keymap('',  '<C-l>', '<cmd>TmuxNavigateRight<cr>', { silent = true, noremap = true })
a.nvim_set_keymap('!', '<C-l>', '<cmd>TmuxNavigateRight<cr>', { silent = true, noremap = true })
a.nvim_set_keymap('',  '<C-k>', '<cmd>TmuxNavigateUp<cr>',    { silent = true, noremap = true })
a.nvim_set_keymap('!', '<C-k>', '<cmd>TmuxNavigateUp<cr>',    { silent = true, noremap = true })
a.nvim_set_keymap('',  '<C-j>', '<cmd>TmuxNavigateDown<cr>',  { silent = true, noremap = true })
a.nvim_set_keymap('!', '<C-j>', '<cmd>TmuxNavigateDown<cr>',  { silent = true, noremap = true })


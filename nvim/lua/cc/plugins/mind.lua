local mind = require('mind')
mind.setup({})

vim.keymap.set('n', '<C-e>', function() mind.open_main() end)

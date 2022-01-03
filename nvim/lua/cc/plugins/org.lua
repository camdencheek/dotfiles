require('orgmode').setup{
	org_default_notes_file = '~/notes/scratch.org',
	org_agenda_files = '~/notes/**/*.org',
	org_agenda_templates = {
		t = { description = 'Task', template = '* TODO %?\n %u' },
		j = { description = 'Journal', template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?', target = '~/notes/org/journal.org' }
	},
	mappings = {
		capture = {
			org_capture_finalize = '<Leader>w'
		}
	}
}

-- This is necessary because ftplugin/org.vim sets foldlevel=0
vim.cmd[[
    autocmd BufEnter *.org setlocal foldlevel=99
]]

-- Enable treesitter indentation on org mode files
vim.cmd[[
    autocmd BufEnter *.org lua require('nvim-treesitter.configs').setup { indent = true }
]]


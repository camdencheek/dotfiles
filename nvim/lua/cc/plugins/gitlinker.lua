require('gitlinker').setup{
	mappings = nil,
}

local function sourcegraph_url_for_data(url_data)
	local url = "https://sourcegraph.com/"
		.. url_data.host
		.. "/"
		.. url_data.repo
	if url_data.rev then
		url = url .. "@" .. url_data.rev
	end
	if url_data.file then
		url = url .. "/-/blob/" .. url_data.file
	end
	if url_data.lstart then
		url = url .. "?L" .. url_data.lstart
	end
	return url
end

local function get_buf_range_sourcegraph_url(mode)
	local opts = require("gitlinker.opts")
	local url_data = require('gitlinker').get_buf_range_url_data(mode, opts)
	return sourcegraph_url_for_data(url_data)
end

local function get_repo_sourcegraph_url(mode)
	local opts = require("gitlinker.opts")
	local url_data = require('gitlinker').get_repo_url_data(mode, opts)
	return sourcegraph_url_for_data(url_data)
end

local actions = require('gitlinker.actions')

function _G.sgbrowse(range, bang)
	local mode = range > 0 and 'v' or 'n'
	local url = get_buf_range_sourcegraph_url(mode)

	local hasBang = bang == '!'
	if hasBang then
		actions.copy_to_clipboard(url)
	else
		actions.open_in_browser(url)
	end
end

function _G.sgrepo(range, bang)
	local mode = range > 0 and 'v' or 'n'
	local url = get_repo_sourcegraph_url(mode)

	local hasBang = bang == '!'
	if hasBang then
		actions.copy_to_clipboard(url)
	else
		actions.open_in_browser(url)
	end
end

vim.cmd([[
	command! -nargs=0 -range -bang SGBrowse call v:lua.sgbrowse(<range>, '<bang>')
]])
vim.cmd([[
	command! -nargs=0 -range -bang SGRepo call v:lua.sgrepo(<range>, '<bang>')
]])

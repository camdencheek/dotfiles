-- TODO convert to lua once https://github.com/neovim/neovim/pull/13896 is complete
vim.api.nvim_exec([[
command! -nargs=1 -range -bang Extract lua require('cc/notes').extract(<line1>, <line2>, <range>, <q-args>)
]], false)


local m = {}

local dirname = function(path)
    for i = #path - 1, 1, -1 do
	local c = string.sub(path, i, i)
	if c == '/' then return string.sub(path, 1, i-1) end
    end
    return "."
end

m.extract = function(first, last, range, dst)
    local src_file = vim.api.nvim_buf_get_name(0)
    assert(src_file ~= "", "the current buffer does not have a name")

    local buf1 = vim.api.nvim_win_get_buf(0)

    -- If no range is provided, move the whole file to the index
    -- of the named subdirectory.
    local dst_file
    local content
    if range == 0 then
	content = vim.api.nvim_buf_get_lines(buf1, 0, -1, false)
	dst_file = dirname(src_file).."/"..dst.."/index.md"
    else
	content = vim.api.nvim_buf_get_lines(buf1, first-1, last, false)
	dst_file = dirname(src_file).."/"..dst..".md"
    end


    -- Create a new buffer, and set its content to the extracted section
    local buf2 = vim.api.nvim_create_buf(true, false)
    vim.api.nvim_buf_set_name(buf2, dst_file)
    vim.api.nvim_buf_set_lines(buf2, 0, -1, true, content)

    vim.api.nvim_set_current_buf(buf2)
    if range == 0 then
	vim.loop.fs_unlink(src_file)
    else
	vim.api.nvim_buf_set_lines(buf1, first-1, last, f, {"["..dst.."]("..dst_file..")"})
    end
end

return m


local M = {}

function M.config()
    require('gitlinker').setup {
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
            if url_data.lend then
                url = url .. '-' .. url_data.lend
            end
        end
        return url
    end

    local function get_buf_range_sourcegraph_url(args)
        local opts = require("gitlinker.opts")
        local url_data = require('gitlinker').get_buf_range_url_data('n', opts)

        if args.range == 1 then
            url_data.lstart = args.line1
        elseif args.range == 2 then
            url_data.lstart = args.line1
            url_data.lend = args.line2
        end

        return sourcegraph_url_for_data(url_data)
    end

    local actions = require('gitlinker.actions')

    local function sgbrowse(args)
        local url = get_buf_range_sourcegraph_url(args)

        if args.bang then
            actions.copy_to_clipboard(url)
        else
            actions.open_in_browser(url)
        end
    end

    vim.api.nvim_create_user_command('SGBrowse', function(args)
        sgbrowse(args)
    end, {
        range = true,
        bang = true,
    })
end

return M

local w = require("wezterm")

local config = w.config_builder()

config.font = w.font({
	family = "Intel One Mono",
})
config.font_size = 14.0

config.color_scheme = "Gruvbox Dark (Gogh)"

config.tab_bar_at_bottom = true
config.window_decorations = "RESIZE"
config.scrollback_lines = 10000

-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end

-- if you *ARE* lazy-loading smart-splits.nvim (not recommended)
-- you have to use this instead, but note that this will not work
-- in all cases (e.g. over an SSH connection). Also note that
-- `pane:get_foreground_process_name()` can have high and highly variable
-- latency, so the other implementation of `is_vim()` will be more
-- performant as well.
local function is_vim(pane)
	-- This gsub is equivalent to POSIX basename(3)
	-- Given "/foo/bar" returns "bar"
	-- Given "c:\\foo\\bar" returns "bar"
	local process_name = string.gsub(pane:get_foreground_process_name(), "(.*[/\\])(.*)", "%2")
	return process_name == "nvim" or process_name == "vim"
end

local direction_keys = {
	Left = "h",
	Down = "j",
	Up = "k",
	Right = "l",
	-- reverse lookup
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = w.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

config.leader = { key = "s", mods = "CTRL", timeout_milliseconds = 500 }
config.keys = {

	-- Disable capturing global shortcuts
	{ key = "l", mods = "CMD|SHIFT", action = w.action.DisableDefaultAssignment },
	{ key = ";", mods = "CMD|SHIFT", action = w.action.DisableDefaultAssignment },

	-- copy mode
	{ key = "v", mods = "LEADER", action = w.action.ActivateCopyMode },

	-- split screen
	{ key = "\\", mods = "LEADER", action = w.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "-", mods = "LEADER", action = w.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "c", mods = "LEADER", action = w.action({ SpawnTab = "CurrentPaneDomain" }) },

	-- move between split panes
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	-- resize panes
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),
}

return config

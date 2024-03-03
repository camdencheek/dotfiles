local hs = hs

hs.grid.setGrid(hs.geometry("2x2"))
hs.grid.setMargins(hs.geometry({ w = 0, h = 0 }))
hs.window.animationDuration = 0

local gridLeft = hs.geometry({ x = 0, y = 0, w = 1, h = 2 })
local gridRight = hs.geometry({ x = 1, y = 0, w = 1, h = 2 })
local gridTop = hs.geometry({ x = 0, y = 0, w = 2, h = 1 })
local gridBottom = hs.geometry({ x = 0, y = 1, w = 2, h = 1 })

local function tableMerge(t1, t2)
	for k, v in pairs(t2) do
		t1[k] = v
	end
end

local function axHotfix(win)
	if not win then
		win = hs.window.frontmostWindow()
	end

	local axApp = hs.axuielement.applicationElement(win:application())
	local wasEnhanced = axApp.AXEnhancedUserInterface
	if wasEnhanced then
		axApp.AXEnhancedUserInterface = false
	end

	return function()
		if wasEnhanced then
			axApp.AXEnhancedUserInterface = true
		end
	end
end

-- See https://github.com/Hammerspoon/hammerspoon/issues/3224
local function withAxHotfix(fn, position)
	if not position then
		position = 1
	end
	return function(...)
		local args = { ... }
		local revert = axHotfix(args[position])
		fn(...)
		revert()
	end
end

-- Note: these assume a 2x2 grid
local function tileLeft(win)
	hs.grid.adjustWindow(function(cell)
		if cell == gridLeft then
			win:moveOneScreenWest(false, true)
			tableMerge(cell, gridRight)
		else
			tableMerge(cell, gridLeft)
		end
	end, win)
end

local function tileRight(win)
	hs.grid.adjustWindow(function(cell)
		if cell == gridRight then
			win:moveOneScreenEast(false, true)
			tableMerge(cell, gridLeft)
		else
			tableMerge(cell, gridRight)
		end
	end, win)
end

local function tileDown(win)
	hs.grid.set(win, gridBottom)
end

local function tileUp(win)
	hs.grid.set(win, gridTop)
end

-- Tile down binding
hs.hotkey.bind("alt", "j", function()
	withAxHotfix(tileDown)(hs.window.focusedWindow())
end)

-- Tile up binding
hs.hotkey.bind("alt", "k", function()
	withAxHotfix(tileUp)(hs.window.focusedWindow())
end)

-- Tile right binding
hs.hotkey.bind("alt", "l", function()
	withAxHotfix(tileRight)(hs.window.focusedWindow())
end)

-- Tile right binding
hs.hotkey.bind("alt", "h", function()
	withAxHotfix(tileLeft)(hs.window.focusedWindow())
end)

-- Maximize
hs.hotkey.bind("alt", "m", function()
	withAxHotfix(hs.grid.maximizeWindow)(hs.window.focusedWindow())
end)

-- App hotkeys
local browser = "Firefox Developer Edition"
local terminal = "WezTerm"
local slack = "Slack"
local chat = "Telegram"
local music = "Spotify"
hs.fnutils.each({
	{ key = "a", app = browser },
	{ key = "d", app = chat },
	{ key = "s", app = slack },
	{ key = "f", app = music },
	{ key = "space", app = terminal },
}, function(object)
	hs.hotkey.bind("alt", object.key, function()
		hs.application.launchOrFocus(object.app)
	end)
end)

-- Start and stop meeting recording and notes
-- TODO: It would be great to pull names and participants from calendar events
hs.hotkey.bind({ "cmd", "control" }, "l", function()
	hs.shortcuts.run("Record")

	local notes_dir = os.getenv("HOME") .. os.date("/notes/daily/%Y/%m/%d")
	hs.execute("mkdir -p" .. notes_dir)

	local notes_file = notes_dir .. "/index.md"
	print(notes_file)
	local f = io.open(notes_file, "a+")
	f:write("\n# Meeting Notes\n\n")
	f:write(os.date("Start Time: %T\n"))
	f:write(os.date("Participants: Camden, \n"))
	-- TODO: move this into a meetings folder for each day
	f:write(
		os.date(
			"[Recording](../../../meetings/%Y%m%d_%H%M_recording.mp3) and [Transcript](../../../meetings/%Y%m%d_%H%M_transcription.txt)\n\n"
		)
	)
	io.close(f)

	assert(hs.application.launchOrFocus(terminal))
	local wezterm = assert(hs.application.find(terminal))
	hs.eventtap.keyStroke("cmd", "t", 20000, wezterm)
	hs.timer.usleep(2000)
	hs.eventtap.keyStrokes("nvim +99999 " .. notes_file, wezterm)
	hs.timer.usleep(5000)
	hs.eventtap.keyStroke("", "return", wezterm)
end)
hs.hotkey.bind({ "cmd", "control" }, ";", function()
	hs.shortcuts.run("Stop Recording")
end)

-- Brightness controls
local function increaseBrightness()
	local screen = hs.screen.mainScreen()
	local current = screen:getBrightness()
	if current < 1 then
		local newBrightness = math.min(current + 0.1, 1)
		screen:setBrightness(newBrightness)
	end
end

local function decreaseBrightness()
	local screen = hs.screen.mainScreen()
	local current = screen:getBrightness()
	if current > 0 then
		local newBrightness = math.max(current - 0.1, 0)
		screen:setBrightness(newBrightness)
	end
end

hs.hotkey.bind("alt", "e", decreaseBrightness)
hs.hotkey.bind("alt", "r", increaseBrightness)

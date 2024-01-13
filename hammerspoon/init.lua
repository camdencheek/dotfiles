local hs = hs

-- variable config
hs.window.animationDuration = 0
hs.window.setShadows(false)

local tileLeft = function(win)
    local f = win:frame()
    local newf = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    newf.x = max.x
    newf.y = max.y
    newf.w = max.w / 2
    newf.h = max.h

    if f ~= newf then
        win:setFrame(newf, 0)
        return true
    else
        return false
    end
end

local tileRight = function(win)
    local f = win:frame()
    local newf = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    newf.x = max.x + (max.w / 2)
    newf.y = max.y
    newf.w = max.w / 2
    newf.h = max.h

    if f ~= newf then
        win:setFrame(newf, 0)
        return true
    else
        return false
    end
end

local tileUp = function(win)
    local newf = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    newf.x = max.x
    newf.y = max.y
    newf.w = max.w
    newf.h = max.h / 2

    win:setFrame(newf, 0)
end

local tileDown = function(win)
    local newf = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    newf.x = max.x
    newf.y = max.y + (max.h / 2)
    newf.w = max.w
    newf.h = max.h / 2

    win:setFrame(newf, 0)
end

-- Tile down binding
hs.hotkey.bind("alt", "j", function()
    local win = hs.window.focusedWindow()
    tileDown(win)
end)

-- Tile up binding
hs.hotkey.bind("alt", "k", function()
    local win = hs.window.focusedWindow()
    tileUp(win)
end)

-- Tile right binding
hs.hotkey.bind("alt", "l", function()
    local win = hs.window.focusedWindow()
    if not tileRight(win) then
        win:moveOneScreenEast()
        tileLeft(win)
    end
end)

-- Tile right binding
hs.hotkey.bind("alt", "h", function()
    local win = hs.window.focusedWindow()
    if not tileLeft(win) then
        win:moveOneScreenWest()
        tileRight(win)
    end
end)

-- Maximize
hs.hotkey.bind("alt", "m", function()
    local win = hs.window.focusedWindow()
    if win == nil then
        return
    end
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f, 0.01)
end)

-- App hotkeys
local browser = "Firefox Developer Edition"
local terminal = "WezTerm"
local slack = "Slack"
local chat = "Telegram"
local music = "Spotify"
hs.fnutils.each({
    { key = "a",     app = browser },
    { key = "d",     app = chat },
    { key = "s",     app = slack },
    { key = "f",     app = music },
    { key = "space", app = terminal },
}, function(object)
    hs.hotkey.bind("alt", object.key, function()
        hs.application.launchOrFocus(object.app)
    end)
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

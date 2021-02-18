
-- App vars
local browser = "Firefox Developer Edition"
local terminal = "Alacritty"
local slack = "Slack"
local chat = "Telegram"
local notes = "Boostnote"

-- variable config
hs.window.animationDuration = 0
hs.window.setShadows(false)

-- extensions, available in hammerspoon console
ext = {
  frame    = {},
  win      = {},
  app      = {}, 
  utils    = {},
  cache    = {},
  watchers = {}
}


startingLayout = {
    {terminal, nil, hs.screen.find(724852372), hs.layout.right50, nil, nil},
    {browser, nil, hs.screen.find(724852372), hs.layout.left50, nil, nil},
    {slack, nil, hs.screen.find(69733378), hs.layout.maximized, nil, nil},
    {"Code", nil, hs.screen.find(724852499), hs.layout.maximized, nil, nil},
}


tileLeft = function(win) 
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

tileRight = function(win) 
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

tileUp = function(win) 
    local f = win:frame()
    local newf = win:frame()
    local screen = win:screen()
    local max = screen:frame()
    
    newf.x = max.x
    newf.y = max.y
    newf.w = max.w 
    newf.h = max.h / 2

    win:setFrame(newf, 0)
end

tileDown = function(win) 
    local f = win:frame()
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
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  tileDown(win)
end)

-- Tile up binding
hs.hotkey.bind("alt", "k", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  tileUp(win)
end)

-- Tile right binding
hs.hotkey.bind("alt", "l", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  if not tileRight(win) then
      win:moveOneScreenEast()
      tileLeft(win)
  end
end)

-- Tile right binding
hs.hotkey.bind("alt", "h", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

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
hs.fnutils.each({
    { key = "a", app = browser },
    { key = "d", app = chat },
    { key = "s", app = slack },
    { key = "f", app = "Spotify" },
    { key = "space", app = terminal }
}, function(object)
    hs.hotkey.bind("alt", object.key, function() hs.application.launchOrFocus(object.app) end)
end)


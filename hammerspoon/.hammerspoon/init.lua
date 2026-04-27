local hyper = {"ctrl", "shift", "alt", "cmd"}
hs.window.animationDuration = 0  -- prevents Sequoia tiling from overriding setFrame

-- ── App Launchers ──────────────────────────────────────────────────────────────
hs.hotkey.bind(hyper, "t", function() hs.application.launchOrFocus("Microsoft Teams") end)
hs.hotkey.bind(hyper, "g", function() hs.application.launchOrFocus("Telegram") end)
hs.hotkey.bind(hyper, "i", function() hs.application.launchOrFocus("iTerm") end)
hs.hotkey.bind(hyper, "b", function() hs.application.launchOrFocus("Brave Browser") end)
hs.hotkey.bind(hyper, "n", function() hs.application.launchOrFocus("Notes") end)
hs.hotkey.bind(hyper, "s", function() hs.application.launchOrFocus("System Settings") end)

-- ── Window Focus Cycling ───────────────────────────────────────────────────────
local function cycleWindows(direction)
    local all = hs.window.orderedWindows()
    local wins = {}
    for _, w in ipairs(all) do
        if w:isStandard() then table.insert(wins, w) end
    end
    if #wins < 2 then return end
    local focused = hs.window.focusedWindow()
    local idx = 1
    if focused then
        for i, w in ipairs(wins) do
            if w:id() == focused:id() then idx = i; break end
        end
    end
    local next = direction == "next"
        and (idx % #wins) + 1
        or  ((idx - 2) % #wins) + 1
    wins[next]:focus()
end

hs.hotkey.bind(hyper, "left",  function() cycleWindows("prev") end)
hs.hotkey.bind(hyper, "right", function() cycleWindows("next") end)

-- ── Window Snap (resize to half; if already at any half, restore full) ────────
local function snap(dir)
    local win = hs.window.focusedWindow()
    if not win then return end
    local s = win:screen():frame()
    local halves = {
        left   = {x = s.x,         y = s.y,         w = s.w / 2, h = s.h},
        right  = {x = s.x + s.w/2, y = s.y,         w = s.w / 2, h = s.h},
        top    = {x = s.x,         y = s.y,         w = s.w,     h = s.h / 2},
        bottom = {x = s.x,         y = s.y + s.h/2, w = s.w,     h = s.h / 2},
    }
    local f = win:frame()
    for _, t in pairs(halves) do
        if math.abs(f.x - t.x) < 5 and math.abs(f.y - t.y) < 5
        and math.abs(f.w - t.w) < 5 and math.abs(f.h - t.h) < 5 then
            win:setFrame({x = s.x, y = s.y, w = s.w, h = s.h})
            return
        end
    end
    win:setFrame(halves[dir])
end

hs.hotkey.bind(hyper, "h", function() snap("left") end)
hs.hotkey.bind(hyper, "l", function() snap("right") end)
hs.hotkey.bind(hyper, "k", function() snap("top") end)
hs.hotkey.bind(hyper, "j", function() snap("bottom") end)

-- ── Window Move (reposition to edge, keep size) ────────────────────────────────
-- The +1 on the relevant dimension changes both position and size in one atomic
-- setFrame call, which bypasses macOS 26's tile lock (position-only writes are
-- silently blocked for tiled windows; combined position+size writes go through).
local function moveToEdge(dir)
    local win = hs.window.focusedWindow()
    if not win then return end
    local s = win:screen():frame()
    local f = win:frame()
    local tx, ty, tw, th = f.x, f.y, f.w, f.h
    if     dir == "left"   then tx = s.x;             tw = f.w + 1
    elseif dir == "right"  then tw = f.w + 1;         tx = s.x + s.w - tw
    elseif dir == "top"    then ty = s.y;              th = f.h + 1
    elseif dir == "bottom" then th = f.h + 1;         ty = s.y + s.h - th
    end
    win:setFrame({x = tx, y = ty, w = tw, h = th})
end

hs.hotkey.bind(hyper, "a", function() moveToEdge("left") end)
hs.hotkey.bind(hyper, "d", function() moveToEdge("right") end)
hs.hotkey.bind(hyper, "w", function() moveToEdge("top") end)
hs.hotkey.bind(hyper, "z", function() moveToEdge("bottom") end)

-- ── Show Desktop (spread / unite) ─────────────────────────────────────────────
-- Both keys toggle the same macOS Show Desktop shortcut (Cmd+F3 by default).
-- If it doesn't work, enable it in System Settings > Keyboard > Shortcuts > Mission Control.
local function toggleShowDesktop()
    hs.eventtap.keyStroke({"cmd"}, "f3")
end

hs.hotkey.bind(hyper, "o", toggleShowDesktop)
hs.hotkey.bind(hyper, "p", toggleShowDesktop)

-- ── Show Window (unhide frontmost app) ────────────────────────────────────────
hs.hotkey.bind(hyper, "v", function()
    local app = hs.application.frontmostApplication()
    if app then app:unhide() end
end)

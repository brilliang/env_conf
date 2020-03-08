pos = {
    {"Left", { x = 0.00, y = 0.00, w = 0.50, h = 1.00 }},
    {"Right", { x = 0.50, y = 0.00, w = 0.50, h = 1.00 }},
    {"Up", { x = 0.00, y = 0.00, w = 1.00, h = 0.50 }},
    {"Down", { x = 0.00, y = 0.50, w = 1.00, h = 0.50 }},

    {"1", { x = 0.00, y = 0.00, w = 0.333, h = 1.00 }},
    {"2", { x = 0.333, y = 0.00, w = 0.333, h = 1.00 }},
    {"3", { x = 0.666, y = 0.00, w = 0.334, h = 1.00 }},

    {"4", { x = 0.00, y = 0.00, w = 0.666, h = 1.00 }},
    {"5", { x = 0.333, y = 0.00, w = 0.667, h = 1.00 }},

    {"7", { x = 0.00, y = 0.00, w = 0.50, h = 0.50 }},
    {"8", { x = 0.50, y = 0.00, w = 0.50, h = 0.50 }},
    {"9", { x = 0.00, y = 0.50, w = 0.50, h = 0.50 }},
    {"0", { x = 0.50, y = 0.50, w = 0.50, h = 0.50 }},

    {"M", hs.layout.maximized},
}

-- copy from https://github.com/peterkljin/hammerspoon-shiftit
function resizeWindowInSteps(increment)
  screen = hs.window.focusedWindow():screen():frame()
  window = hs.window.focusedWindow():frame()
  wStep = math.floor(screen.w / 12)
  hStep = math.floor(screen.h / 12)
  x = window.x
  y = window.y
  w = window.w
  h = window.h
  if increment then
    xu = math.max(screen.x, x - wStep)
    w = w + (x-xu)
    x=xu
    yu = math.max(screen.y, y - hStep)
    h = h + (y - yu)
    y = yu
    w = math.min(screen.w - x + screen.x, w + wStep)
    h = math.min(screen.h - y + screen.y, h + hStep)
  else
    noChange = true
    notMinWidth = w > wStep * 3
    notMinHeight = h > hStep * 3
    
    snapLeft = x <= screen.x
    snapTop = y <= screen.y
    -- add one pixel in case of odd number of pixels
    snapRight = (x + w + 1) >= (screen.x + screen.w)
    snapBottom = (y + h + 1) >= (screen.y + screen.h)

    b2n = { [true]=1, [false]=0 }
    totalSnaps = b2n[snapLeft] + b2n[snapRight] + b2n[snapTop] + b2n[snapBottom]

    if notMinWidth and (totalSnaps <= 1 or not snapLeft) then
      x = x + wStep
      w = w - wStep
      noChange = false
    end
    if notMinHeight and (totalSnaps <= 1 or not snapTop) then
      y = y + hStep
      h = h - hStep
      noChange = false
    end
    if notMinWidth and (totalSnaps <= 1 or not snapRight) then
      w = w - wStep
      noChange = false
    end
    if notMinHeight and (totalSnaps <= 1 or not snapBottom) then
      h = h - hStep
      noChange = false
    end
    if noChange then
      x = notMinWidth and x + wStep or x
      y = notMinHeight and y + hStep or y
      w = notMinWidth and w - wStep * 2 or w
      h = notMinHeight and h - hStep * 2 or h
    end
  end
  hs.window.focusedWindow():move({x=x, y=y, w=w, h=h}, nil, true, 0)
end


for i = 1, #pos do
    hs.hotkey.bind(
    	{"cmd", "alt", "ctrl"}, pos[i][1], 
    	function() hs.window.focusedWindow():moveToUnit(pos[i][2], 0) end
    )
end

hs.hotkey.bind(
	{"cmd", "alt", "ctrl"}, "F", 
	function() hs.window.focusedWindow():toggleFullScreen() end
)

hs.hotkey.bind(
	{"cmd", "alt", "ctrl"}, "-", 
	function() resizeWindowInSteps(false) end
)
hs.hotkey.bind(
	{"cmd", "alt", "ctrl"}, "=", 
	function() resizeWindowInSteps(true) end
)




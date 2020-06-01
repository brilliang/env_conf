local char_to_hex = function(c)
  return string.format("%%%02X", string.byte(c))
end

local function urlencode(url)
  if url == nil then
    return
  end
  url = url:gsub("\n", "\r\n")
  url = url:gsub("([^%w ])", char_to_hex)
  url = url:gsub(" ", "+")
  return url
end

hs.hotkey.bind({"shift", "ctrl"}, "B", function()
    hs.focus()

    local content = hs.pasteboard.getContents()
    if content ~= nil and content ~= "" then
        content = content:match("^%s*(.-)%s*$")
    end

    button, input = hs.dialog.textPrompt(
        "bunnylol", "Facebook inner search", 
        content,
        "OK", "Cancel"
    )
    if button == "OK" then
        hs.urlevent.openURL("https://our.intern.facebook.com/intern/bunny/?q=" .. urlencode(input))
    end
end)


hs.hotkey.bind({"shift", "ctrl"}, "J", function()
    hs.focus()

    local content = hs.pasteboard.getContents()
    if content ~= nil and content ~= "" then
        content = content:match("^%s*(.-)%s*$")
    end

    button, input = hs.dialog.textPrompt(
        "Google Translate", "translate", 
        content,
        "OK", "Cancel"
    )
    if button == 'Cancel' then
        do return end
    end

    local log = hs.logger.new('g-translate','debug')
    log:w("search input:\"" .. input .. "\". first byte index " .. input:byte())
    
    local sl = "en"
    local tl = "zh-CN"  -- case sensitive
    if input:byte() >= 127 then
        sl = "auto"
        tl = "en"
    end
    
    go_url = string.format("https://translate.google.com/#view=home&op=translate&sl=%s&tl=%s&text=%s", sl, tl, urlencode(input))
    log:w("url=" .. go_url)
    hs.urlevent.openURL(go_url)
end)

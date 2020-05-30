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
    botton, input = hs.dialog.textPrompt("inner search", "bunnylol", hs.pasteboard.getContents():match("^%s*(.-)%s*$"))
    hs.urlevent.openURL("https://our.intern.facebook.com/intern/bunny/?q=" .. urlencode(input))
end)


hs.hotkey.bind({"shift", "ctrl"}, "T", function()
    hs.focus()
    botton, input = hs.dialog.textPrompt("Google Translate", "translate", hs.pasteboard.getContents():match("^%s*(.-)%s*$"))
    local log = hs.logger.new('g-translate','debug')
    log:w("search input:\"" .. input .. "\". first byte index " .. input:byte())
    if input:byte() >= 127 then
        sl = "zh-CN"
        tl = "en"
    else
        sl = "en"
        tl = "zh-CN"
    end
    
    go_url = "https://translate.google.com/?text=" .. urlencode(input) .. "#view=home&op=translate&sl=" .. sl .. "&tl=" .. tl .. "&text=" .. urlencode(input)
    log:w("url=" .. go_url)
    hs.urlevent.openURL(go_url)
end)

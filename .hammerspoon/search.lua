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

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
    hs.focus()
    botton, input = hs.dialog.textPrompt("google search", "google search", hs.pasteboard.getContents())
    hs.urlevent.openURL("https://www.google.com/search?q=" .. urlencode(input))
end)

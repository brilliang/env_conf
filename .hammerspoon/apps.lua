apps = {
    {{"alt"}, "F", "Finder"},
    {{"alt"}, "S", "Safari"},
    {{"alt"}, "C", "Google Chrome"},
    {{"alt"}, "T", "iTerm"},
}
for i = 1, #apps do
    hs.hotkey.bind(apps[i][1], apps[i][2], function() hs.application.open(apps[i][3]) end)
end


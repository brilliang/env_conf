apps = {
    {{"alt"}, "F", "Finder"},
    {{"alt"}, "S", "Safari"},
    {{"alt"}, "C", "Google Chrome"},
    {{"alt"}, "O", "Microsoft Outlook"},

    {{"alt"}, "T", "iTerm"},
    {{"alt"}, "L", "Sublime Text"},
    {{"alt"}, "V", "VS Code @ FB - Insiders"},

    {{"shift", "cmd"}, "W", "Workplace Chat"},
    {{"shift", "cmd"}, "P", "WhatsApp"},
}
for i = 1, #apps do
    hs.hotkey.bind(apps[i][1], apps[i][2], function() hs.application.open(apps[i][3]) end)
end


apps = {
    {{"alt"}, "E", "Finder"},
    {{"alt"}, "S", "Safari"},
    {{"alt"}, "C", "Google Chrome"},
    {{"alt"}, "O", "Microsoft Outlook"},

    {{"alt"}, "T", "iTerm"},
    {{"alt"}, "L", "Sublime Text"},
    {{"alt"}, "D", "Dash"},
    {{"alt"}, "V", "VS Code @ FB - Insiders"},
    {{"alt", "ctrl"}, "Q", "Quip"},
    {{"alt", "ctrl"}, "R", "Reminders"},

    {{"alt", "ctrl"}, "W", "Workplace Chat"},
    {{"alt", "ctrl"}, "P", "WhatsApp"},
}

for i = 1, #apps do
    hs.hotkey.bind(apps[i][1], apps[i][2], function() 
        if hs.window.focusedWindow() == nil then
            hs.application.open(apps[i][3])

        else
            focusd_app = hs.window.focusedWindow():application()
            if focusd_app == nil or focusd_app:name() ~= apps[i][3] then
                hs.application.open(apps[i][3]) 
            else
                focusd_app:hide()
            end
        end
    end)
end


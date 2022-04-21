

runResource = function()
    local allResourcesAreStarted = ""
    for k,v in ipairs(Config.CustomLog) do
        local resourceName = "7DiscordLog:" + v.serverEventName
        allResourcesAreStarted = allResourcesAreStarted .. resourceName .. " | "
        RegisterNetEvent(resourceName)
        AddEventHandler(resourceName, function(title, description)
            sendDiscordLog(v.embedColor, v.webhook, title, description)
        end)
    end
    print("All CustomLogs are loaded: " .. allResourcesAreStarted)
end

sendDiscordLog = function(embedColor, webhook, title, description)

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
        username = Config.username, 
        embeds = {{
            ["color"] = embedColor, 
            ["author"] = {
                ["name"] = Config.communtiyName,
                ["icon_url"] = Config.communtiyLogo
            },
            ["title"] = title,
            ["description"] = description,
            ["footer"] = {
                ["text"] = Config.FooterText.." • "..os.date("%x %X %p"),
                ["icon_url"] = Config.FooterIcon,
            },
        }}, 
        avatar_url = Config.avatar
    }), { 
        ['Content-Type'] = 'application/json' 
    })
end


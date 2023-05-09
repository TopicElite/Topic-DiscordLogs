ESX = nil
Config.FooterText = "Scriptet By TopicElite"

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

NewEvent = function(net,func,name,...)
    if net then RegisterNetEvent(name); end
    AddEventHandler(name, function(...) func(...); end)
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        runResource()
    end
    ResourceLog('Start', resourceName)
end)

AddEventHandler('onResourceStarting', function(resourceName)
    ResourceLog('Starting', resourceName)
end)

AddEventHandler('onResourceStop', function(resourceName)
    ResourceLog('Stop', resourceName)
end)

function ResourceLog(action, resourceName)
    sendDiscordLog(_U('resourcelog_title', resourceName), "resource", action, _U('resourcelog_description', action, resourceName))
end

function CommandLog(xPlayer, command, infos)
    local playerName = xPlayer.getName()
    local description = _U('commandslog_description', command, infos)

    sendDiscordLogxPlayer(getName(xPlayer), "commands", "Command", description, xPlayer)
end

function ItemsLog(xPlayer, action, item, count)
    local playerName = xPlayer.getName()
    local itemLabel = ESX.GetItemLabel(item)
    local actionLabel = _U(action)
    local description = _U('itemslog_description', actionLabel, count, itemLabel, item)

    sendDiscordLogxPlayer(getName(xPlayer), "items", action, description, xPlayer)
end

function MoneyLog(xPlayer, action, account, count)
    if Config.MinMoneyAmount <= count then
        local playerName = xPlayer.getName()
        local accountLabel = _U(account)
        local accountMoney = xPlayer.getAccount(account).money
        local actionLabel = _U(action)
        local description = _U('moneylog_description', actionLabel, count, accountLabel, account, accountMoney)

        sendDiscordLogxPlayer(getName(xPlayer), "money", action, description, xPlayer)
    end
end

function WeaponLog(xPlayer, action, type, weapon, information)
    local playerName = xPlayer.getName()
    local actionLabel = _U(action)
    local weaponLabel = ESX.GetWeaponLabel(weapon)
    local description = ''

    if type == 'weapon' then
        description = _U('weaponlog_description_weapon', actionLabel, weaponLabel, weapon, information)
    elseif type == 'component' then
        local weaponComponentLabel = ESX.GetWeaponComponent(weapon, information).label
        description = _U('weaponlog_description_component', actionLabel, weaponComponentLabel, weaponLabel, weapon)
    elseif type == 'ammo' then
        description = _U('weaponlog_description_ammo', actionLabel, information, weaponLabel, weapon)
    elseif type == 'tint' then
        description = _U('weaponlog_description_tint', actionLabel, information, weaponLabel, weapon)
    else 
        description = _U('weaponlog_description_nothing', actionLabel, weaponLabel, weapon)
    end

    sendDiscordLogxPlayer(getName(xPlayer), "weapon", action, description, xPlayer)
end

function DrugLog(xPlayer, action, drugItem, Information, price)
    local itemLabel = ''
    local actionLabel = _U(action)
    local description = _U('moneylog_description', actionLabel, count, accountLabel, account, accountMoney)

    if drugItem == 'black_money' then
        itemLabel = _U('black_money')
    else
        itemLabel = ESX.GetItemLabel(drugItem)
    end

    if action == 'Sell' then
        description = _U('druglog_description_sell', actionLabel, Information, itemLabel, drugItem, price)
    else
        description = _U('druglog_description', actionLabel, Information, itemLabel, drugItem)
    end

    sendDiscordLogxPlayer(getName(xPlayer), "drugs", action, description, xPlayer)
end

function AmbulanceLog(xPlayer, action, targetxPlayer, price) 
    local actionLabel = _U(action)
    local description = _U('ambulancelog_description', actionLabel, targetxPlayer.getName())

    if action == 'Revive' and price ~= nil then
        description = _U('ambulancelog_revive_for_money', actionLabel, targetxPlayer.getName(), price)
    end

    sendDiscordLogxPlayer(getName(xPlayer), "ambulance", action, description, xPlayer)
end

function AfterRpDeathLog(xPlayer, money, blackmoney, weaponlist, itemlist)

    local description = _U("afterrpdeathlog_description", money, blackmoney, weaponlist, itemlist)
    sendDiscordLogxPlayer(getName(xPlayer), "afterRPDeath", "Remove", description, xPlayer)    
end

function SocietyLog(xPlayer, action, societyName, Information)
    local actionLabel = _U(action)
    local description = _U('societylog_description', societyName, actionLabel, Information)

    if action == 'Hire' or action == 'Promote' or action == 'Fire' then
        description = _U('societylog_description', societyName, actionLabel, getName(Information))
    end

    sendDiscordLogxPlayer(getName(xPlayer), "society", action, description, xPlayer)
end

function getColorByAction(action)
    local color = Config.ActionColors[action]

    if color == nil then
        color = Config.ActionColors.Nothing
    end

    return color
end

function getName(xPlayer)
    local name = _U('console')

    if xPlayer ~= nil then
        name = xPlayer.getName()

    end
    
    return name
end

function sendDiscordLog(title, log, action, description)
    PerformHttpRequest(Config.webhooks[log], function(err, text, headers) end, 'POST', json.encode({
        username = Config.username, 
        embeds = {{
            ["color"] = getColorByAction(action), 
            ["author"] = {
                ["name"] = Config.communtiyName,
                ["icon_url"] = Config.communtiyLogo
            },
            ["title"] = tostring(title),
            ["description"] = tostring(description),
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

function sendDiscordLogxPlayer(title, log, action, description, xPlayer)
    local source = xPlayer.source
    local playerDetails = GetPlayerDetails(source)
    PerformHttpRequest(Config.webhooks[log], function(err, text, headers) end, 'POST', json.encode({
        username = Config.username, 
        embeds = {{
            ["color"] = getColorByAction(action), 
            ["author"] = {
                ["name"] = Config.communtiyName,
                ["icon_url"] = Config.communtiyLogo
            },
            ["title"] = tostring(title),
            ["description"] = tostring(description),
            ["footer"] = {
                ["text"] = Config.FooterText.." • "..os.date("%x %X %p"),
                ["icon_url"] = Config.FooterIcon,
            },
            ["fields"] = {
                {
                    ["name"] = "Player Details: ",
                    ["value"] = playerDetails,
                    ["inline"] = false
                },
                {
                    ["name"] = "Player Identifier:",
                    ["value"] = xPlayer.identifier,
                    ["inline"] = false
                }
            },
        }}, 
        avatar_url = Config.avatar
    }), { 
        ['Content-Type'] = 'application/json' 
    })
end

function GetPlayerDetails(src)
	local player_id = src
	local ids = ExtractIdentifiers(player_id)
    if ids.discord ~= "" then _discordID ="\n**Discord ID:** <@" ..ids.discord:gsub("discord:", "")..">" else _discordID = "\n**Discord ID:** N/A" end
    if ids.steam ~= "" then _steamID ="\n**Steam ID:** " ..ids.steam.."" else _steamID = "\n**Steam ID:** N/A" end
    if ids.steam ~= "" then _steamURL ="\nhttps://steamcommunity.com/profiles/" ..tonumber(ids.steam:gsub("steam:", ""),16).."" else _steamURL = "\n**Steam URL:** N/A" end
    if ids.license ~= "" then _license ="\n**License:** " ..ids.license else _license = "\n**License :** N/A" end
    if ids.ip ~= "" then _ip ="\n**IP:** " ..ids.ip else _ip = "\n**IP :** N/A" end
    _playerID ="\n**Player ID:** " ..player_id..""


	return _playerID ..''.. _discordID..''.._steamID..''.._steamURL..''.._license..''.._ip
end

function ExtractIdentifiers(src)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)

        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        elseif string.find(id, "xbl") then
            identifiers.xbl = id
        elseif string.find(id, "live") then
            identifiers.live = id
        end
    end

    return identifiers
end

NewEvent(true,CommandLog,'7DiscordLog:CommandLog')
NewEvent(true,ItemsLog,'7DiscordLog:ItemsLog')
NewEvent(true,MoneyLog,'7DiscordLog:MoneyLog')
NewEvent(true,WeaponLog,'7DiscordLog:WeaponLog')
NewEvent(true,DrugLog,'7DiscordLog:DrugLog')
NewEvent(true,AmbulanceLog,'7DiscordLog:AmbulanceLog')
NewEvent(true,SocietyLog,'7DiscordLog:SocietyLog')
NewEvent(true,AfterRpDeathLog,'7DiscordLog:AfterRpDeathLog')
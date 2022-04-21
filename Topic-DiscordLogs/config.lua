Config = {}

Config.Locale = 'en'

Config.username = "RP Server"
Config.avatar = "https://via.placeholder.com/30x30"
Config.communtiyName = "RP Server"
Config.communtiyLogo = "https://via.placeholder.com/30x30"
Config.FooterIcon = "https://via.placeholder.com/30x30"

Config.ActionColors = { -- https://www.colorhexa.com/ -> decimal value
	['Add'] = 65280, -- Green (#00ff00)
	['Remove'] = 16711680, -- Red (#ff0000)
	['Set'] = 16747264, -- Orange (#ff8b00)
	['Command'] = 16711680, -- Red (#ff0000)
	['Sell'] = 65484, -- Turquoise (#00ffcc)
	['Harvest'] = 65280, -- Green (#00ff00)
	['Processed'] = 16747264, -- Orange (#ff8b00)
	['Starting'] = 16747264, -- Orange (#ff8b00)
	['Start'] = 65280, -- Green (#00ff00)
	['Stop'] = 16711680, -- Red (#ff0000)
	['Nothing'] = 16777215, -- White (#ffffff)
}

Config.webhooks = {
	commands = "",
	items = "",
	weapon = "",
	money = "",
	drugs = "",
	resource = "",
}

Config.CustomLog = {

	{-- Example
		webhook = "https://discord.com/api/webhooks/961719932846997654/i7iZ4G7HVFLDLE20VBGQ0IwsONIUIqBhBBkny2WlaA2eZdQg-FdqjIEw6EqAIdNgvpZl",
		embedColor = 16777215, -- White (#ffffff)
		serverEventName = "TestLog",
	},
}

-- Example
RegisterCommand("testLog", function(source , args , rawCommand)
    TriggerEvent('7DiscordLog:TestLog', "Test Title",  "Test Description")
end, true) 
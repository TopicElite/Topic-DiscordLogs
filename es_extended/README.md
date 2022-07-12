# Topic-DiscordLogs: es_extended

The following changes must be made in es_extended.

If you are using **ESX 1.2** and you have not changed anything in *"server/commands.lua"*, you can use the file that is included in the download.

Otherwise you have to maintain it on your own.

***TEMPLATE:***
```lua
    TriggerEvent('7DiscordLog:CommandLog', xPlayer, '/COMMAND', 'INFORMATION BEHIND COMMANDS')
```


**Command Log:**
*"setjob":*
```lua
    TriggerEvent('7DiscordLog:CommandLog', xPlayer, '/setjob', args.playerId.getName() .. " " .. args.job .. " " .. args.grade)
```

*"car":*
```lua
    TriggerEvent('7DiscordLog:CommandLog', xPlayer, '/car', args.car)
```

*"cardel, dv":*
```lua
	TriggerEvent('7DiscordLog:CommandLog', xPlayer, '/cardel', "")
```

*"setaccountmoney":*
```lua
	TriggerEvent('7DiscordLog:CommandLog', xPlayer, '/setaccountmoney', args.playerId.getName() .. " " .. args.account .. " " .. args.amount)
```

*"giveaccountmoney":*
```lua
	TriggerEvent('7DiscordLog:CommandLog', xPlayer, '/giveaccountmoney', args.playerId.getName() .. " " .. args.account .. " " .. args.amount)
```

*"giveitem":*
```lua
	TriggerEvent('7DiscordLog:CommandLog', xPlayer, '/giveitem', args.playerId.getName() .. " " .. args.item .. " " .. args.count)
```

*"giveweapon":*
```lua
	TriggerEvent('7DiscordLog:CommandLog', xPlayer, '/giveweapon', args.playerId.getName() .. " " .. args.weapon .. " " .. args.ammo)
```

*"giveweaponcomponent":*
```lua
	TriggerEvent('7DiscordLog:CommandLog', xPlayer, '/giveweaponcomponent', args.playerId.getName() .. " " .. args.weaponName .. " " .. args.componentName)
```

*"setgroup":*
```lua
	TriggerEvent('7DiscordLog:CommandLog', xPlayer, '/setgroup', args.playerId.getName() .. " " .. args.group)
```


If you are using ESX 1.2 and you have not changed anything in *"server/classes/player.lua"*, you can use the file that is included in the download.

Otherwise you have to maintain it on your own.

***TEMPLATE MONEY:***
```lua
    TriggerEvent('7DiscordLog:MoneyLog', xPlayer, 'Add, Remove, Set', ACCOUNT_NAME, money)
```

***TEMPLATE ITEM:***
```lua
    TriggerEvent('7DiscordLog:ItemsLog', xPlayer, 'Add, Remove', 'ITEM_NAME', AMOUNT)
```

***TEMPLATE WEAPON:***
```lua
    TriggerEvent('7DiscordLog:WeaponLog', xPlayer, 'Add, Remove, Set', 'weapon, component, ammo, tint', weaponName, information)
```


**Money Log:**
*"setAccountMoney":*
```lua
    TriggerEvent('7DiscordLog:MoneyLog', self, 'Set', accountName, money)
```

*"addAccountMoney":*
```lua
    TriggerEvent('7DiscordLog:MoneyLog', self, 'Add', accountName, money)
```

*"removeAccountMoney":*
```lua
    TriggerEvent('7DiscordLog:MoneyLog', self, 'Remove', accountName, money)
```

**Item Log:**
*"addInventoryItem":*
```lua
    TriggerEvent('7DiscordLog:ItemsLog', self, 'Add', item.name, count)
```

*"removeInventoryItem":*
```lua
    TriggerEvent('7DiscordLog:ItemsLog', self, 'Remove', item.name, count)
```

**Weapon Log:**
*"addWeapon":*
```lua
    TriggerEvent('7DiscordLog:WeaponLog', self, 'Add', 'weapon', weaponName, ammo)
```

*"addWeaponComponent":*
```lua
    TriggerEvent('7DiscordLog:WeaponLog', self, 'Add', 'component', weaponName, weaponComponent)
```

*"addWeaponAmmo":*
```lua
    TriggerEvent('7DiscordLog:WeaponLog', self, 'Add', 'ammo', weaponName, ammoCount)
```

*"setWeaponTint":*
```lua
    TriggerEvent('7DiscordLog:WeaponLog', self, 'Set', 'tint', weaponName, weaponTintIndex)
```

*"removeWeapon":*
```lua
    TriggerEvent('7DiscordLog:WeaponLog', self, 'Remove', 'weapon', weaponName, 0)
```

*"removeWeaponComponent":*
```lua
    TriggerEvent('7DiscordLog:WeaponLog', self, 'Remove', 'component', weaponName, weaponComponent)
```

*"removeWeaponAmmo":*
```lua
    TriggerEvent('7DiscordLog:WeaponLog', self, 'Remove', 'ammo', weaponName, ammoCount)
```
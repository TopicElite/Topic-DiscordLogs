# Topic-DiscordLogs: esx_drugs

The following changes must be made in es_extended.

If you are using **esx_drugs** and you have not changed anything in *"server/...lua"*, you can use the file that is included in the download.

Otherwise you have to maintain it on your own.

***TEMPLATE:***
```lua
    TriggerEvent('7DiscordLog:DrugLog', xPlayer, 'Harvest, Processed, Sell', 'ITEM_NAME', AMOUNT, PRICE/NULL)
```

**server/chemicals.lua**
*"pickedUpChemicals"*
```lua
	TriggerEvent('7DiscordLog:DrugLog', xPlayer, 'Harvest', 'chemicals', 1, null)
```

*"ChemicalsConvertionMenu"*
```lua
	TriggerEvent('7DiscordLog:DrugLog', xPlayer, 'Processed', xItem.name, amount, null)
```

**server/coke.lua**
*"pickedUpCocaLeaf"*
```lua
	TriggerEvent('7DiscordLog:DrugLog', xPlayer, 'Harvest', 'coca_leaf', 1, null)
```

*"processCocaLeaf"*
```lua
	TriggerEvent('7DiscordLog:DrugLog', xPlayer, 'Processed', 'coke', 1, null)
```

**server/heroin.lua**
*"pickedUpPoppy"*
```lua
	TriggerEvent('7DiscordLog:DrugLog', xPlayer, 'Harvest', 'poppyresin', 1, null)
```

*"processPoppyResin"*
```lua
	TriggerEvent('7DiscordLog:DrugLog', xPlayer, 'Processed', 'heroin', 1, null)
```

**server/lsd.lua**
*"processLSD"*
```lua
	TriggerEvent('7DiscordLog:DrugLog', xPlayer, 'Processed', 'lsd', 1, null)
```

*"processThionylChloride"*
```lua
	TriggerEvent('7DiscordLog:DrugLog', xPlayer, 'Processed', 'thionyl_chloride', 1, null)
```

**server/main.lua**
*"sellDrug"*
```lua
	TriggerEvent('7DiscordLog:DrugLog', xPlayer, 'Sell', itemName, amount, price)
```

**server/meth.lua**
*"pickedUpHydrochloricAcid"*
```lua
	TriggerEvent('7DiscordLog:DrugLog', xPlayer, 'Harvest', 'hydrochloric_acid', 1, null)
```

*"pickedUpSodiumHydroxide"*
```lua
	TriggerEvent('7DiscordLog:DrugLog', xPlayer, 'Harvest', 'sodium_hydroxide', 1, null)
```

*"pickedUpSulfuricAcid"*
```lua
	TriggerEvent('7DiscordLog:DrugLog', xPlayer, 'Harvest', 'sulfuric_acid', 1, null)
```

*"processMeth"*
```lua
	TriggerEvent('7DiscordLog:DrugLog', xPlayer, 'Processed', 'meth', 1, null)
```

**server/moneywash.lua**
*"Wash"*
```lua
	TriggerEvent('7DiscordLog:DrugLog', xPlayer, 'Processed', 'black_money', ammount, null)
```

**server/weed.lua**
*"pickedUpCannabis"*
```lua
	TriggerEvent('7DiscordLog:DrugLog', xPlayer, 'Harvest', 'cannabis', 1, null)
```

*"processCannabis"*
```lua
	TriggerEvent('7DiscordLog:DrugLog', xPlayer, 'Processed', 'marijuana', 1, null)
```
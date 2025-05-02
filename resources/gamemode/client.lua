Events.Subscribe("scriptInit", function()
    Events.CallRemote("updateActivePlayers", {true})
    Events.CallRemote("checkServerStatus", {})
end)

Events.Subscribe("playerDisconnect", function(id, name, reason)
    Events.CallRemote("updateActivePlayers", {false})
end)

Events.Subscribe("clientPrintTimeout", function (timeLeft)
    Game.ClearPrints()
    Game.PrintStringWithLiteralStringNow("STRING", timeLeft, 999, 1)
end, true)
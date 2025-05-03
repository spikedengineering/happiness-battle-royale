Events.Subscribe("scriptInit", function()
    Events.CallRemote("updateActivePlayers", {true})
    Events.CallRemote("checkServerStatus", {})
end)

Events.Subscribe("playerDisconnect", function(id, name, reason)
    Events.CallRemote("updateActivePlayers", {false})
end)

Events.Subscribe("clientPrintTimeout", function (timeLeft)
    Game.ClearPrints()
    Game.PrintStringWithLiteralStringNow("STRING", timeLeft, 1100, 1)
end, true)

Events.Subscribe("clientStartMatch", function ()
    -- Generate random coordinates between two points
    local x = math.random() * (-446.05900 - -727.34000) + -727.34000
    local y = math.random() * (-675.44100 - -1073.68000) + -1073.68000
    local z = 200  -- Z coordinate is constant

    local clientId = Game.GetPlayerId()
    local serverId = Player.GetServerID(clientId)
    local playerChar = Game.GetPlayerChar(clientId)

    Game.SetCharCoordinatesNoOffset(playerChar, x, y, z) -- teleport player to happy island

    --Game.TaskFallAndGetUp(playerChar, 3, 100)
end, true)
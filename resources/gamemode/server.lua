serverData = {
    serverStatus = 0,   -- 0 ==> waiting , 1 ==> running
    serverPause = 5,
    maxPlayers = 32,
    activePlayers = 0
}

Events.Subscribe("updateActivePlayers", function (bool)
    if bool == true then
        serverData.activePlayers = serverData.activePlayers + 1
        if serverData.serverStatus == 0 and serverData.activePlayers == 1 then -- MADE FOR TESTING
            Events.Call("timeoutCountdown", {})
        end
    else
        serverData.activePlayers = serverData.activePlayers - 1
    end
end, true)

Events.Subscribe("checkServerStatus", function ()
    if serverData.serverStatus == 0 then
        Events.CallRemote("spawnInLobby", Events.GetSource(), {})
    end
end, true)

Events.Subscribe("timeoutCountdown", function ()
    local counter = serverData.serverPause

    Thread.Create(function () -- counting
        while true do
            if counter > 1 then
                Events.Call("serverPrintTimeout", {counter, "TIMEOUT: " .. counter .. " seconds left until the match begins."})
            elseif counter == 1 then
                Events.Call("serverPrintTimeout", {counter, "TIMEOUT: " .. counter .. " second left until the match begins."})
            elseif counter == 0 then
                Events.Call("serverPrintTimeout", {counter, "MATCH STARTED - " .. serverData.activePlayers .. " PLAYERS"})

                serverData.serverStatus = 1
                Events.Call("serverStartMatch", {})
                return
            end
            
            counter = counter - 1
            Thread.Pause(1000) -- refresh every second
        end
    end)
end, true)

Events.Subscribe("serverPrintTimeout", function (timeLeft, printText)
    if timeLeft <= 5 then
        Console.Log(printText)
    end

    for i = 1, serverData.maxPlayers, 1 do
        if Player.IsConnected(i) == true then -- Prevent triggering event for players who are disconnecting from the server
            Events.CallRemote("clientPrintTimeout", i, {printText})
        end
    end
end)

Events.Subscribe("serverStartMatch", function ()
    for i = 1, serverData.maxPlayers, 1 do
        if Player.IsConnected(i) == true then
            Events.CallRemote("clientStartMatch", i, {})
        end
    end
end)

Events.Subscribe("matchCountdown", function ()
    
end)
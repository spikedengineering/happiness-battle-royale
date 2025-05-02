local SPAWN_MODEL <const> = "M_Y_MULTIPLAYER"
local SPAWN_COORDS <const> = { 96.64000, 851.77200, 45.05100, 122.23 }

-- From original R* scripts.
local function freezePlayer(id, freeze)
	local playerIndex = Game.ConvertIntToPlayerindex(id)
	Game.SetPlayerControlForNetwork(playerIndex, not freeze, false)

	local playerChar = Game.GetPlayerChar(playerIndex)
	Game.SetCharVisible(playerChar, not freeze)

	if not freeze then
		if not Game.IsCharInAnyCar(playerChar) then
			Game.SetCharCollision(playerChar, true)
		end

		Game.FreezeCharPosition(playerChar, false)
		Game.SetCharNeverTargetted(playerChar, false)
		Game.SetPlayerInvincible(playerIndex, false)
	else
		Game.SetCharCollision(playerChar, false)
		Game.FreezeCharPosition(playerChar, true)
		Game.SetCharNeverTargetted(playerChar, true)
		Game.SetPlayerInvincible(playerIndex, true)
		Game.RemovePtfxFromPed(playerChar)

		if not Game.IsCharFatallyInjured(playerChar) then
			Game.ClearCharTasksImmediately(playerChar)
		end
	end
end

local spawnLock = false

local function spawnPlayer()
	-- Check if spawnLock is active, if so, exit the function.
	if spawnLock then
        return
    end

	-- Set spawnLock to true to prevent re-entry while spawning.
    spawnLock = true

	-- If the screen is not already faded out, initiate a fade out.
	if not Game.IsScreenFadedOut() then
		Game.DoScreenFadeOut(500)

		-- Wait for the screen to finish fading out.
		while Game.IsScreenFadingOut() do
			Thread.Pause(0)
		end
	end

	-- Get the hash key for the spawn model.
	local spawnModel = Game.GetHashKey(SPAWN_MODEL)

	-- Check if the model is valid.
	if not Game.IsModelInCdimage(spawnModel) then
		Console.Log("spawnPlayer: invalid spawn model")
		return
	end

	-- Get the player id and char.
	local playerId = Game.GetPlayerId()
	local playerChar = Game.GetPlayerChar(playerId)

	-- Freeze player like in original R* scripts.
	freezePlayer(playerId, true)

	-- If the player char does not have the spawn model, load it.
	if not Game.IsCharModel(playerChar, spawnModel) then
		Game.RequestModel(spawnModel)
		Game.LoadAllObjectsNow()

		while not Game.HasModelLoaded(spawnModel) do
			Game.RequestModel(spawnModel)

			Thread.Pause(0)
		end

		Game.ChangePlayerModel(playerId, spawnModel)
		Game.MarkModelAsNoLongerNeeded(spawnModel)

		playerChar = Game.GetPlayerChar(playerId)
	end

	-- PASSENGER SYSTEM
	Game.SetPlayerTeam(Game.GetPlayerId(), 0)

	-- Request collision at spawn coordinates.
	Game.RequestCollisionAtPosn(SPAWN_COORDS[1], SPAWN_COORDS[2], SPAWN_COORDS[3])

	-- Resurrect the network player at spawn coordinates.
	Game.ResurrectNetworkPlayer(playerId, SPAWN_COORDS[1], SPAWN_COORDS[2], SPAWN_COORDS[3], SPAWN_COORDS[4])

	-- Clear character tasks immediately.
	Game.ClearCharTasksImmediately(playerChar)

	-- Reset player health.
	Game.SetCharHealth(playerChar, 300)

	-- Remove all weapons from the player character.
	Game.RemoveAllCharWeapons(playerChar)

	-- Clear the player's wanted level.
	Game.ClearWantedLevel(playerId)

	-- Restore the camera's jumpcut.
	Game.CamRestoreJumpcut()

	-- Disable loading screen.
	Game.ForceLoadingScreen(false)

	-- Fade the screen back in.
	Game.DoScreenFadeIn(500)

	-- Unfreeze the player.
	freezePlayer(playerId, false)

	-- Trigger the "playerSpawn" event.
	Events.Call("playerSpawn", {})

	-- Reset spawnLock.
	spawnLock = false
end

Events.Subscribe("scriptInit", function()
	-- Respawn at death.
	Thread.Create(function()
		while true do
			local playerId = Game.GetPlayerId()

			if Game.IsNetworkPlayerActive(playerId) then
                if Game.HowLongHasNetworkPlayerBeenDeadFor(playerId) > 2000 then
                    spawnPlayer()
                end
            end

			Thread.Pause(0)
		end
	end)
end)

Events.Subscribe("spawnInLobby", function ()
	Text.SetLoadingText("SPAWNING")
	Thread.Create(spawnPlayer)
end, true)
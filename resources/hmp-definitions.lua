---@meta

---@class exports
exports = {}

---@class Chat
Chat = {

---@param message string
---Client - Adds a message to the chat.
AddMessage = function(message) end,

---Client - Clears all messages.
Clear = function() end,

---@return boolean inputActive
---Client - Returns whether the chat input is open.
IsInputActive = function() end,

---@param serverID integer
---@param message string
---Server - Sends a message to the specified player.
SendMessage = function(serverID, message) end,

---@param message string
---Server - Sends a message to all players.
BroadcastMessage = function(message) end,

}

---@class Console
Console = {

---@param message string
---Shared - Prints a message to the console and the log file.
Log = function(message) end,

}

---@class Database
Database = {

---@param type integer
---@param url string
---Server - Connects to the database server.
Connect = function(type, url) end,

---Server - Closes the database connection.
Close = function() end,

---@param statement string
---@param params table
---@return integer affectedRows
---Server - This function executes a SQL statement using the provided arguments. It returns the number of rows affected by the execution.
Execute = function(statement, params) end,

---@param statement string
---@param params table
---@param callback? function
---Server - This function executes a SQL statement using the provided arguments. It returns the number of rows affected by the execution.
ExecuteAsync = function(statement, params, callback) end,

---@param statement string
---@param params table
---@return table result
---Server - This function executes a SQL statement with the given arguments. It returns the resulting data as a table.
Select = function(statement, params) end,

---@param statement string
---@param params table
---@param callback? function
---Server - This function executes a SQL statement with the given arguments. It returns the resulting data as a table.
SelectAsync = function(statement, params, callback) end,

---@param statement string
---@param params table
---@return integer insertId
---Server - This function inserts data into a table using the provided SQL statement and arguments. It returns the ID of the newly inserted row.
Insert = function(statement, params) end,

---@param statement string
---@param params table
---@param callback? function
---Server - This function inserts data into a table using the provided SQL statement and arguments. It returns the ID of the newly inserted row.
InsertAsync = function(statement, params, callback) end,

}

---@class Events
Events = {

---@param name string
---@param callbackFunc function
---@param isRemoteAllowed? boolean
---Shared - Subscribe to an event with a callback function.
Subscribe = function(name, callbackFunc, isRemoteAllowed) end,

---@param name string
---@param arguments table
---@return boolean success
---Shared - Calls an event which will immediately trigger all local subscribers.
Call = function(name, arguments) end,

---@param name string
---@param arguments table
---@overload fun(name: string, serverID: integer, arguments: table)
---Shared - Calls an event which will trigger all subscribers on remote side.
CallRemote = function(name, arguments) end,

---Shared - Cancel the current executed event.
Cancel = function() end,

---@return boolean canceled
---Shared - Checks if last completed event was canceled.
WasLastCanceled = function() end,

---@param name string
---@param arguments table
---Server - Calls an event which will trigger all subscribers on client side for all players.
BroadcastRemote = function(name, arguments) end,

---@return integer serverID
---Server - Gets the server ID of the player from which the last event was triggered.
GetSource = function() end,

}

---@class HTTP
HTTP = {

---@param host string
---@param method string
---@param data string
---@param contentType string
---@param headers table
---@return integer status
---@return string data
---Server - Makes a synchronous http request.
Request = function(host, method, data, contentType, headers) end,

---@param host string
---@param method string
---@param data string
---@param contentType string
---@param headers table
---@param callback function
---Server - Makes an asynchronous http request.
RequestAsync = function(host, method, data, contentType, headers, callback) end,

}

---@class Player
Player = {

---@param playerID integer
---@return integer serverID
---Client - Get serverID from any playerID.
GetServerID = function(playerID) end,

---@param serverID integer
---@return integer playerID
---Client - Get playerID from any serverID.
GetIDFromServerID = function(serverID) end,

---@return integer rockstarID
---Client - Get rockstarID of local player.
GetRockstarID = function() end,

---@param serverID integer
---@return boolean connected
---Server - Returns if player is connected.
IsConnected = function(serverID) end,

---@param serverID integer
---@param name string
---Server - Sets name of a player.
SetName = function(serverID, name) end,

---@param serverID integer
---@return string name
---Server - Gets name of a player.
GetName = function(serverID) end,

---@param serverID integer
---@return integer ping
---Server - Gets ping of a player.
GetPing = function(serverID) end,

---@param serverID integer
---@param reason? string
---Server - Kicks a specified player.
Kick = function(serverID, reason) end,

---@param serverID integer
---@param sessionID integer
---Server - Sets session of a player.
SetSession = function(serverID, sessionID) end,

---@param serverID integer
---@return integer sessionID
---Server - Gets session of a player.
GetSession = function(serverID) end,

---@param serverID integer
---@return boolean active
---Server - Returns whether a player is active in their session.
IsSessionActive = function(serverID) end,

}

---@class Resource
Resource = {

---@param resource string
---@return string state
---Shared - Returns the state of the specified resource.
GetState = function(resource) end,

---@param resource string
---@param funcName string
---@param arguments table
---Shared - Calls an exported function in the specified resource.
Call = function(resource, funcName, arguments) end,

}

---@class Session
Session = {

---@param sessionID integer
---@return integer size
---Server - Gets the number of players in a session.
GetSize = function(sessionID) end,

---@param sessionID integer
---@return integer serverID
---Server - Gets the serverID of a session host.
GetHostID = function(sessionID) end,

---@param sessionID integer
---@return table activePlayers
---Server - Gets the active players of a session.
GetActivePlayers = function(sessionID) end,

}

---@class Text
Text = {

---@param key string
---@param label string
---Client - Add GXT entry.
AddEntry = function(key, label) end,

---@param key integer
---@param label string
---Client - Add GXT entry by hash.
AddEntryByHash = function(key, label) end,

---@param text string
---Client - Set loading screen text.
SetLoadingText = function(text) end,

}

---@class Thread
Thread = {

---@param threadFunc function
---Shared - Creates a new thread with a function that is executed asynchronously.
Create = function(threadFunc) end,

---@param milliseconds integer
---Shared - Pauses the current thread for the specified duration.
Pause = function(milliseconds) end,

}

---@class WebUI
WebUI = {

---@param url string
---@param width integer
---@param height integer
---@param transparent? boolean
---@return integer webuiID
---Client - Creates a WebUI.
Create = function(url, width, height, transparent) end,

---@param webuiID integer
---Client - Destroys a WebUI.
Destroy = function(webuiID) end,

---@param webuiID integer
---@param name string
---@param arguments table
---Client - Calls an event on the WebUIs javascript.
CallEvent = function(webuiID, name, arguments) end,

---@param webuiID integer
---@param keepGameInput? boolean
---Client - Sets focus on a WebUI (mouse & keyboard input).
SetFocus = function(webuiID, keepGameInput) end,

---@param webuiID integer
---@param left integer
---@param top integer
---@param right integer
---@param bottom integer
---Client - Changes the size of the WebUI sprite.
SetRect = function(webuiID, left, top, right, bottom) end,

}

---@class Game
Game = {

---@param abort boolean
---@return integer
AbortScriptedConversation = function(abort) end,

---@param speakerNumber integer
---@param context string
---@param subtitle string
---@param listenerNumber integer
---@param volumeType integer
---@return integer context
---@return integer subtitle
AddLineToConversation = function(speakerNumber, context, subtitle, listenerNumber, volumeType) end,

---@param speakerNumber integer
---@param context string
---@param subtitle string
---@return integer context
---@return integer subtitle
---This command should be called for each line of speech in the conversation.
AddLineToMobilePhoneCall = function(speakerNumber, context, subtitle) end,

---@param conversation integer
---@param arg2 integer
---@param arg3 integer
AddLineToScriptedConversation = function(conversation, arg2, arg3) end,

---@param speakerConversationIndex integer
---@param speakerCharIndex integer
---@param voiceName string
---@return integer voiceName
AddNewConversationSpeaker = function(speakerConversationIndex, speakerCharIndex, voiceName) end,

---@param arg1 integer
---@param arg2 integer
AddNewFrontendConversationSpeaker = function(arg1, arg2) end,

---Unloads a ambient audio bank.
AmbientAudioBankNoLongerNeeded = function() end,

---@param veh integer
---@return boolean
CanBeDescribedAsACar = function(veh) end,

---@param ped integer
CancelCurrentlyPlayingAmbientSpeech = function(ped) end,

---@param id integer
---@param ped integer
CloseMicPed = function(id, ped) end,

DisableEndCreditsFade = function() end,

DisableFrontendRadio = function() end,

---@param disable boolean
DisableGps = function(disable) end,

DisablePoliceScanner = function() end,

---@param flag0 boolean
---@param flag1 boolean
DontAbortCarConversations = function(flag0, flag1) end,

---@param enable boolean
EnableChaseAudio = function(enable) end,

---Sets the end of credits fade.
EnableEndCreditsFade = function() end,

---Allows radio to be played in the frontend.
EnableFrontendRadio = function() end,

---@param veh integer
---@param enable boolean
EnableGpsInVehicle = function(veh, enable) end,

EnablePoliceScanner = function() end,

---@return boolean
EnableScriptControlledMicrophone = function() end,

---@param StaticEmitterName string
---@return integer
---@return integer StaticEmitterName
FindStaticEmitterIndex = function(StaticEmitterName) end,

---@param fix boolean
FixAmbienceOrientation = function(fix) end,

FixScriptMicToCurrentPosisition = function() end,

---@param ped integer
ForceFullVoice = function(ped) end,

---@param radioStationName string
---@return integer radioStationName
ForceInitialPlayerStation = function(radioStationName) end,

---@param radioStationName string
---@param trackListName string
---@param category integer
---@param index integer
---@return integer radioStationName
---@return integer trackListName
ForceRadioTrack = function(radioStationName, trackListName, category, index) end,

---@param radioStationName string
---@return integer radioStationName
FreezeRadioStation = function(radioStationName) end,

---@return integer
GetAudibleMusicTrackTextId = function() end,

---@return integer
GetAudioRoomId = function() end,

---@return integer
GetCurrentScriptedConversationLine = function() end,

---@return integer
GetCutsceneAudioTimeMs = function() end,

---@return boolean
GetPlayerHasTracks = function() end,

---@return integer
GetPlayerRadioMode = function() end,

---@return integer
---Gets the index of the current players radio station.
GetPlayerRadioStationIndex = function() end,

---@return string
---Gets the name the players radio station.
GetPlayerRadioStationName = function() end,

---@return string
GetPlayerRadioStationNameRoll = function() end,

---@param id integer
---@return string
GetRadioName = function(id) end,

---@return integer
---Returns an new id for a sound.
GetSoundId = function() end,

---@return string
---Returns a zone name for the emergency service call.
GetSpeechForEmergencyServiceCall = function() end,

---@param StaticEmitterIndex integer
---@return integer
GetStaticEmitterPlaytime = function(StaticEmitterIndex) end,

---@return integer arg1
---@return integer arg2
---@return integer arg3
GetStreamBeatInfo = function() end,

---@return integer
GetStreamPlaytime = function() end,

---@param ped integer
---@param AudioAnimEventName string
---@return integer AudioAnimEventName
HandleAudioAnimEvent = function(ped, AudioAnimEventName) end,

---@param soundId integer
---@return boolean
---Checks that a sound has finished playing.
HasSoundFinished = function(soundId) end,

---@param heli integer
---@param skip boolean
HeliAudioShouldSkipStartup = function(heli, skip) end,

---@param ped integer
HighFallScream = function(ped) end,

---@param charIndex integer
---@return boolean
---Checks if ambient speech for char has been disabled.
IsAmbientSpeechDisabled = function(charIndex) end,

---@param charIndex integer
---@return boolean
---Checks if ambient speech is currently playing.
IsAmbientSpeechPlaying = function(charIndex) end,

---@param charIndex integer
---@return boolean
---Checks if any type of speech is playing.
IsAnySpeechPlaying = function(charIndex) end,

---@return boolean
IsGameInControlOfMusic = function() end,

---@return boolean
IsLazlowStationLocked = function() end,

---@return boolean
---Checks if the mission complete audio is playing.
IsMissionCompletePlaying = function() end,

---@return boolean
---Checks if a mobile phone call is currently happening.
IsMobilePhoneCallOngoing = function() end,

---@return boolean
---Checks if the moblie phone radio is active.
IsMobilePhoneRadioActive = function() end,

---@param ped integer
---@return boolean
IsPainPlaying = function(ped) end,

---@return boolean
IsRadioHudOn = function() end,

---@return boolean
---Checks if the radio is tuning to a station.
IsRadioRetuning = function() end,

---@return boolean
IsScriptedConversationOngoing = function() end,

---@param charIndex integer
---@return boolean
---Checks if scripted speech is currently playing.
IsScriptedSpeechPlaying = function(charIndex) end,

LockLazlowStation = function() end,

---Unloads a mission audio bank.
MissionAudioBankNoLongerNeeded = function() end,

---@param mute boolean
MuteGameworldAndPositionedRadioForTv = function(mute) end,

---@param mute boolean
---Mutes the game world audio.
MuteGameworldAudio = function(mute) end,

---@param mute boolean
MutePositionedRadio = function(mute) end,

---@param StaticEmitterIndex integer
---@param mute boolean
MuteStaticEmitter = function(StaticEmitterIndex, mute) end,

---Sets up the script for a new call.
NewMobilePhoneCall = function() end,

NewScriptedConversation = function() end,

---@param ped integer
OnFireScream = function(ped) end,

---@param ped integer
PanicScream = function(ped) end,

---@param finishCurrentLine boolean
PauseScriptedConversation = function(finishCurrentLine) end,

---@param eventName string
---@return integer eventName
---Plays back a specified sound.
PlayAudioEvent = function(eventName) end,

---@param eventName string
---@param objectIndex integer
---@return integer eventName
---Plays back a specified sound from an object.
PlayAudioEventFromObject = function(eventName, objectIndex) end,

---@param eventName string
---@param charIndex integer
---@return integer eventName
---Plays back a specified sound from an ped.
PlayAudioEventFromPed = function(eventName, charIndex) end,

---@param eventName string
---@param carIndex integer
---@return integer eventName
---Plays back a specified sound from an vehicle.
PlayAudioEventFromVehicle = function(eventName, carIndex) end,

---@param soundId integer
---@param x number
---@param y number
---@param z number
---If the sound is a one-shot (non-looping) then a soundId of -1 is usually used.
PlayFireSoundFromPosition = function(soundId, x, y, z) end,

---@param play boolean
PlayScriptedConversationFrontend = function(play) end,

---@param soundId integer
---@param soundName string
---@return integer soundName
---Plays back a sound with the name soundName.
PlaySound = function(soundId, soundName) end,

---@param soundId integer
---@param soundName string
---@param objectIndex integer
---@return integer soundName
---Plays back a sound from an object's location.
PlaySoundFromObject = function(soundId, soundName, objectIndex) end,

---@param soundId integer
---@param soundName string
---@param charIndex integer
---@return integer soundName
---Plays back a sound from an ped's location.
PlaySoundFromPed = function(soundId, soundName, charIndex) end,

---@param soundId integer
---@param soundName string
---@param x number
---@param y number
---@param z number
---@return integer soundName
---Plays back a sound from an absolute position.
PlaySoundFromPosition = function(soundId, soundName, x, y, z) end,

---@param soundId integer
---@param soundName string
---@param carIndex integer
---@return integer soundName
---Plays back a sound from an vehicle's location.
PlaySoundFromVehicle = function(soundId, soundName, carIndex) end,

---@param soundId integer
---@param soundName string
---@return integer soundName
---Plays back a sound "frontend" - at full volume, panned centrally.
PlaySoundFrontend = function(soundId, soundName) end,

---@param objectIndex integer
---Plays a preloaded stream back from a specified object.
PlayStreamFromObject = function(objectIndex) end,

---@param charIndex integer
---Plays a preloaded stream back from a specified ped.
PlayStreamFromPed = function(charIndex) end,

PlayStreamFrontend = function() end,

---@param streamName string
---@return boolean
---@return integer streamName
PreloadStream = function(streamName) end,

---@param StreamName string
---@param startOffset integer
---@return boolean
---@return integer StreamName
PreloadStreamWithStartOffset = function(StreamName, startOffset) end,

---@param ringtoneId integer
---Plays a preview of a ringtone.
PreviewRingtone = function(ringtoneId) end,

---@param inChargeOfAudio boolean
---Registers a script with audio; a neccesary step for loading sound banks and using script sound commands.
RegisterScriptWithAudio = function(inChargeOfAudio) end,

ReleaseScriptControlledMicrophone = function() end,

---@param soundId integer
---Releases a sound ID.
ReleaseSoundId = function(soundId) end,

---@param ped integer
RemoveCloseMicPed = function(ped) end,

RemoveScriptMic = function() end,

---@param x number
---@param y number
---@param z number
---@param name string
---@return integer name
ReportCrime = function(x, y, z, name) end,

---@param id integer
---@param x number
---@param y number
---@param z number
ReportDispatch = function(id, x, y, z) end,

---@param veh integer
ReportPoliceSpottingSuspect = function(veh) end,

ReportSuspectArrested = function() end,

ReportSuspectDown = function() end,

---@param trackId integer
ReportTaggedRadioTrack = function(trackId) end,

---@param bankName string
---@return boolean
---@return integer bankName
---Requests and checks that a ambient audio bank has loaded.
RequestAmbientAudioBank = function(bankName) end,

---@param bankName string
---@return boolean
---@return integer bankName
---Requests and checks that a mission audio bank has loaded.
RequestMissionAudioBank = function(bankName) end,

---Call this to restart a conversation that you have previously paused with PAUSE_SCRIPTED_CONVERSATION.
RestartScriptedConversation = function() end,

RetuneRadioDown = function() end,

---@param radioStationIndex integer
---Retunes the radio station to the specified index.
RetuneRadioToStationIndex = function(radioStationIndex) end,

---@param name string
---@return integer name
RetuneRadioToStationName = function(name) end,

RetuneRadioUp = function() end,

---@param charIndex integer
---@param context string
---@param forcePlay boolean
---@param allowRepeat boolean
---@param volume integer
---@return integer context
---Plays a line of a char's ambient dialogue.
SayAmbientSpeech = function(charIndex, context, forcePlay, allowRepeat, volume) end,

---@param charIndex integer
---@param context string
---@param voiceName string
---@param forcePlay boolean
---@param allowRepeat boolean
---@param volume integer
---@return integer context
---@return integer voiceName
---Plays a line of ambient dialogue in a different char's voice.
SayAmbientSpeechWithVoice = function(charIndex, context, voiceName, forcePlay, allowRepeat, volume) end,

---@param charIndex integer
---@param voiceName string
---@return integer voiceName
---Sets a character to use a specific voice different to the one associated with their model.
SetAmbientVoiceName = function(charIndex, voiceName) end,

---@param mood integer
SetBriansMood = function(mood) end,

---@param veh integer
---@param VoiceId integer
SetGpsVoiceForVehicle = function(veh, VoiceId) end,

---@param overrideMute boolean
SetLobbyMuteOverride = function(overrideMute) end,

---@param name string
---@return integer name
SetLocalPlayerPainVoice = function(name) end,

---@param name string
---@return integer name
SetLocalPlayerVoice = function(name) end,

---@param carIndex integer
---@param loud boolean
SetLoudVehicleRadio = function(carIndex, loud) end,

---@param modelHash integer
---@param soundName string
---@return integer soundName
SetMissionPickupSound = function(modelHash, soundName) end,

---@param isActive boolean
---Sets if the phone radio is active.
SetMobilePhoneRadioState = function(isActive) end,

---@param enabled boolean
SetMobileRadioEnabledDuringGameplay = function(enabled) end,

---@param type integer
---Sets the mobile ring type.
SetMobileRingType = function(type) end,

---@param charIndex integer
---@param isBlindRaging boolean
---Sets the ped to sound angry.
SetPedIsBlindRaging = function(charIndex, isBlindRaging) end,

---@param charIndex integer
---@param isDrunk boolean
---Sets the ped so they sound drunk.
SetPedIsDrunk = function(charIndex, isDrunk) end,

---@param ped integer
---@param RingtoneId integer
SetPedMobileRingType = function(ped, RingtoneId) end,

---@param name string
---@return integer name
SetPlayerPainRootBankName = function(name) end,

---@param mood integer
SetRomansMood = function(mood) end,

---@param x number
---@param y number
---@param z number
SetScriptMicLookAt = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
SetScriptMicPosition = function(x, y, z) end,

---@param carIndex integer
---@param sirenFlag boolean
---Plays the siren audio without a driver in a car.
SetSirenWithNoDriver = function(carIndex, sirenFlag) end,

---@param rolloff number
---@param UnkTime integer
SetStreamParams = function(rolloff, UnkTime) end,

---@param enabled boolean
---Sets the radio in the garage on or off.
SetTaxiGarageRadioState = function(enabled) end,

---@param trainIndex integer
---@param rolloff number
SetTrainAudioRolloff = function(trainIndex, rolloff) end,

---@param soundId integer
---@param varName string
---@param varValue number
---@return integer varName
---Sets a variable on a sound.
SetVariableOnSound = function(soundId, varName, varValue) end,

---@param charIndex integer
---@param charComponent integer
---@param male boolean
SetVoiceIdFromHeadComponent = function(charIndex, charComponent, male) end,

SkipRadioForward = function() end,

SkipToNextScriptedConversationLine = function() end,

---@param ringtoneId integer
---Starts the player's mobile phone ringing using a custom ringtone specified by ringtoneId.
StartCustomMobilePhoneRinging = function(ringtoneId) end,

StartEndCreditsMusic = function() end,

---@param firstCharIndex integer
---@param firstVoiceName string
---@param secondCharIndex integer
---@param secondVoiceName string
---@param displaySubtitles boolean
---@param addToBriefing boolean
---@return integer firstVoiceName
---@return integer secondVoiceName
---Starts the actual mobile phone dialogue playing.
StartMobilePhoneCall = function(firstCharIndex, firstVoiceName, secondCharIndex, secondVoiceName, displaySubtitles, addToBriefing) end,

StartMobilePhoneCalling = function() end,

StartMobilePhoneRinging = function() end,

---@param ped integer
---@param unk integer
StartPedMobileRinging = function(ped, unk) end,

---@param displaySubtitles boolean
---@param addToBriefing boolean
StartScriptConversation = function(displaySubtitles, addToBriefing) end,

StopEndCreditsMusic = function() end,

---Stops a mobile phone ringing.
StopMobilePhoneRinging = function() end,

---@param ped integer
StopPedMobileRinging = function(ped) end,

---@param charIndex integer
---@param enable boolean
---Stops a ped from saying any of their ambient dialogue.
StopPedSpeaking = function(charIndex, enable) end,

---Stops the preview playing.
StopPreviewRingtone = function() end,

---@param soundId integer
---Stops a playing sound by its sound id.
StopSound = function(soundId) end,

---Stops a stream that is being played by the script.
StopStream = function() end,

TriggerLoadingMusicOnNextFade = function() end,

---@param missionCompleteId integer
TriggerMissionCompleteAudio = function(missionCompleteId) end,

---@param reportName string
---@return integer reportName
---Plays a police report.
TriggerPoliceReport = function(reportName) end,

---@param crime integer
---@param x number
---@param y number
---@param z number
TriggerVigilanteCrime = function(crime, x, y, z) end,

---@param radioStationName string
---@return integer radioStationName
UnfreezeRadioStation = function(radioStationName) end,

---@param StoryId integer
UnlockGenericNewsStory = function(StoryId) end,

---Unlock the lazlow radio station.
UnlockLazlowStation = function() end,

---@param newsStoryId integer
---Sets a news story to be played a specific time.
UnlockMissionNewsStory = function(newsStoryId) end,

UnpauseRadio = function() end,

---Unregisters a script with audio.
UnregisterScriptWithAudio = function() end,

---@return boolean
GetIsDepositAnimRunning = function() end,

---@param carIndex integer
---@return boolean
GetPlayerToPlaceBombInCar = function(carIndex) end,

---@return boolean
GetTaskPlaceCarBombUnsuccessful = function() end,

---@return boolean
IsPlaceCarBombActive = function() end,

---@param scriptName string
---@param modelHashKey integer
---@param percentageChance integer
---@param activationRange number
---@param objectGroupingId integer
---@return integer scriptName
---Associates a script brain with a certain object model.
AllocateScriptToObject = function(scriptName, modelHashKey, percentageChance, activationRange, objectGroupingId) end,

---@param scriptName string
---@param modelHashKey integer
---@param percentageChance integer
---@param scenarioPedsOnly boolean
---@return integer scriptName
---Associates a script brain with a certain ped model.
AllocateScriptToRandomPed = function(scriptName, modelHashKey, percentageChance, scenarioPedsOnly) end,

---@param objectIndex integer
---@return boolean
---Checks that script brain is with a specific range of the player.
IsObjectWithinBrainActivationRange = function(objectIndex) end,

---@return boolean
---Checks if the world point is out of activation range of the player called within the brain script.
IsWorldPointWithinBrainActivationRange = function() end,

---@param scriptName string
---@param activationRange number
---@return integer scriptName
---Registers a point in a world script point.
RegisterWorldPointScriptBrain = function(scriptName, activationRange) end,

---@param brain integer
---@param switchstate boolean
SwitchObjectBrains = function(brain, switchstate) end,

---@param arg1 boolean
---@param arg2 boolean
ActivateScriptedCams = function(arg1, arg2) end,

---@param viewportid integer
---@param activate boolean
ActivateViewport = function(viewportid, activate) end,

---@param cam integer
---@param camnode integer
AddCamSplineNode = function(cam, camnode) end,

---@param arg1 integer
---@param ped integer
AddPedToCinematographyAi = function(arg1, ped) end,

---@return boolean
---Are the widescreen borders still visible on the screen. Set via SET_WIDESCREEN_BORDERS.
AreWidescreenBordersActive = function() end,

---@param camId integer
---@param objectId integer
---Attaches a camera to an object.
AttachCamToObject = function(camId, objectId) end,

---@param camId integer
---@param charId integer
---Attaches a camera to an char.
AttachCamToPed = function(camId, charId) end,

---@param camId integer
---@param carId integer
---Attaches a camera to an car.
AttachCamToVehicle = function(camId, carId) end,

---@param camId integer
---@param viewportId integer
---Attaches a camera to an viewport.
AttachCamToViewport = function(camId, viewportId) end,

---@return integer arg1
BeginCamCommands = function() end,

---@param camera integer
---@param pX number
---@param pY number
---@param pZ number
---@param radius number
---@return boolean
CamIsSphereVisible = function(camera, pX, pY, pZ, radius) end,

---@param cam integer
CamProcess = function(cam) end,

CamRestore = function() end,

CamRestoreJumpcut = function() end,

CamSequenceClose = function() end,

---@param arg1 integer
---@return integer progress
CamSequenceGetProgress = function(arg1) end,

---@param arg1 integer
CamSequenceOpen = function(arg1) end,

---@param arg1 integer
CamSequenceRemove = function(arg1) end,

---@param arg1 integer
CamSequenceStart = function(arg1) end,

---@param arg1 integer
CamSequenceStop = function(arg1) end,

---@param cam integer
---@param time integer
CamSequenceWait = function(cam, time) end,

---@param veh integer
---@param set boolean
CamSetCinematic = function(veh, set) end,

---@param cam integer
---@param set boolean
CamSetDollyZoomLock = function(cam, set) end,

---@param cam integer
---@param arg2 integer
CamSetInterpGraphPos = function(cam, arg2) end,

---@param cam integer
---@param val integer
CamSetInterpGraphRot = function(cam, val) end,

---@param arg1 integer
CamSetInterpolationDetails = function(arg1) end,

---@param cam integer
---@param arg2 integer
CamSetInterpStateSrc = function(cam, arg2) end,

---@param viewportIndex integer
ClearRoomForViewport = function(viewportIndex) end,

---@param cam integer
---@return integer camcopy
CloneCam = function(cam) end,

---@return integer
CountScriptCams = function() end,

---@param type integer
---@param arg2 integer
---@param arg3 integer
---@return integer
CountScriptCamsByTypeAndOrState = function(type, arg2, arg3) end,

---@param type integer
---@return integer cameraIndex
---Create a camera of the given type.
CreateCam = function(type) end,

---@return integer viewportIndex
CreateViewport = function() end,

DestroyAllCams = function() end,

DestroyAllScriptViewports = function() end,

---@param camera integer
DestroyCam = function(camera) end,

---@param viewportid integer
DestroyViewport = function(viewportid) end,

---@param arg1 integer
DetachCamFromViewport = function(arg1) end,

DisableHeliChaseCamBonnetNitroFix = function() end,

DisableHeliChaseCamThisUpdate = function() end,

DisableIntermezzoCams = function() end,

---@param camera integer
---@return boolean
DoesCamExist = function(camera) end,

---@param viewportid integer
---@return boolean
DoesViewportExist = function(viewportid) end,

---@param timeMS integer
---Fade in the main viewport with fade from black.
DoScreenFadeIn = function(timeMS) end,

---@param timeMS integer
DoScreenFadeInUnhacked = function(timeMS) end,

---@param timeMS integer
---Fade out the main viewport with fade to black.
DoScreenFadeOut = function(timeMS) end,

---@param timeMS integer
DoScreenFadeOutUnhacked = function(timeMS) end,

---@param cam integer
---@param enable boolean
EnableCamCollision = function(cam, enable) end,

---@param enable boolean
EnableDebugCam = function(enable) end,

---@return integer arg1
EndCamCommands = function() end,

---@param force boolean
ForceGameTelescopeCam = function(force) end,

---@param foce boolean
ForceNoCamPause = function(foce) end,

---@param cam integer
---@return number clip
GetCamFarClip = function(cam) end,

---@param cam integer
---@return number fardof
GetCamFarDof = function(cam) end,

---@param camera integer
---@return number fov
GetCamFov = function(camera) end,

---@param cam integer
---@return integer blur
GetCamMotionBlur = function(cam) end,

---@param cam integer
---@return number clip
GetCamNearClip = function(cam) end,

---@param cam integer
---@return number dof
GetCamNearDof = function(cam) end,

---@param camera integer
---@return number pX
---@return number pY
---@return number pZ
GetCamPos = function(camera) end,

---@param camera integer
---@return number angleX
---@return number angleY
---@return number angleZ
GetCamRot = function(camera) end,

---@param cam integer
---@return integer
GetCamState = function(cam) end,

---@return integer cam
GetCinematicCam = function() end,

---@return integer cam
GetDebugCam = function() end,

---@return integer mode
GetFollowVehicleCamSubmode = function() end,

---@return integer cam
GetFreeCam = function() end,

---@return integer camera
GetGameCam = function() end,

---@return integer camera
GetGameCamChild = function() end,

---@return integer viewportid
GetGameViewportId = function() end,

---@param viewportIndex integer
---@return integer roomKey
GetKeyForViewportInRoom = function(viewportIndex) end,

---@return integer viewport
GetRadarViewportId = function() end,

---@return integer rootcam
GetRootCam = function() end,

---@return integer
GetScreenFadeAlpha = function() end,

---@return integer viewportid
GetScreenViewportId = function() end,

---@return integer cam
GetScriptCam = function() end,

---@return integer cam
GetScriptDrawCam = function() end,

---@param viewportid integer
---@return number x
---@return number y
---@return number xsize
---@return number ysize
GetViewportPosAndSize = function(viewportid) end,

---@param worldPosX number
---@param worldPosY number
---@param worldPosZ number
---@param type integer
---@return boolean
---@return number viewportPosX
---@return number viewportPosY
---Returns a valid point on screen, if either x or y is invalid, this will return false and -1.0 for x and y.
GetViewportPositionOfCoord = function(worldPosX, worldPosY, worldPosZ, type) end,

---@param x number
---@param y number
---@param z number
---@param arg4 integer
---@param arg5 integer
---@param arg6 integer
---@param arg7 integer
HintCam = function(x, y, z, arg4, arg5, arg6, arg7) end,

---@param camera integer
---@return boolean
IsCamActive = function(camera) end,

IsCamColliding = function() end,

---@param cam integer
---@return boolean
IsCamHappy = function(cam) end,

---@return boolean
IsCamInterpolating = function() end,

---@param camera integer
---@return boolean
IsCamPropagating = function(camera) end,

---@param arg1 integer
---@return boolean
IsCamSequenceComplete = function(arg1) end,

---@return boolean
IsCamShaking = function() end,

---@return boolean
IsDebugCameraOn = function() end,

---@return boolean
IsFollowVehicleCamOffsetActive = function() end,

---@return boolean
IsHintRunning = function() end,

---@return boolean
IsScreenFadedIn = function() end,

---@return boolean
IsScreenFadedOut = function() end,

---@return boolean
IsScreenFading = function() end,

---@return boolean
IsScreenFadingIn = function() end,

---@return boolean
IsScreenFadingOut = function() end,

---@param cam integer
---@return boolean
IsSpecificCamInterpolating = function(cam) end,

---@param viewportid integer
---@return boolean
IsViewportActive = function(viewportid) end,

---@param cam integer
---@param heading integer
m = function(cam, heading) end,

---@param cam integer
---@param camnext integer
PointCamAtCam = function(cam, camnext) end,

---@param cam integer
---@param x number
---@param y number
---@param z number
PointCamAtCoord = function(cam, x, y, z) end,

---@param cam integer
---@param obj integer
PointCamAtObject = function(cam, obj) end,

---@param cam integer
---@param ped integer
PointCamAtPed = function(cam, ped) end,

---@param cam integer
---@param veh integer
PointCamAtVehicle = function(cam, veh) end,

---@param x number
---@param y number
---@param z number
---@param arg4 integer
PointFixedCam = function(x, y, z, arg4) end,

---@param obj integer
---@param cam integer
PointFixedCamAtObj = function(obj, cam) end,

---@param ped integer
---@param cam integer
PointFixedCamAtPed = function(ped, cam) end,

---@param x number
---@param y number
---@param z number
---@param cam integer
PointFixedCamAtPos = function(x, y, z, cam) end,

---@param veh integer
---@param cam integer
PointFixedCamAtVehicle = function(veh, cam) end,

---@param activate boolean
ProstituteCamActivate = function(activate) end,

ResetCamInterpCustomSpeedGraph = function() end,

ResetCamSplineCustomSpeedGraph = function() end,

---@param set boolean
SetBlockCameraToggle = function(set) end,

---@param camera integer
---@param value boolean
SetCamActive = function(camera, value) end,

---@param cam integer
---@param x number
---@param y number
---@param z number
SetCamAttachOffset = function(cam, x, y, z) end,

---@param cam integer
---@param set boolean
SetCamAttachOffsetIsRelative = function(cam, set) end,

---@param ped integer
SetCamBehindPed = function(ped) end,

---@param cam integer
---@param componentid integer
---@param arg3 integer
---@param time integer
---@param x number
---@param y number
---@param z number
SetCamComponentShake = function(cam, componentid, arg3, time, x, y, z) end,

---@param cam integer
---@param x number
---@param y number
---@param z number
---@param arg5 number
SetCamDofFocuspoint = function(cam, x, y, z, arg5) end,

---@param set boolean
SetCameraAutoScriptActivation = function(set) end,

---@param set boolean
SetCameraBeginCamCommandsRequired = function(set) end,

---@param value boolean
SetCameraControlsDisabledWithPlayerControls = function(value) end,

---@param cam integer
---@param state integer
SetCameraState = function(cam, state) end,

---@param cam integer
---@param clip number
SetCamFarClip = function(cam, clip) end,

---@param cam integer
---@param fardof number
SetCamFarDof = function(cam, fardof) end,

---@param camera integer
---@param fov number
SetCamFov = function(camera, fov) end,

---@param ped integer
SetCamInFrontOfPed = function(ped) end,

---@param cam integer
---@param obj integer
SetCamInheritRollObject = function(cam, obj) end,

---@param cam integer
---@param ped integer
SetCamInheritRollPed = function(cam, ped) end,

---@param cam integer
---@param veh integer
SetCamInheritRollVehicle = function(cam, veh) end,

---@param speed number
SetCamInterpCustomSpeedGraph = function(speed) end,

---@param arg1 integer
SetCamInterpDetailRotStyleAngles = function(arg1) end,

---@param arg1 integer
SetCamInterpDetailRotStyleQuats = function(arg1) end,

---@param cam0 integer
---@param cam1 integer
---@param cam2 integer
---@param time integer
---@param flag boolean
SetCamInterpStyleCore = function(cam0, cam1, cam2, time, flag) end,

---@param cam integer
---@param arg2 boolean
---@param arg3 boolean
---@param arg4 boolean
---@param arg5 boolean
SetCamInterpStyleDetailed = function(cam, arg2, arg3, arg4, arg5) end,

---@param cam integer
---@param blur number
SetCamMotionBlur = function(cam, blur) end,

---@param cam integer
---@param camname string
---@return integer camname
SetCamName = function(cam, camname) end,

---@param cam integer
---@param clip number
SetCamNearClip = function(cam, clip) end,

---@param cam integer
---@param dof number
SetCamNearDof = function(cam, dof) end,

---@param cam integer
---@param x number
---@param y number
---@param z number
SetCamPointDampingParams = function(cam, x, y, z) end,

---@param cam integer
---@param x number
---@param y number
---@param z number
SetCamPointOffset = function(cam, x, y, z) end,

---@param cam integer
---@param set boolean
SetCamPointOffsetIsRelative = function(cam, set) end,

---@param camera integer
---@param pX number
---@param pY number
---@param pZ number
SetCamPos = function(camera, pX, pY, pZ) end,

---@param camera integer
---@param value boolean
SetCamPropagate = function(camera, value) end,

---@param cam integer
---@param roll number
SetCamRoll = function(cam, roll) end,

---@param camera integer
---@param angleX number
---@param angleY number
---@param angleZ number
SetCamRot = function(camera, angleX, angleY, angleZ) end,

---@param cam integer
---@param arg2 boolean
---@param shakeval integer
SetCamShake = function(cam, arg2, shakeval) end,

---@param speed number
SetCamSplineCustomSpeedGraph = function(speed) end,

---@param cam integer
---@param duration integer
SetCamSplineDuration = function(cam, duration) end,

---@param cam integer
---@param progress number
SetCamSplineProgress = function(cam, progress) end,

---@param cam integer
---@param set boolean
SetCamSplineSpeedConstant = function(cam, set) end,

---@param cam integer
---@param arg2 integer
SetCamSplineSpeedGraph = function(cam, arg2) end,

---@param camera integer
---@param ped integer
SetCamTargetPed = function(camera, ped) end,

---@param multiplier number
SetCarFovFadeMult = function(multiplier) end,

---@param maxfov number
SetCarFovMax = function(maxfov) end,

---@param minfov number
SetCarFovMin = function(minfov) end,

---@param rate number
SetCarFovRate = function(rate) end,

---@param speed number
SetCarFovStartSpeed = function(speed) end,

---@param speed number
SetCarFovStartSpeedBoat = function(speed) end,

---@param blur number
SetCarMotionBlurEffectBoat = function(blur) end,

---@param set boolean
SetCinematicButtonEnabled = function(set) end,

---@param set boolean
SetCollideWithPeds = function(set) end,

---@param shake number
SetDanceShakeActiveThisUpdate = function(shake) end,

SetDanceShakeInactiveImmediately = function() end,

---@param cam integer
---@param val number
---@param time integer
SetDrunkCam = function(cam, val, time) end,

---@param set boolean
SetEnableNearClipScan = function(set) end,

---@param x number
---@param y number
---@param z number
SetFixedCamPos = function(x, y, z) end,

---@param pitchdownlim number
SetFollowPedPitchLimitDown = function(pitchdownlim) end,

---@param pitchuplim number
SetFollowPedPitchLimitUp = function(pitchuplim) end,

---@param arg1 boolean
---@param x number
---@param y number
---@param z number
SetFollowVehicleCamOffset = function(arg1, x, y, z) end,

---@param mode integer
SetFollowVehicleCamSubmode = function(mode) end,

---@param pitchdownlim number
SetFollowVehiclePitchLimitDown = function(pitchdownlim) end,

---@param pitchuplim number
SetFollowVehiclePitchLimitUp = function(pitchuplim) end,

---@param set boolean
SetForceLookBehind = function(set) end,

---@param set boolean
SetFovChannelScript = function(set) end,

---@param active boolean
SetGameCameraControlsActive = function(active) end,

---@param heading number
SetGameCamHeading = function(heading) end,

---@param pitch number
SetGameCamPitch = function(pitch) end,

---@param arg1 number
---@param arg2 number
---@param arg3 number
---@param arg4 number
---@param arg5 boolean
SetHintAdvancedParams = function(arg1, arg2, arg3, arg4, arg5) end,

---@param fov number
SetHintFov = function(fov) end,

---@param dist number
SetHintMoveInDist = function(dist) end,

SetHintMoveInDistDefault = function() end,

---@param arg1 number
---@param arg2 number
---@param arg3 number
SetHintTimes = function(arg1, arg2, arg3) end,

SetHintTimesDefault = function() end,

---@param set boolean
SetInstantWidescreenBorders = function(set) end,

---@param arg1 boolean
---@param arg2 integer
SetInterpFromGameToScript = function(arg1, arg2) end,

---@param arg1 boolean
---@param arg2 integer
SetInterpFromScriptToGame = function(arg1, arg2) end,

---@param set boolean
SetInterpInOutVehicleEnabledThisFrame = function(set) end,

---@param viewportIndex integer
---@param roomKey integer
SetRoomForViewportByKey = function(viewportIndex, roomKey) end,

---@param viewportIndex integer
---@param roomName string
---@return integer roomName
SetRoomForViewportByName = function(viewportIndex, roomName) end,

---@param order integer
SetRotOrder = function(order) end,

---@param viewportid integer
---@param arg2 integer
---@param arg3 integer
---@param arg4 boolean
---@param r integer
---@param g integer
---@param b integer
---@param a integer
---@param arg9 integer
---@param arg10 number
---@param arg11 number
SetScreenFade = function(viewportid, arg2, arg3, arg4, r, g, b, a, arg9, arg10, arg11) end,

---@param factor number
SetSniperZoomFactor = function(factor) end,

---@param arg1 number
---@param arg2 number
---@param arg3 number
---@param arg4 number
---@param arg5 number
---@param arg6 number
SetTelescopeCamAngleLimits = function(arg1, arg2, arg3, arg4, arg5, arg6) end,

---@param set boolean
SetTimeCycleFarClipDisabled = function(set) end,

---@param set boolean
SetUseHighdof = function(set) end,

---@param viewportid integer
---@param arg2 number
---@param arg3 number
---@param arg4 number
---@param arg5 number
SetViewport = function(viewportid, arg2, arg3, arg4, arg5) end,

---@param viewportid integer
---@param x number
---@param y number
---@param z number
---@param arg5 number
---@param arg6 integer
---@param arg7 integer
SetViewportDestination = function(viewportid, x, y, z, arg5, arg6, arg7) end,

---@param viewportid integer
---@param set boolean
SetViewportMirrored = function(viewportid, set) end,

---@param viewportid integer
---@param priority integer
SetViewportPriority = function(viewportid, priority) end,

---@param cam integer
---@param shape integer
SetViewportShape = function(cam, shape) end,

---@param set boolean
---Requests to display borders that make the screen look widescreen OR wider in running on a widescreen telly.
SetWidescreenBorders = function(set) end,

---@param cam integer
---@param arg2 integer
SnapshotCam = function(cam, arg2) end,

---@param cam integer
UnattachCam = function(cam) end,

---@param cam integer
UninheritCamRoll = function(cam) end,

---@param cam integer
UnpointCam = function(cam) end,

---@param date0_0 integer
---@param date0_1 integer
---@param date1_0 integer
---@param date1_1 integer
---@return integer
CompareTwoDates = function(date0_0, date0_1, date1_0, date1_1) end,

---@param hour integer
---@param minute integer
ForceTimeOfDay = function(hour, minute) end,

---@param hour integer
---@param minute integer
ForwardToTimeOfDay = function(hour, minute) end,

---@return integer day
---@return integer month
GetCurrentDate = function() end,

---@return integer
GetCurrentDayOfWeek = function() end,

---@return integer
GetHoursOfDay = function() end,

---@return integer
GetMinutesOfDay = function() end,

---@param hour integer
---@param minute integer
---@return integer
GetMinutesToTimeOfDay = function(hour, minute) end,

---@return integer hour
---@return integer minute
GetTimeOfDay = function() end,

ReleaseTimeOfDay = function() end,

---@param hour integer
---@param minute integer
SetTimeOfDay = function(hour, minute) end,

---@param time integer
SetTimeOfNextAppointment = function(time) end,

SetTimeOneDayBack = function() end,

SetTimeOneDayForward = function() end,

ClearCutscene = function() end,

---@param cutName string
---@return integer cutName
---Clears everything asscoiated with the cutscene.
ClearNamedCutscene = function(cutName) end,

---@param charIndex integer
---@return number position_x
---@return number position_y
---@return number position_z
---Gets the position in world space of the cutscene ped.
GetCutscenePedPosition = function(charIndex) end,

---@return integer
---Gets the current cutscene section playing.
GetCutsceneSectionPlaying = function() end,

---@return integer
---Gets the time in milliseconds that the cutscene has played.
GetCutsceneTime = function() end,

---@return boolean
---Checks if the cutscene has finished.
HasCutsceneFinished = function() end,

---@return boolean
---Checks that the cutscene has been streamed in.
HasCutsceneLoaded = function() end,

---@param name string
---@return integer name
InitCutscene = function(name) end,

---@param charIndex integer
---@return boolean
---Tests to see if a given ped is inside a blocking bound.
IsPedInCutsceneBlockingBounds = function(charIndex) end,

---@param x number
---@param y number
---@param z number
---@return boolean
---Tests to see if a given coord is inside a blocking bound.
IsPosInCutsceneBlockingBounds = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
---Probe the world at the specified point in space and if there is an interior there.
SetCutsceneExtraRoomPos = function(x, y, z) end,

StartCutscene = function() end,

---@param name string
---@return integer name
StartCutsceneNow = function(name) end,

StopCutscene = function() end,

---This native function doesn't work (nullsub).
StreamCutscene = function() end,

---@return boolean
---Checks if the player has skipped the cutscene.
WasCutsceneSkipped = function() end,

---This native function doesn't work (debug function removed in release build).
ActivateVectorMap = function() end,

---@param title string
---@return integer
---@return integer title
---This native function doesn't work (debug function removed in release build).
AddTextWidget = function(title) end,

---@param newComboEntryName string
---@return integer newComboEntryName
---This native function doesn't work (debug function removed in release build).
AddToWidgetCombo = function(newComboEntryName) end,

---@param name string
---@param variable number
---@return integer name
---@return number variable
---This native function doesn't work (debug function removed in release build).
AddWidgetFloatReadOnly = function(name, variable) end,

---@param name string
---@param variable number
---@param min number
---@param max number
---@param sliderStep number
---@return integer name
---@return number variable
---This native function doesn't work (debug function removed in release build).
AddWidgetFloatSlider = function(name, variable, min, max, sliderStep) end,

---@param name string
---@param variable integer
---@return integer name
---@return integer variable
---This native function doesn't work (debug function removed in release build).
AddWidgetReadOnly = function(name, variable) end,

---@param name string
---@param variable integer
---@param min integer
---@param max integer
---@param sliderStep integer
---@return integer name
---@return integer variable
---This native function doesn't work (debug function removed in release build).
AddWidgetSlider = function(name, variable, min, max, sliderStep) end,

---@param string string
---@return integer string
---This native function doesn't work (debug function removed in release build).
AddWidgetString = function(string) end,

---@param name string
---@param toggle integer
---@return integer name
---@return integer toggle
---This native function doesn't work (debug function removed in release build).
AddWidgetToggle = function(name, toggle) end,

---This native function doesn't work (debug function removed in release build).
CloseDebugFile = function() end,

---@param name string
---@return integer
---@return integer name
---This native function doesn't work (debug function removed in release build).
CreateWidgetGroup = function(name) end,

---This native function doesn't work (debug function removed in release build).
DebugOff = function() end,

---This native function doesn't work (debug function removed in release build).
DebugOn = function() end,

---@param textWidgetIndex integer
---This native function doesn't work (debug function removed in release build).
DeleteWidget = function(textWidgetIndex) end,

---@param widgetGroupIndex integer
---This native function doesn't work (debug function removed in release build).
DeleteWidgetGroup = function(widgetGroupIndex) end,

---This native function doesn't work (debug function removed in release build).
DisableDebugCamAndPlayerWarping = function() end,

---@param widgetGroupIndex integer
---@return boolean
---This native function doesn't work (debug function removed in release build).
DoesWidgetGroupExist = function(widgetGroupIndex) end,

---This native function doesn't work (debug function removed in release build).
EndWidgetGroup = function() end,

---@param comboName string
---@param variable integer
---@return integer comboName
---@return integer variable
---This native function doesn't work (debug function removed in release build).
FinishWidgetCombo = function(comboName, variable) end,

---This native function doesn't work (debug function removed in release build).
GetConsoleCommand = function() end,

---@param textWidgetIndex integer
---@return string
---This native function doesn't work (debug function removed in release build).
GetContentsOfTextWidget = function(textWidgetIndex) end,

---@return integer
GetFrameCount = function() end,

---@param modelHashKey integer
---@return string
---This native function doesn't work (debug function removed in release build).
GetModelNameForDebug = function(modelHashKey) end,

---This native function doesn't work (debug function removed in release build).
GetModelNameOfCarForDebugOnly = function() end,

GetNameOfScriptToAutomaticallyStart = function() end,

GetNetworkRestartNodeDebug = function() end,

---This native function doesn't work (debug function removed in release build).
GetRoomNameFromCharDebug = function() end,

---This native function doesn't work (debug function removed in release build).
InitDebugWidgets = function() end,

---This native function doesn't work (debug function removed in release build).
OpenDebugFile = function() end,

---This native function doesn't work (debug function removed in release build).
PrintMissionDescription = function() end,

---This native function doesn't work (debug function removed in release build).
ResetConsoleCommand = function() end,

---@param floatToSave number
---This native function doesn't work (debug function removed in release build).
SaveFloatToDebugFile = function(floatToSave) end,

---@param intToSave integer
---This native function doesn't work (debug function removed in release build).
SaveIntToDebugFile = function(intToSave) end,

---This native function doesn't work (debug function removed in release build).
SaveNewlineToDebugFile = function() end,

---@param stringToSave string
---@return integer stringToSave
---This native function doesn't work (debug function removed in release build).
SaveStringToDebugFile = function(stringToSave) end,

---@param errorString string
---@return integer errorString
---This native function doesn't work (debug function removed in release build).
ScriptAssert = function(errorString) end,

---This native function doesn't work (debug function removed in release build).
SetAllPedsSpawnedAreCops = function() end,

---@param textWidgetIndex integer
---@param newWidgetContents string
---@return integer newWidgetContents
---This native function doesn't work (debug function removed in release build).
SetContentsOfTextWidget = function(textWidgetIndex, newWidgetContents) end,

---@param visible boolean
---This native function doesn't work (debug function removed in release build).
SetDebugTextVisible = function(visible) end,

---@param set boolean
---This native function doesn't work (debug function removed in release build).
SetPlayerInvisibleToAi = function(set) end,

---This native function doesn't work (debug function removed in release build).
StartNewWidgetCombo = function() end,

---This native function doesn't work (debug function removed in release build).
TakeScreenShot = function() end,

---@param x number
---@param y number
---@param z number
---@param explosionTag integer
---@param sizeScale number
---@param makeSound boolean
---@param noFx boolean
---@param camShakeMultiplier number
---Creates an explosion at the coordinates.
AddExplosion = function(x, y, z, explosionTag, sizeScale, makeSound, noFx, camShakeMultiplier) end,

AddExplosionWithDirection = function() end,

---@param fire integer
---@return boolean
DoesScriptFireExist = function(fire) end,

---@param ped integer
ExtinguishCharFire = function(ped) end,

---@param x number
---@param y number
---@param z number
---@param radius number
ExtinguishFireAtPoint = function(x, y, z, radius) end,

---@param obj integer
ExtinguishObjectFire = function(obj) end,

---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@return integer
GetNumberOfFiresInArea = function(x0, y0, z0, x1, y1, z1) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@return integer
---Gets the number of non script fires within radius metres of the given coord.
GetNumberOfFiresInRange = function(x, y, z, radius) end,

---@param fire integer
---@return number x
---@return number y
---@return number z
GetScriptFireCoords = function(fire) end,

---@param charIndex integer
---@return boolean
IsCharOnFire = function(charIndex) end,

---@param explosionTag integer
---@param minX number
---@param minY number
---@param minZ number
---@param maxX number
---@param maxY number
---@param maxZ number
---@return boolean
---Checks if an explosion is in a area.
IsExplosionInArea = function(explosionTag, minX, minY, minZ, maxX, maxY, maxZ) end,

---@param explosionTag integer
---@param x number
---@param y number
---@param z number
---@param radius number
---@return boolean
---Checks if an explosion is in a sphere area.
IsExplosionInSphere = function(explosionTag, x, y, z, radius) end,

---@param objectIndex integer
---@return boolean
IsObjectOnFire = function(objectIndex) end,

---@param fire integer
---@return boolean
IsScriptFireExtinguished = function(fire) end,

---This native function doesn't work (nullsub).
RemoveAllScriptFires = function() end,

---@param fireIndex integer
---Removes a script fire, call only once per fire.
RemoveScriptFire = function(fireIndex) end,

---@param max integer
SetMaxFireGenerations = function(max) end,

---This native function doesn't work (nullsub).
SetScriptFireAudio = function() end,

---@param carIndex integer
---@return integer
---Creates a fire on this car.
StartCarFire = function(carIndex) end,

---@param charIndex integer
---@return integer
---Creates a fire on this char.
StartCharFire = function(charIndex) end,

---@param objectIndex integer
---@return integer
---Creates a fire on this object.
StartObjectFire = function(objectIndex) end,

---@param x number
---@param y number
---@param z number
---@param generationsAllowed integer
---@param strength integer
---@return integer
---Creates a fire at the given coords.
StartScriptFire = function(x, y, z, generationsAllowed, strength) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param arg5 integer
---@return integer
AddSphere = function(x, y, z, radius, arg5) end,

ClearTimecycleModifier = function() end,

---@param type integer
---@param x number
---@param y number
---@param z number
---@param pointAtX number
---@param pointAtY number
---@param pointAtZ number
---@param size number
---@return integer
---Creates a race checkpoint.
CreateCheckpoint = function(type, x, y, z, pointAtX, pointAtY, pointAtZ, size) end,

---@param x number
---@param y number
---@param z number
---@return integer
CreateUser3dMarker = function(x, y, z) end,

---@param checkpointIndex integer
---Removes a checkpoint.
DeleteCheckpoint = function(checkpointIndex) end,

---@param x number
---@param y number
---@param z number
---@param size number
---@param r integer
---@param g integer
---@param b integer
---Draws a cylinder marker.
DrawCheckpoint = function(x, y, z, size, r, g, b) end,

---@param x number
---@param y number
---@param z number
---@param size number
---@param r integer
---@param g integer
---@param b integer
---@param a integer
---Draws a cylinder marker with an alpha value.
DrawCheckpointWithAlpha = function(x, y, z, size, r, g, b, a) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param height number
---@param r integer
---@param g integer
---@param b integer
---@param a integer
DrawColouredCylinder = function(x, y, z, radius, height, r, g, b, a) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param coronaType integer
---@param flareType integer
---@param r integer
---@param g integer
---@param b integer
DrawCorona = function(x, y, z, radius, coronaType, flareType, r, g, b) end,

---@param topLeftX number
---@param topLeftY number
---@param bottomRightX number
---@param bottomRightY number
---@param alpha integer
---Draws a curved window.
DrawCurvedWindow = function(topLeftX, topLeftY, bottomRightX, bottomRightY, alpha) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---This native function doesn't work (debug function removed in release build).
DrawDebugSphere = function(x, y, z, radius) end,

---@param x number
---@param y number
---@param z number
---@param r integer
---@param g integer
---@param b integer
---@param range number
---@param intensity number
---Adds a light with the scene.
DrawLightWithRange = function(x, y, z, r, g, b, range, intensity) end,

---@param x number
---@param y number
---@param width number
---@param height number
---@param rotation number
---@param r integer
---@param g integer
---@param b integer
---@param a integer
---Draws a movie to the screen.
DrawMovie = function(x, y, width, height, rotation, r, g, b, a) end,

---@param x number
---@param y number
---@param width number
---@param height number
---@param r integer
---@param g integer
---@param b integer
---@param a integer
---Renders a rectangle to the screen.
DrawRect = function(x, y, width, height, r, g, b, a) end,

---@param x number
---@param y number
---@param z number
---@param radius number
DrawSphere = function(x, y, z, radius) end,

---@param textureIndex integer
---@param x number
---@param y number
---@param width number
---@param height number
---@param rotation number
---@param r integer
---@param g integer
---@param b integer
---@param a integer
DrawSprite = function(textureIndex, x, y, width, height, rotation, r, g, b, a) end,

---@param textureIndex integer
---@param x number
---@param y number
---@param width number
---@param height number
---@param rotation number
---@param r integer
---@param g integer
---@param b integer
---@param a integer
DrawSpriteWithFixedRotation = function(textureIndex, x, y, width, height, rotation, r, g, b, a) end,

---@param textureIndex integer
---@param x number
---@param y number
---@param width number
---@param height number
---@param rotation number
---@param r integer
---@param g integer
---@param b integer
---@param a integer
DrawSpriteWithUv = function(textureIndex, x, y, width, height, rotation, r, g, b, a) end,

---@param textureIndex integer
---@param x number
---@param y number
---@param width number
---@param height number
---@param ux number
---@param uy number
---@param vx number
---@param vy number
---@param rotation number
---@param r integer
---@param g integer
---@param b integer
---@param a integer
DrawSpriteWithUvCoords = function(textureIndex, x, y, width, height, ux, uy, vx, vy, rotation, r, g, b, a) end,

---@param textureIndex integer
---@param x number
---@param y number
---@param width number
---@param height number
---@param rotation number
---@param r integer
---@param g integer
---@param b integer
---@param a integer
DrawToplevelSprite = function(textureIndex, x, y, width, height, rotation, r, g, b, a) end,

---@param x number
---@param y number
---@param width number
---@param height number
---@param str string
---@param alpha integer
---@return integer str
DrawWindow = function(x, y, width, height, str, alpha) end,

---@param enable boolean
EnableDeferredLighting = function(enable) end,

---@param enable boolean
EnableFancyWater = function(enable) end,

---@param enable boolean
EnableFovLodMultiplier = function(enable) end,

---@param enable boolean
EnableShadows = function(enable) end,

---@param ptfxId integer
---@param evoName string
---@param evoVal number
---@return integer evoName
---Sets the evolution data of a previously started particle effect.
EvolvePtfx = function(ptfxId, evoName, evoVal) end,

---@param force boolean
ForceLoadingScreen = function(force) end,

---@param off boolean
ForceNoiseOff = function(off) end,

---@return number
GetAspectRatio = function() end,

---@return boolean
---Returns if running in hidef.
GetIsHidef = function() end,

---@return boolean
---Returns if running widescreen.
GetIsWidescreen = function() end,

---@return integer x
---@return integer y
---Returns physical the screen resolution.
GetPhysicalScreenResolution = function() end,

---@return integer x
---@return integer y
---Returns the screen resolution.
GetScreenResolution = function() end,

---@param textureDictionaryIndex integer
---@param textureName string
---@return integer
---@return integer textureName
GetTexture = function(textureDictionaryIndex, textureName) end,

---@param textureDictionaryName string
---@param textureName string
---@return integer
---@return integer textureDictionaryName
---@return integer textureName
GetTextureFromStreamedTxd = function(textureDictionaryName, textureName) end,

---@param textureId integer
---@return number x
---@return number y
---Gets the resolution of a texture.
GetTextureResolution = function(textureId) end,

---@param textureDictionaryName string
---@return integer
---@return integer textureDictionaryName
GetTxd = function(textureDictionaryName) end,

---@param textureDictionaryName string
---@return boolean
---@return integer textureDictionaryName
---Checks that the streamed texture dictionary has loaded.
HasStreamedTxdLoaded = function(textureDictionaryName) end,

---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---This native function doesn't work (nullsub).
Line = function(x0, y0, z0, x1, y1, z1) end,

---@param textureDictionaryName string
---@return integer
---@return integer textureDictionaryName
LoadTxd = function(textureDictionaryName) end,

---@param textureDictionaryName string
---@return integer textureDictionaryName
MarkStreamedTxdAsNoLongerNeeded = function(textureDictionaryName) end,

---Plays a loaded movie.
PlayMovie = function() end,

---Frees the memory allocated to the movie.
ReleaseMovie = function() end,

---@param textureIndex integer
ReleaseTexture = function(textureIndex) end,

---@param x number
---@param y number
---@param z number
---@param radius number
RemoveProjtexInRange = function(x, y, z, radius) end,

---@param ptfxId integer
---Remove a particle effect.
RemovePtfx = function(ptfxId) end,

---@param objectIndex integer
RemovePtfxFromObject = function(objectIndex) end,

---@param charIndex integer
RemovePtfxFromPed = function(charIndex) end,

---@param carIndex integer
RemovePtfxFromVehicle = function(carIndex) end,

---@param sphereId integer
RemoveSphere = function(sphereId) end,

---@param textureDictionaryIndex integer
RemoveTxd = function(textureDictionaryIndex) end,

---@param markerId integer
---This native function doesn't work (nullsub).
RemoveUser3dMarker = function(markerId) end,

---@param textureDictionaryName string
---@param priority boolean
---@return integer textureDictionaryName
---Requests a texture dictionary.
RequestStreamedTxd = function(textureDictionaryName, priority) end,

---@param movieName string
---@return integer movieName
---Allocates memory and loads the specified movie file.
SetCurrentMovie = function(movieName) end,

---@param arg1 boolean
---@param arg2 boolean
---@param arg3 boolean
---@param arg4 boolean
SetGlobalRenderFlags = function(arg1, arg2, arg3, arg4) end,

---@param x number
---@param y number
---@param width number
---@param height number
---Masks off an area on screen where no graphics will be drawn.
SetMask = function(x, y, width, height) end,

---@param movieTime number
---Sets the time of the current movie.
SetMovieTime = function(movieTime) end,

---@param movieVolume number
---Sets the volume of the movie audio.
SetMovieVolume = function(movieVolume) end,

---@param scale number
SetPedFireFxLodScaler = function(scale) end,

---@param set boolean
SetPtfxCamInsideVehicle = function(set) end,

---@param multiplier number
---This native function doesn't work (nullsub).
SetSpriteHdrMultiplier = function(multiplier) end,

---@param flag boolean
---Sets a rectangle or sprite to be drawn on top of any fade.
SetSpritesDrawBeforeFade = function(flag) end,

---@param modifierName string
---@return integer modifierName
---Forces the timecycle modifier to be used for 100%.
SetTimecycleModifier = function(modifierName) end,

---@param fxName string
---@param posX number
---@param posY number
---@param posZ number
---@param rotX number
---@param rotY number
---@param rotZ number
---@param scale number
---@return integer
---@return integer fxName
---Start a particle effect at a world position and orientation.
StartPtfx = function(fxName, posX, posY, posZ, rotX, rotY, rotZ, scale) end,

---@param fxName string
---@param objectIndex integer
---@param posX number
---@param posY number
---@param posZ number
---@param rotX number
---@param rotY number
---@param rotZ number
---@param scale number
---@return integer
---@return integer fxName
---Start a particle effect on an object with an offset position and orientation.
StartPtfxOnObj = function(fxName, objectIndex, posX, posY, posZ, rotX, rotY, rotZ, scale) end,

---@param fxName string
---@param objectIndex integer
---@param posX number
---@param posY number
---@param posZ number
---@param rotX number
---@param rotY number
---@param rotZ number
---@param boneIndex integer
---@param scale number
---@return integer
---@return integer fxName
---Start a particle effect on a object bone with an offset position and orientation.
StartPtfxOnObjBone = function(fxName, objectIndex, posX, posY, posZ, rotX, rotY, rotZ, boneIndex, scale) end,

---@param fxName string
---@param charIndex integer
---@param posX number
---@param posY number
---@param posZ number
---@param rotX number
---@param rotY number
---@param rotZ number
---@param scale number
---@return integer
---@return integer fxName
---Start a particle effect on an character with an offset position and orientation.
StartPtfxOnPed = function(fxName, charIndex, posX, posY, posZ, rotX, rotY, rotZ, scale) end,

---@param fxName string
---@param charIndex integer
---@param posX number
---@param posY number
---@param posZ number
---@param rotX number
---@param rotY number
---@param rotZ number
---@param boneIndex integer
---@param scale number
---@return integer
---@return integer fxName
---Start a particle effect on a character bone with an offset position and orientation.
StartPtfxOnPedBone = function(fxName, charIndex, posX, posY, posZ, rotX, rotY, rotZ, boneIndex, scale) end,

---@param fxName string
---@param carIndex integer
---@param posX number
---@param posY number
---@param posZ number
---@param rotX number
---@param rotY number
---@param rotZ number
---@param scale number
---@return integer
---@return integer fxName
---Start a particle effect on an car with an offset position and orientation.
StartPtfxOnVeh = function(fxName, carIndex, posX, posY, posZ, rotX, rotY, rotZ, scale) end,

---Stops a movie playing.
StopMovie = function() end,

---@param ptfxId integer
---Stop a previously started particle effect.
StopPtfx = function(ptfxId) end,

---@param toggle boolean
ToggleToplevelSprite = function(toggle) end,

---@param fxName string
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
---@param scale number
---@return boolean
---@return integer fxName
---Trigger a particle effect at a world position and orientation.
TriggerPtfx = function(fxName, x, y, z, rx, ry, rz, scale) end,

---@param fxName string
---@param objectId integer
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
---@param scale number
---@return boolean
---@return integer fxName
---Trigger a particle effect on an object with an offset position and orientation.
TriggerPtfxOnObj = function(fxName, objectId, x, y, z, rx, ry, rz, scale) end,

---@param fxName string
---@param objectId integer
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
---@param boneId integer
---@param scale number
---@return boolean
---@return integer fxName
---Trigger a particle effect on an object with an offset position and orientation.
TriggerPtfxOnObjBone = function(fxName, objectId, x, y, z, rx, ry, rz, boneId, scale) end,

---@param fxName string
---@param charId integer
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
---@param scale number
---@return boolean
---@return integer fxName
---Trigger a particle effect on an character with an offset position and orientation.
TriggerPtfxOnPed = function(fxName, charId, x, y, z, rx, ry, rz, scale) end,

---@param fxName string
---@param charId integer
---@param x number
---@param y number
---@param z number
---@param arg6 number
---@param arg7 number
---@param arg8 number
---@param boneId integer
---@param scale number
---@return boolean
---@return integer fxName
---Trigger a particle effect on an character with an offset position and orientation.
TriggerPtfxOnPedBone = function(fxName, charId, x, y, z, arg6, arg7, arg8, boneId, scale) end,

---@param fxName string
---@param carIndex integer
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
---@param scale number
---@return boolean
---@return integer fxName
---Trigger a particle effect on an car with an offset position and orientation.
TriggerPtfxOnVeh = function(fxName, carIndex, x, y, z, rx, ry, rz, scale) end,

---@param ptfxId integer
---@param x number
---@param y number
---@param z number
---@param rx number
---@param ry number
---@param rz number
---Update the position and/or rotation offsets of a previously started particle effect.
UpdatePtfxOffsets = function(ptfxId, x, y, z, rx, ry, rz) end,

---@param ptfxId integer
---@param r number
---@param g number
---@param b number
---@param a number
---Sets the tint of a previously started particle effect.
UpdatePtfxTint = function(ptfxId, r, g, b, a) end,

---@param useMask boolean
---Sets a mask active.
UseMask = function(useMask) end,

---@param carId integer
---@param intensity integer
WashVehicleTextures = function(carId, intensity) end,

---@param allow boolean
AllowEmergencyServices = function(allow) end,

---@return boolean
CanPhoneBeSeenOnScreen = function() end,

---@param enablePhotoUpdate boolean
---@param goFirstPerson boolean
---Turn on/off the camera for the cell phone.
CellCamActivate = function(enablePhotoUpdate, goFirstPerson) end,

---@param charIndex integer
---@return boolean
---Is this character visible?
CellCamIsCharVisible = function(charIndex) end,

---@param charIndex integer
---@return boolean
---Is this character visible?.. but disregard if we can see his/her face or not.
CellCamIsCharVisibleNoFaceCheck = function(charIndex) end,

---@param x number
---@param y number
---0.5,0.5 by default
CellCamSetCentrePos = function(x, y) end,

---@param r number
---@param g number
---@param b number
---@param bright number
---Colour of mobile picture screen.
CellCamSetColourBrightness = function(r, g, b, bright) end,

---@param zoom number
---Zoom 0 to 1....
CellCamSetZoom = function(zoom) end,

---@return boolean
CodeWantsMobilePhoneRemoved = function() end,

---@return boolean
CodeWantsMobilePhoneRemovedForWeaponSwitching = function() end,

---@param modelHashKey integer
---@param destinationX number
---@param destinationY number
---@param destinationZ number
---@return boolean
CreateEmergencyServicesCar = function(modelHashKey, destinationX, destinationY, destinationZ) end,

---@param modelHashKey integer
---@param destinationX number
---@param destinationY number
---@param destinationZ number
---@return boolean
---@return integer carIndex
---@return integer charDriver
---@return integer charPassenger
CreateEmergencyServicesCarReturnDriver = function(modelHashKey, destinationX, destinationY, destinationZ) end,

---@param modelHashKey integer
---@param destinationX number
---@param destinationY number
---@param destinationZ number
---@return boolean
CreateEmergencyServicesCarThenWalk = function(modelHashKey, destinationX, destinationY, destinationZ) end,

---@param mobilePhoneType integer
CreateMobilePhone = function(mobilePhoneType) end,

DestroyMobilePhone = function() end,

---@param descText string
---@param buttonText string
---@param newLine boolean
---@return integer descText
---@return integer buttonText
DrawFrontendHelperText = function(descText, buttonText, newLine) end,

---@param x number
---@param y number
---@param width number
---@param height number
---@param rotation number
---@param r integer
---@param g integer
---@param b integer
---@param a integer
DrawSpriteFrontBuff = function(x, y, width, height, rotation, r, g, b, a) end,

---@param x number
---@param y number
---@param width number
---@param height number
---@param rotation number
---@param r integer
---@param g integer
---@param b integer
---@param a integer
---Allows the script to draw the photo somewhere.
DrawSpritePhoto = function(x, y, width, height, rotation, r, g, b, a) end,

---@param onOff boolean
FlashWeaponIcon = function(onOff) end,

---@return number position_x
---@return number position_y
---@return number position_z
GetMobilePhonePosition = function() end,

---@return integer renderId
GetMobilePhoneRenderId = function() end,

---@return number rotation_x
---@return number rotation_y
---@return number rotation_z
GetMobilePhoneRotation = function() end,

---@return number
GetMobilePhoneScale = function() end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@return integer
GetNumberOfInjuredPedsInRange = function(x, y, z, radius) end,

---This native function doesn't work (nullsub).
GetRidOfPlayerProstitute = function() end,

---@return integer renderId
---Searches for a rendertarget and returns -1 if none can be found.
GetScriptRendertargetRenderId = function() end,

---@param modelHashKey integer
---@return integer
GetVehicleTypeOfModel = function(modelHashKey) end,

---@param objectIndex integer
---@return boolean
HasPoolObjectCollidedWithCushion = function(objectIndex) end,

---@param obj integer
---@param otherObjectIndex integer
---@return boolean
HasPoolObjectCollidedWithObject = function(obj, otherObjectIndex) end,

InitFrontendHelperText = function() end,

---@param set boolean
ScriptIsMovingMobilePhoneOffscreen = function(set) end,

---@param set boolean
ScriptIsUsingMobilePhone = function(set) end,

---@param x number
---@param y number
---@param z number
SetMobilePhonePosition = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
SetMobilePhoneRotation = function(x, y, z) end,

---@param scale number
SetMobilePhoneScale = function(scale) end,

---@param objectIndex integer
---@param set boolean
SetObjectUsedInPoolGame = function(objectIndex, set) end,

---@param set boolean
SetUsePoolGamePhysicsSettings = function(set) end,

---@param charIndex integer
---@param otherCharIndex integer
TaskCharArrestChar = function(charIndex, otherCharIndex) end,

---@return boolean
WantedStarsAreFlashing = function() end,

---@param htmlobj integer
---@param str string
---@param n integer
---@return integer str
AddFirstNCharactersOfStringToHtmlScriptObject = function(htmlobj, str, n) end,

---@param htmlobj integer
---@param str string
---@return integer str
AddStringToHtmlScriptObject = function(htmlobj, str) end,

---@param htmlobj integer
---@param htmlcode string
---@return integer htmlcode
AddToHtmlScriptObject = function(htmlobj, htmlcode) end,

---@param htmlobj integer
---@param strgxtkey string
---@return integer strgxtkey
ConvertThenAddStringToHtmlScriptObject = function(htmlobj, strgxtkey) end,

---@param objname string
---@return integer
---@return integer objname
CreateHtmlScriptObject = function(objname) end,

---@return integer htmlviewport
CreateHtmlViewport = function() end,

DeleteAllHtmlScriptObjects = function() end,

---@param htmlobj integer
DeleteHtmlScriptObject = function(htmlobj) end,

---@param webaddress string
---@return boolean
---@return integer webaddress
DoesWebPageExist = function(webaddress) end,

---@param htmlviewport integer
---@return integer
GetNumberOfWebPageLinks = function(htmlviewport) end,

---@param htmlviewport integer
---@return number
GetWebPageHeight = function(htmlviewport) end,

---@param htmlviewport integer
---@param x number
---@param y number
---@return integer
GetWebPageLinkAtPosn = function(htmlviewport, x, y) end,

---@param htmlviewport integer
---@param linkid integer
---@return string
GetWebPageLinkHref = function(htmlviewport, linkid) end,

---@param htmlviewport integer
---@param linkid integer
---@return number x
---@return number y
GetWebPageLinkPosn = function(htmlviewport, linkid) end,

---@param htmlviewport integer
---@param webaddress string
---@return integer webaddress
LoadWebPage = function(htmlviewport, webaddress) end,

---@param htmlviewport integer
ReloadWebPage = function(htmlviewport) end,

---@param htmlviewport integer
---@param linkid integer
---@param active boolean
SetWebPageLinkActive = function(htmlviewport, linkid, active) end,

---@param htmlviewport integer
---@param scroll number
SetWebPageScroll = function(htmlviewport, scroll) end,

ActivateFrontend = function() end,

---@param menuid integer
---@param item integer
---@param activate boolean
ActivateMenuItem = function(menuid, item, activate) end,

---@param carIndex integer
---@return integer blipIndex
---Add radar blip for an car.
AddBlipForCar = function(carIndex) end,

---@param charIndex integer
---@return integer blipIndex
---Add radar blip for an character.
AddBlipForChar = function(charIndex) end,

---@param x number
---@param y number
---@param z number
---@return integer blipIndex
---Add radar blip at contact point.
AddBlipForContact = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
---@return integer blipIndex
---Add radar blip at coordinates.
AddBlipForCoord = function(x, y, z) end,

---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param colour integer
---@return integer blipIndex
---Add radar blip for gang territory.
AddBlipForGangTerritory = function(x0, y0, x1, y1, colour) end,

---@param objectIndex integer
---@return integer blipIndex
---Add radar blip for an object.
AddBlipForObject = function(objectIndex) end,

---@param pickupIndex integer
---@return integer blipIndex
---Add radar blip for pickup object.
AddBlipForPickup = function(pickupIndex) end,

---@param x number
---@param y number
---@param z number
---@param size integer
---@return integer blipIndex
---Add radar blip for a radius.
AddBlipForRadius = function(x, y, z, size) end,

---@param x number
---@param y number
---@param z number
---@return integer blipIndex
AddBlipForWeapon = function(x, y, z) end,

---@param addToPrevBriefsFlag boolean
---Will add/remove the next message from the previous briefs.
AddNextMessageToPreviousBriefs = function(addToPrevBriefsFlag) end,

---@param vPosition_x number
---@param vPosition_y number
---@param vPosition_z number
---@return integer vPosition
---Adds a point to a gps race track at the given vector.
AddPointToGpsRaceTrack = function(vPosition_x, vPosition_y, vPosition_z) end,

---@param pickupIndex integer
AddSimpleBlipForPickup = function(pickupIndex) end,

---@param textLabel string
---@return integer textLabel
AddStringWithThisTextLabelToPreviousBrief = function(textLabel) end,

---@param arg1 string
---@param arg2 boolean
---@param arg3 string
---@param arg4 string
---@param arg5 boolean
---@param arg6 string
---@param arg7 boolean
---@return integer arg1
---@return integer arg3
---@return integer arg4
---@return integer arg6
AddTickerToPreviousBriefWithUnderscore = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7) end,

---@param textLabel string
---@return integer textLabel
---Adds text to a previous brief message.
AddToPreviousBrief = function(textLabel) end,

---@param textLabel string
---@return integer textLabel
---Adds text with an underscore to a previous brief message.
AddToPreviousBriefWithUnderscore = function(textLabel) end,

---@param fontId integer
---@return boolean
CanFontBeLoaded = function(fontId) end,

CanRenderRadiohudSpriteInMobilePhone = function() end,

---@param blipIndex integer
---@param alpha integer
---Change radar blip alpha.
ChangeBlipAlpha = function(blipIndex, alpha) end,

---@param blipIndex integer
---@param colour integer
---Change radar blip colour.
ChangeBlipColour = function(blipIndex, colour) end,

---@param blipId integer
---@param display integer
---Change display mode for radar blip.
ChangeBlipDisplay = function(blipId, display) end,

---@param blipIndex integer
---@param text string
---@return integer text
---Change radar blip name with straight ascii text.
ChangeBlipNameFromAscii = function(blipIndex, text) end,

---@param blipIndex integer
---@param textLabel string
---@return integer textLabel
---Change radar blip name with text from text file.
ChangeBlipNameFromTextFile = function(blipIndex, textLabel) end,

---@param blipIndex integer
---@param playerIndex integer
---Change radar blip name to name of this player.
ChangeBlipNameToPlayerName = function(blipIndex, playerIndex) end,

---@param blipId integer
---@param priority integer
---Change priority for radar blip.
ChangeBlipPriority = function(blipId, priority) end,

---@param blipIndex integer
---@param degrees integer
---Change radar blip rotation.
ChangeBlipRotation = function(blipIndex, degrees) end,

---@param blipIndex integer
---@param scale number
---Change radar blip scale.
ChangeBlipScale = function(blipIndex, scale) end,

---@param blipId integer
---@param sprite integer
---Change the blip sprite to be rendered to the radar.
ChangeBlipSprite = function(blipId, sprite) end,

---@param blipIndex integer
---@param relevance integer
ChangeBlipTeamRelevance = function(blipIndex, relevance) end,

---@param colour integer
---Change the colur of the pickup blips.
ChangePickupBlipColour = function(colour) end,

---@param display integer
---Change how the pickup blips get rendered to the radar.
ChangePickupBlipDisplay = function(display) end,

---@param priority integer
---Change the pickup blip priority.
ChangePickupBlipPriority = function(priority) end,

---@param scale number
---Change the pickups blip scale. Default is 1.0.
ChangePickupBlipScale = function(scale) end,

---@param sprite integer
---Set the blip sprite to be rendered to the radar.
ChangePickupBlipSprite = function(sprite) end,

---@param blipIndex integer
---@param scaleX number
---@param scaleY number
---Change radar blip scale for territory blips.
ChangeTerritoryBlipScale = function(blipIndex, scaleX, scaleY) end,

---@param slotNumber integer
---@param clearPreviousBriefs boolean
---Call this command to remove the text from the previous attempt at the mission from the previous briefs screen.
ClearAdditionalText = function(slotNumber, clearPreviousBriefs) end,

---Clears any messages that are currently being displayed in the Pause Menu brief screen.
ClearBrief = function() end,

---Call to stop displaying the current help message.
ClearHelp = function() end,

---@param counterid integer
ClearOnscreenCounter = function(counterid) end,

---@param timerid integer
ClearOnscreenTimer = function(timerid) end,

---Clears the print queue that may have been built up so far.
ClearPrints = function() end,

---This is the same as CLEAR_PRINTS except that it doesn’t clear big messages.
ClearSmallPrints = function() end,

---@param textLabel string
---@return integer textLabel
ClearThisBigPrint = function(textLabel) end,

---@param textLabel string
---@return integer textLabel
---Clears any instances of this message that are currently being displayed or waiting to be displayed.
ClearThisPrint = function(textLabel) end,

---@param arg1 boolean
ClearThisPrintBigNow = function(arg1) end,

---@param name string
---@param x number
---@param y number
---@param width number
---@param columns integer
---@param interactive boolean
---@param background boolean
---@param alignment integer
---@return integer name
---@return integer menuIndex
CreateMenu = function(name, x, y, width, columns, interactive, background, alignment) end,

DeactivateFrontend = function() end,

---@param menuid integer
DeleteMenu = function(menuid) end,

---@param blipIndex integer
---@param state boolean
---Dims the brightness of a blip.
DimBlip = function(blipIndex, state) end,

---@param disabled boolean
DisablePauseMenu = function(disabled) end,

DisplayAltimeterThisFrame = function() end,

---@param display boolean
DisplayAmmo = function(display) end,

---@param display boolean
---Displays the area name.
DisplayAreaName = function(display) end,

---@param display boolean
---Displays the players cash.
DisplayCash = function(display) end,

---@param display boolean
---Displays blips in the frontend map.
DisplayFrontendMapBlips = function(display) end,

DisplayGrimeThisFrame = function() end,

---@param textLabel string
---@param curvedWindow boolean
---@return integer textLabel
---Displays the help text this frame.
DisplayHelpTextThisFrame = function(textLabel, curvedWindow) end,

---@param display boolean
---Displays the hud.
DisplayHud = function(display) end,

DisplayLoadingThisFrameWithScriptSprites = function() end,

---@param display boolean
---Allows help messages from other scripts to be displayed.
DisplayNonMinigameHelpMessages = function(display) end,

---@param arg1 integer
---@param arg2 integer
---@param arg3 integer
---@param str string
---@return integer str
DisplayNthOnscreenCounterWithString = function(arg1, arg2, arg3, str) end,

---@param timerid integer
---@param arg2 boolean
---@param str string
---@return integer str
DisplayOnscreenTimerWithString = function(timerid, arg2, str) end,

---@param display boolean
---Displays the radar.
DisplayRadar = function(display) end,

---Displays the sniper scope this frame.
DisplaySniperScopeThisFrame = function() end,

---@param x number
---@param y number
---@param textLabel string
---@return integer textLabel
---Displays text to main render target.
DisplayText = function(x, y, textLabel) end,

---@param x number
---@param y number
---@param textLabel string
---@param arg4 boolean
---@param arg5 integer
---@param arg6 integer
---@param arg7 integer
---@return integer textLabel
DisplayTextSubstring = function(x, y, textLabel, arg4, arg5, arg6, arg7) end,

---@param x number
---@param y number
---@param textLabel string
---@param firstNumber integer
---@param secondNumber integer
---@return integer textLabel
---Displays text with 2 numbers onscreen.
DisplayTextWith2Numbers = function(x, y, textLabel, firstNumber, secondNumber) end,

---@param x number
---@param y number
---@param textLabel string
---@param firstNumber integer
---@param secondNumber integer
---@param thirdNumber integer
---@return integer textLabel
---Displays text with 3 numbers onscreen.
DisplayTextWith3Numbers = function(x, y, textLabel, firstNumber, secondNumber, thirdNumber) end,

---@param x number
---@param y number
---@param textLabel string
---@param blipIndex integer
---@return integer textLabel
---Displays the text with the blip name inserted as if it was a literal string.
DisplayTextWithBlipName = function(x, y, textLabel, blipIndex) end,

---@param displayAtX number
---@param displayAtY number
---@param textLabel string
---@param floatToDisplay number
---@param numberOfDecimalPlaces integer
---@return integer textLabel
---Displays on screen text with a float number.
DisplayTextWithFloat = function(displayAtX, displayAtY, textLabel, floatToDisplay, numberOfDecimalPlaces) end,

---@param x number
---@param y number
---@param textLabel string
---@param literalString string
---@return integer textLabel
---@return integer literalString
DisplayTextWithLiteralString = function(x, y, textLabel, literalString) end,

---@param x number
---@param y number
---@param textLabel string
---@param literalString string
---@param arg5 integer
---@param arg6 integer
---@return integer textLabel
---@return integer literalString
DisplayTextWithLiteralSubstring = function(x, y, textLabel, literalString, arg5, arg6) end,

---@param x number
---@param y number
---@param textLabel string
---@param number integer
---@return integer textLabel
---Displays text with a number onscreen.
DisplayTextWithNumber = function(x, y, textLabel, number) end,

---@param x number
---@param y number
---@param textLabel string
---@param shortTextLabel string
---@return integer textLabel
---@return integer shortTextLabel
DisplayTextWithString = function(x, y, textLabel, shortTextLabel) end,

---@param x number
---@param y number
---@param textLabel string
---@param shortTextLabel string
---@param number integer
---@return integer textLabel
---@return integer shortTextLabel
DisplayTextWithStringAndInt = function(x, y, textLabel, shortTextLabel, number) end,

---@param x number
---@param y number
---@param gxtkey string
---@param hashKey integer
---@return integer gxtkey
DisplayTextWithSubstringGivenHashKey = function(x, y, gxtkey, hashKey) end,

---@param x number
---@param y number
---@param textLabel string
---@param literalString1 string
---@param literalString2 string
---@return integer textLabel
---@return integer literalString1
---@return integer literalString2
DisplayTextWithTwoLiteralStrings = function(x, y, textLabel, literalString1, literalString2) end,

---@param x number
---@param y number
---@param textLabel string
---@param shortTextLabel1 string
---@param shortTextLabel2 string
---@return integer textLabel
---@return integer shortTextLabel1
---@return integer shortTextLabel2
DisplayTextWithTwoStrings = function(x, y, textLabel, shortTextLabel1, shortTextLabel2) end,

---@param x number
---@param y number
---@param gxtkey string
---@param hashKey integer
---@param hashKey2 integer
---@return integer gxtkey
DisplayTextWithTwoSubstringsGivenHashKeys = function(x, y, gxtkey, hashKey, hashKey2) end,

---@param blipIndex integer
---@return boolean
---Check if blip exist.
DoesBlipExist = function(blipIndex) end,

---@param textLabel string
---@return boolean
---@return integer textLabel
DoesTextLabelExist = function(textLabel) end,

---@return boolean
---Returns TRUE if DISPLAY_NON_MINIGAME_HELP_MESSAGES(TRUE) has previously been called in this script.
DoesThisMinigameScriptAllowNonMinigameHelpMessages = function() end,

DontDisplayLoadingOnFadeThisFrame = function() end,

---@param arg1 number
---@param arg2 number
---@param arg3 number
---@param arg4 number
---@param arg5 integer
DrawCurvedWindowNotext = function(arg1, arg2, arg3, arg4, arg5) end,

---@param arg1 number
---@param arg2 number
---@param arg3 number
---@param arg4 integer
---@param arg5 integer
---@param arg6 string
---@param arg7 string
---@param arg8 integer
---@return integer arg6
---@return integer arg7
DrawCurvedWindowText = function(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8) end,

---@param arg1 number
---@param arg2 number
---@param arg3 number
---@param arg4 integer
---@param arg5 string
---@param arg6 integer
---@return integer arg5
DrawWindowText = function(arg1, arg2, arg3, arg4, arg5, arg6) end,

---@param blipIndex integer
---@param onOff boolean
---Flash a radar blip.
FlashBlip = function(blipIndex, onOff) end,

---@param blipIndex integer
---@param onOff boolean
---Flash a radar blip (alternative time).
FlashBlipAlt = function(blipIndex, onOff) end,

---@param onOff boolean
FlashRadar = function(onOff) end,

---@param onOff boolean
---Flashes the GPS route on the radar & frontend map.
FlashRoute = function(onOff) end,

---@param freeze boolean
FreezeOnscreenTimer = function(freeze) end,

---@param blipIndex integer
---@return integer alpha
---Returns the alpha of the blip (the value set via SET_BLIP_ALPHA).
GetBlipAlpha = function(blipIndex) end,

---@param blipIndex integer
---@return integer colour
---Returns the colour of the blip.
GetBlipColour = function(blipIndex) end,

---@param blipIndex integer
---@return number coords_x
---@return number coords_y
---@return number coords_z
---Returns the location of this blip. Can only be called for blips added by ADD_BLIP_FOR_COORD.
GetBlipCoords = function(blipIndex) end,

---@param blipIndex integer
---@return integer
GetBlipInfoIdCarIndex = function(blipIndex) end,

---@param blipId integer
---@return integer
GetBlipInfoIdDisplay = function(blipId) end,

---@param blipIndex integer
---@return integer
GetBlipInfoIdObjectIndex = function(blipIndex) end,

---@param blipIndex integer
---@return integer
GetBlipInfoIdPedIndex = function(blipIndex) end,

---@param blipIndex integer
---@return integer
GetBlipInfoIdPickupIndex = function(blipIndex) end,

GetBlipInfoIdPosition = function() end,

---@param blip integer
---@return integer
GetBlipInfoIdRotation = function(blip) end,

---@param blipId integer
---@return integer
GetBlipInfoIdType = function(blipId) end,

---@param blipId integer
---@return integer
GetBlipSprite = function(blipId) end,

---@param r integer
---@param g integer
---@param b integer
---@return integer pR
---@return integer pG
---@return integer pB
GetCorrectedColour = function(r, g, b) end,

---@param filterid integer
---@return integer
GetFilterSaveSetting = function(filterid) end,

---@param blipSprite integer
---@return integer
GetFirstBlipInfoId = function(blipSprite) end,

---@param literalString string
---@param numberOfCharacters integer
---@return string
---@return integer literalString
GetFirstNCharactersOfLiteralString = function(literalString, numberOfCharacters) end,

---@param textLabel string
---@param numberOfCharacters integer
---@return string
---@return integer textLabel
GetFirstNCharactersOfString = function(textLabel, numberOfCharacters) end,

---@param widgetId integer
---@return number x
---@return number y
---Gets the frontend design placement values for use in the multiplayer frontend.
GetFrontendDesignValue = function(widgetId) end,

---@return number x
---@return number y
GetHelpMessageBoxSize = function() end,

---@param hudColour integer
---@return integer r
---@return integer g
---@return integer b
---@return integer a
---Returns the red, green, blue and alpha components of the hudColour passed in.
GetHudColour = function(hudColour) end,

---@param literalString string
---@return integer
---@return integer literalString
---Returns the number of characters in this string.
GetLengthOfLiteralString = function(literalString) end,

---@param hashKey integer
---@return integer
GetLengthOfStringWithThisHashKey = function(hashKey) end,

---@param textLabel string
---@return integer
---@return integer textLabel
---Returns the number of characters in the string with this text label.
GetLengthOfStringWithThisTextLabel = function(textLabel) end,

---@param textLabel string
---@param arg2 boolean
---@param arg3 integer
---@return integer
---@return integer textLabel
GetLengthOfStringWithThisTextLabelInsNum = function(textLabel, arg2, arg3) end,

---@param menuid integer
---@return integer
GetMenuItemAccepted = function(menuid) end,

---@param menuid integer
---@return integer
GetMenuItemSelected = function(menuid) end,

---@param menuid integer
---@return number x
---@return number y
GetMenuPosition = function(menuid) end,

---@param blipSprite integer
---@return integer
GetNextBlipInfoId = function(blipSprite) end,

---@param textLabel string
---@param characterIndex integer
---@return integer
---@return integer textLabel
GetNthIntegerInString = function(textLabel, characterIndex) end,

---@param arg1 number
---@param arg2 number
---@param arg3 string
---@return integer
---@return integer arg3
GetNumberLines = function(arg1, arg2, arg3) end,

---@param arg1 number
---@param arg2 number
---@param arg3 string
---@param arg4 string
---@param arg5 string
---@return integer
---@return integer arg3
---@return integer arg4
---@return integer arg5
GetNumberLinesWithLiteralStrings = function(arg1, arg2, arg3, arg4, arg5) end,

---@param x number
---@param y number
---@param textLabel string
---@param subString1Label string
---@param subString2Label string
---@return integer
---@return integer textLabel
---@return integer subString1Label
---@return integer subString2Label
---Gets the number of lines to display the text with substrings.
GetNumberLinesWithSubstrings = function(x, y, textLabel, subString1Label, subString2Label) end,

---@return integer
GetRouteSize = function() end,

---@return integer
GetSimpleBlipId = function() end,

---@param textLabelHashKey integer
---@return string
---Returns the string contained in the .gxt file for the given text label hash key.
GetStringFromHashKey = function(textLabelHashKey) end,

---@param text string
---@param startPoint integer
---@param endPoint integer
---@return string
---@return integer text
---Returns a string from part of another string.
GetStringFromString = function(text, startPoint, endPoint) end,

---@param textLabel string
---@return string
---@return integer textLabel
GetStringFromTextFile = function(textLabel) end,

---@param gxtname string
---@param gxtnamenext string
---@param val integer
---@return number
---@return integer gxtname
---@return integer gxtnamenext
GetStringWidthWithTextAndInt = function(gxtname, gxtnamenext, val) end,

---@param textLabel string
---@param arg2 boolean
---@param arg3 integer
---@param arg4 integer
---@param arg5 integer
---@return integer
---@return integer textLabel
GetWidthOfSubstringGivenTextLabel = function(textLabel, arg2, arg3, arg4, arg5) end,

---@param slotNumber integer
---@return boolean
---Checks that the text for the slot has loaded.
HasAdditionalTextLoaded = function(slotNumber) end,

---@param textBlockName string
---@param slotNumber integer
---@return boolean
---@return integer textBlockName
---Checks that the text block for the slot has loaded.
HasThisAdditionalTextLoaded = function(textBlockName, slotNumber) end,

---Hides help text this frame.
HideHelpTextThisFrame = function() end,

---Hides the radar AND the hud this frame ONLY.
HideHudAndRadarThisFrame = function() end,

---@param menuid integer
---@param item integer
---@param highlight boolean
HighlightMenuItem = function(menuid, item, highlight) end,

---@param blipIndex integer
---@return boolean
---Returns whether blip is short range or not.
IsBlipShortRange = function(blipIndex) end,

---@param textFont integer
---@return boolean
---Returns TRUE or FALSE depending if the passed streamed font is already loaded.
IsFontLoaded = function(textFont) end,

---@return boolean
---Checks if a help message is being displayed.
IsHelpMessageBeingDisplayed = function() end,

---@return boolean
IsHudPreferenceSwitchedOn = function() end,

---@return boolean
IsHudReticuleComplex = function() end,

---@return boolean
---Checks if any message is being displayed at the bottom of the screen.
IsMessageBeingDisplayed = function() end,

---@return boolean
---Checks if the pause menu is active.
IsPauseMenuActive = function() end,

---@return boolean
IsReplaySaving = function() end,

---@param slotNumber integer
---@return boolean
---The text slot streaming the text.
IsStreamingAdditionalText = function(slotNumber) end,

---@param arg1 string
---@param arg2 integer
---@param arg3 integer
---@return boolean
---@return integer arg1
IsStreamingThisAdditionalText = function(arg1, arg2, arg3) end,

---@param textLabel string
---@return boolean
---@return integer textLabel
IsThisHelpMessageBeingDisplayed = function(textLabel) end,

---@param textLabel string
---@param number integer
---@return boolean
---@return integer textLabel
---Checks if this help text with number is being displayed.
IsThisHelpMessageWithNumberBeingDisplayed = function(textLabel, number) end,

---@param textLabel string
---@param subStringTextLabel string
---@return boolean
---@return integer textLabel
---@return integer subStringTextLabel
---Checks if a help text with a string is being displayed.
IsThisHelpMessageWithStringBeingDisplayed = function(textLabel, subStringTextLabel) end,

---@param textLabel string
---@param extraParamsFlag integer
---@param subStringTextLabel string
---@param literalString1 string
---@param literalString2 string
---@param firstNumberToInsert integer
---@param secondNumberToInsert integer
---@param thirdNumberToInsert integer
---@param fourthNumberToInsert integer
---@param fifthNumberToInsert integer
---@param sixthNumberToInsert integer
---@return boolean
---@return integer textLabel
---@return integer subStringTextLabel
---@return integer literalString1
---@return integer literalString2
---Checks that a message is being displayed filtered by the print params.
IsThisPrintBeingDisplayed = function(textLabel, extraParamsFlag, subStringTextLabel, literalString1, literalString2, firstNumberToInsert, secondNumberToInsert, thirdNumberToInsert, fourthNumberToInsert, fifthNumberToInsert, sixthNumberToInsert) end,

---@param textBlockName string
---@param slotNumber integer
---@return integer textBlockName
---Loads text into a specific text slot.
LoadAdditionalText = function(textBlockName, slotNumber) end,

LoadSettings = function() end,

---@param textFont integer
---Loads a font that requires to be streamed.
LoadTextFont = function(textFont) end,

---@param lock_bit_mask integer
LockPlayerSettingsGenreChange = function(lock_bit_mask) end,

---@param loop boolean
LoopRaceTrack = function(loop) end,

---@param textLabel string
---@param duration integer
---@param colour integer
---@return integer textLabel
---Prints a line of text at the bottom of the screen.
Print = function(textLabel, duration, colour) end,

---@param textLabel string
---@param duration integer
---@param colour integer
---@return integer textLabel
PrintBig = function(textLabel, duration, colour) end,

---@param textLabel string
---@param duration integer
---@param colour integer
---@return integer textLabel
PrintBigQ = function(textLabel, duration, colour) end,

---@param textLabel string
---@return integer textLabel
---Displays the message in a box on the left of the screen for the default help time.
PrintHelp = function(textLabel) end,

---@param textLabel string
---@return integer textLabel
---Displays the message in a box on the left of the screen forever.
PrintHelpForever = function(textLabel) end,

---@param textLabel string
---@param number integer
---@return integer textLabel
---Displays the message with a number in a box on the left of the screen forever.
PrintHelpForeverWithNumber = function(textLabel, number) end,

---@param textLabel string
---@param subStringTextLabel string
---@return integer textLabel
---@return integer subStringTextLabel
---Prints a help text with a string forever.
PrintHelpForeverWithString = function(textLabel, subStringTextLabel) end,

---@param textLabel string
---@param subStringTextLabel string
---@return integer textLabel
---@return integer subStringTextLabel
---Prints a help text with a string forever without sound.
PrintHelpForeverWithStringNoSound = function(textLabel, subStringTextLabel) end,

---@param textLabel string
---@param firstNumber integer
---@param secondNumber integer
---@return integer textLabel
PrintHelpForeverWithTwoNumbers = function(textLabel, firstNumber, secondNumber) end,

---@param textLabel string
---@return integer textLabel
PrintHelpOverFrontend = function(textLabel) end,

---@param textLabel string
---@param number integer
---@return integer textLabel
---Displays the message with a number in a box on the left of the screen for the default help time.
PrintHelpWithNumber = function(textLabel, number) end,

---@param textLabel string
---@param subStringTextLabel string
---@return integer textLabel
---@return integer subStringTextLabel
---Prints a help text with a string.
PrintHelpWithString = function(textLabel, subStringTextLabel) end,

---@param textLabel string
---@param subStringTextLabel string
---@return integer textLabel
---@return integer subStringTextLabel
---Prints a help text with a string without sound.
PrintHelpWithStringNoSound = function(textLabel, subStringTextLabel) end,

---@param textLabel string
---@param firstNumber integer
---@param secondNumber integer
---@return integer textLabel
PrintHelpWithTwoNumbers = function(textLabel, firstNumber, secondNumber) end,

---@param textLabel string
---@param duration integer
---@param colour integer
---@return integer textLabel
---Overwrites any current message with the message.
PrintNow = function(textLabel, duration, colour) end,

---@param textLabel string
---@param shortTextLabel string
---@param duration integer
---@param colour integer
---@return integer textLabel
---@return integer shortTextLabel
---Prints a string inside another string string.
PrintStringInString = function(textLabel, shortTextLabel, duration, colour) end,

---@param textLabel string
---@param shortTextLabel string
---@param duration integer
---@param colour integer
---@return integer textLabel
---@return integer shortTextLabel
---Overwrites any current message with a string inside another string string.
PrintStringInStringNow = function(textLabel, shortTextLabel, duration, colour) end,

---@param textLabel string
---@param literalString string
---@param duration integer
---@param colour integer
---@return integer textLabel
---@return integer literalString
PrintStringWithLiteralString = function(textLabel, literalString, duration, colour) end,

---@param textLabel string
---@param literalString string
---@param duration integer
---@param colour integer
---@return integer textLabel
---@return integer literalString
PrintStringWithLiteralStringNow = function(textLabel, literalString, duration, colour) end,

---@param textLabel string
---@param hashKey integer
---@param duration integer
---@param colour integer
---@return integer textLabel
PrintStringWithSubstringGivenHashKeyNow = function(textLabel, hashKey, duration, colour) end,

---@param textLabel string
---@param literalString1 string
---@param literalString2 string
---@param duration integer
---@param colour integer
---@return integer textLabel
---@return integer literalString1
---@return integer literalString2
PrintStringWithTwoLiteralStrings = function(textLabel, literalString1, literalString2, duration, colour) end,

---@param textLabel string
---@param literalString1 string
---@param literalString2 string
---@param duration integer
---@param colour integer
---@return integer textLabel
---@return integer literalString1
---@return integer literalString2
PrintStringWithTwoLiteralStringsNow = function(textLabel, literalString1, literalString2, duration, colour) end,

---@param textLabel string
---@param firstNumber integer
---@param secondNumber integer
---@param duration integer
---@param colour integer
---@return integer textLabel
---Prints a line of text with 2 numbers at the bottom of the screen.
PrintWith2Numbers = function(textLabel, firstNumber, secondNumber, duration, colour) end,

---@param textLabel string
---@param firstNumber integer
---@param secondNumber integer
---@param duration integer
---@param colour integer
---@return integer textLabel
PrintWith2NumbersBig = function(textLabel, firstNumber, secondNumber, duration, colour) end,

---@param textLabel string
---@param firstNumber integer
---@param secondNumber integer
---@param duration integer
---@param colour integer
---@return integer textLabel
---Overwrites any current message with the message and 2 numbers.
PrintWith2NumbersNow = function(textLabel, firstNumber, secondNumber, duration, colour) end,

---@param textLabel string
---@param firstNumber integer
---@param secondNumber integer
---@param thirdNumber integer
---@param duration integer
---@param colour integer
---@return integer textLabel
PrintWith3Numbers = function(textLabel, firstNumber, secondNumber, thirdNumber, duration, colour) end,

---@param textLabel string
---@param firstNumber integer
---@param secondNumber integer
---@param thirdNumber integer
---@param duration integer
---@param colour integer
---@return integer textLabel
PrintWith3NumbersNow = function(textLabel, firstNumber, secondNumber, thirdNumber, duration, colour) end,

---@param textLabel string
---@param firstNumber integer
---@param secondNumber integer
---@param thirdNumber integer
---@param fourthNumber integer
---@param duration integer
---@param colour integer
---@return integer textLabel
PrintWith4Numbers = function(textLabel, firstNumber, secondNumber, thirdNumber, fourthNumber, duration, colour) end,

---@param textLabel string
---@param firstNumber integer
---@param secondNumber integer
---@param thirdNumber integer
---@param fourthNumber integer
---@param duration integer
---@param colour integer
---@return integer textLabel
PrintWith4NumbersNow = function(textLabel, firstNumber, secondNumber, thirdNumber, fourthNumber, duration, colour) end,

---@param textLabel string
---@param firstNumber integer
---@param secondNumber integer
---@param thirdNumber integer
---@param fourthNumber integer
---@param fifthNumber integer
---@param duration integer
---@param colour integer
---@return integer textLabel
PrintWith5Numbers = function(textLabel, firstNumber, secondNumber, thirdNumber, fourthNumber, fifthNumber, duration, colour) end,

---@param textLabel string
---@param firstNumber integer
---@param secondNumber integer
---@param thirdNumber integer
---@param fourthNumber integer
---@param fifthNumber integer
---@param duration integer
---@param colour integer
---@return integer textLabel
PrintWith5NumbersNow = function(textLabel, firstNumber, secondNumber, thirdNumber, fourthNumber, fifthNumber, duration, colour) end,

---@param textLabel string
---@param firstNumber integer
---@param secondNumber integer
---@param thirdNumber integer
---@param fourthNumber integer
---@param fifthNumber integer
---@param sixthNumber integer
---@param duration integer
---@param colour integer
---@return integer textLabel
PrintWith6Numbers = function(textLabel, firstNumber, secondNumber, thirdNumber, fourthNumber, fifthNumber, sixthNumber, duration, colour) end,

---@param textLabel string
---@param firstNumber integer
---@param secondNumber integer
---@param thirdNumber integer
---@param fourthNumber integer
---@param fifthNumber integer
---@param sixthNumber integer
---@param duration integer
---@param colour integer
---@return integer textLabel
PrintWith6NumbersNow = function(textLabel, firstNumber, secondNumber, thirdNumber, fourthNumber, fifthNumber, sixthNumber, duration, colour) end,

---@param textLabel string
---@param numberToInsert integer
---@param duration integer
---@param colour integer
---@return integer textLabel
---Prints a line of text with a number at the bottom of the screen.
PrintWithNumber = function(textLabel, numberToInsert, duration, colour) end,

---@param textLabel string
---@param numberToInsert integer
---@param duration integer
---@param colour integer
---@return integer textLabel
PrintWithNumberBig = function(textLabel, numberToInsert, duration, colour) end,

---@param textLabel string
---@param numberToInsert integer
---@param duration integer
---@param colour integer
---@return integer textLabel
---Overwrites any current message with the message and a number.
PrintWithNumberNow = function(textLabel, numberToInsert, duration, colour) end,

---@param blipIndex integer
---Delete radar blip.
RemoveBlip = function(blipIndex) end,

---@param blipIndex integer
---@return integer blipIndex
---Delete radar blip and sets the variable to NULL.
RemoveBlipAndClearIndex = function(blipIndex) end,

RenderLoadingClock = function() end,

---@param bOn boolean
---Renders a race track once contsructed.
RenderRaceTrack = function(bOn) end,

---This native function doesn't work (nullsub).
RenderRadiohudSpriteInLobby = function() end,

RenderRadiohudSpriteInMobilePhone = function() end,

---@param textBlockName string
---@param slotNumber integer
---@return integer textBlockName
---Requests a block of text.
RequestAdditionalText = function(textBlockName, slotNumber) end,

SaveSettings = function() end,

---This native function doesn't work (nullsub).
SetAreaName = function() end,

---@param blipIndex integer
---@param friendly boolean
---Set blip as a friendly or threat.
SetBlipAsFriendly = function(blipIndex, friendly) end,

---@param blipIndex integer
---@param onOff boolean
---Set a blip as short range.
SetBlipAsShortRange = function(blipIndex, onOff) end,

---@param blipIndex integer
---@param x number
---@param y number
---@param z number
---Set the coords of a coord, contact or radius blip.
SetBlipCoordinates = function(blipIndex, x, y, z) end,

---@param blipIndex integer
---@param onOff boolean
---Set a blip marker to use a longer distance or not.
SetBlipMarkerLongDistance = function(blipIndex, onOff) end,

---@param set boolean
SetClearHelpInMissionCleanup = function(set) end,

---@param filterid integer
---@param setting integer
SetFilterSaveSetting = function(filterid, setting) end,

---@param set boolean
SetGpsRemainsWhenTargetReachedFlag = function(set) end,

---@param set boolean
SetGpsTestIn3dFlag = function(set) end,

---@param boxSize number
---Set the help text box size.
SetHelpMessageBoxSize = function(boxSize) end,

---@param size number
SetHelpMessageBoxSizeF = function(size) end,

---@param set boolean
SetHideWeaponIcon = function(set) end,

---@param menuIndex integer
---@param column integer
---@param title string
---@param item1 string
---@param item2 string
---@param item3 string
---@param item4 string
---@param item5 string
---@param item6 string
---@param item7 string
---@param item8 string
---@param item9 string
---@param item10 string
---@param item11 string
---@param item12 string
---@return integer title
---@return integer item1
---@return integer item2
---@return integer item3
---@return integer item4
---@return integer item5
---@return integer item6
---@return integer item7
---@return integer item8
---@return integer item9
---@return integer item10
---@return integer item11
---@return integer item12
SetMenuColumn = function(menuIndex, column, title, item1, item2, item3, item4, item5, item6, item7, item8, item9, item10, item11, item12) end,

---@param menuid integer
---@param column integer
---@param orientation integer
SetMenuColumnOrientation = function(menuid, column, orientation) end,

---@param menuid integer
---@param column integer
---@param width number
SetMenuColumnWidth = function(menuid, column, width) end,

---@param menuid integer
---@param item integer
---@param arg3 integer
---@param gxtkey string
---@param number0 integer
---@param number1 integer
---@return integer gxtkey
SetMenuItemWith2Numbers = function(menuid, item, arg3, gxtkey, number0, number1) end,

---@param menuid integer
---@param item integer
---@param arg3 integer
---@param gxtkey string
---@param number integer
---@return integer gxtkey
SetMenuItemWithNumber = function(menuid, item, arg3, gxtkey, number) end,

---@param arg1 boolean
---@param arg2 integer
---@param arg3 integer
SetMessageFormatting = function(arg1, arg2, arg3) end,

---@param add boolean
---@param cash integer
---@param arg3 integer
SetMissionPassedCash = function(add, cash, arg3) end,

SetMultiplayerBrief = function() end,

---@param cash integer
SetMultiplayerHudCash = function(cash) end,

---@param text string
---@return integer text
SetMultiplayerHudTime = function(text) end,

---@param counterid integer
---@param flash boolean
SetOnscreenCounterFlashWhenFirstDisplayed = function(counterid, flash) end,

---@param colour integer
SetPlayerIconColour = function(colour) end,

---Set radar to appear as if inside an interior for 1 frame.
SetRadarAsInteriorThisFrame = function() end,

---@param scale number
SetRadarScale = function(scale) end,

---@param zoomValue integer
---Modifys the zoom value of the radar between 0 (no zoom), and 1 (max zoom in) and 1100 (max zoom out).
SetRadarZoom = function(zoomValue) end,

---@param blipIndex integer
---@param onOff boolean
---Set a route for this blip.
SetRoute = function(blipIndex, onOff) end,

---@param menuid integer
---@param item integer
SetSelectedMenuItem = function(menuid, item) end,

---@param textBackgroundFlag boolean
SetTextBackground = function(textBackgroundFlag) end,

---@param textCentreFlag boolean
---Centre justifies the text.
SetTextCentre = function(textCentreFlag) end,

---@param wrapx number
SetTextCentreWrapx = function(wrapx) end,

---@param r integer
---@param g integer
---@param b integer
---@param a integer
---Sets the colour of the text.
SetTextColour = function(r, g, b, a) end,

---@param textDrawBeforeFadeFlag boolean
---Sets the text will to draw before the fade.
SetTextDrawBeforeFade = function(textDrawBeforeFadeFlag) end,

---@param dropAmount integer
---@param r integer
---@param g integer
---@param b integer
---@param a integer
---Draw a drop shadow behind onscreen intro text.
SetTextDropshadow = function(dropAmount, r, g, b, a) end,

---@param edgeAmount integer
---@param r integer
---@param g integer
---@param b integer
---@param a integer
---Draws an outline round the entire text.
SetTextEdge = function(edgeAmount, r, g, b, a) end,

---@param textFont integer
---Set the text font.
SetTextFont = function(textFont) end,

---@param textJustifyFlag boolean
---Fully justifies the text to the coordinates specified by SET_TEXT_WRAP.
SetTextJustify = function(textJustifyFlag) end,

---@param startLine integer
---@param endLine integer
---Sets which line the text will display on.
SetTextLineDisplay = function(startLine, endLine) end,

---@param lineHeight number
SetTextLineHeightMult = function(lineHeight) end,

---@param textProportionalFlag boolean
---Sets the spacing of the text proporional.
SetTextProportional = function(textProportionalFlag) end,

---@param renderId integer
---Set the render target to be used for rendering.
SetTextRenderId = function(renderId) end,

---@param textRightJustifyFlag boolean
---Right justifies the text.
SetTextRightJustify = function(textRightJustifyFlag) end,

---@param xScale number
---@param yScale number
---Sets the text scale by using a multiplier. 1.0 = normal / 2.0 = double
SetTextScale = function(xScale, yScale) end,

---@param useTextColours boolean
---Uses colurs as set by the text file.
SetTextToUseTextFileColours = function(useTextColours) end,

---@param textUnderScoreFlag boolean
---Draws a box around/behind the text.
SetTextUseUnderscore = function(textUnderScoreFlag) end,

---@param id integer
SetTextViewportId = function(id) end,

---@param wrapStartX number
---@param wrapEndX number
---Sets points where text will wrap round and displayed on a new line.
SetTextWrap = function(wrapStartX, wrapEndX) end,

---@param timerid integer
---@param beeptime integer
SetTimerBeepCountdownTime = function(timerid, beeptime) end,

---@param widescreenSetting integer
---Sets the script widescreen format.
SetWidescreenFormat = function(widescreenSetting) end,

---@param blip integer
---@param show boolean
ShowBlipOnAltimeter = function(blip, show) end,

---@param colour integer
---Starts constructing a race track (circuit) to be displayed on the radar and in the front-end.
StartGpsRaceTrack = function(colour) end,

SwitchOffWaypoint = function() end,

---Turn Off Lobby RadioHud. If the player is not in the Lobby does not do anything.
TurnOffRadiohudInLobby = function() end,

---This native function doesn't work (nullsub).
TurnOnRadiohudInLobby = function() end,

UnloadTextFont = function() end,

UsePreviousFontSettings = function() end,

---@param value number
---@return number
---Checks the absolute value for an float, any negatives will be returned as positive.
Absf = function(value) end,

---@param value integer
---@return integer
---Checks the absolute value for an int, any negatives will be returned as positive.
Absi = function(value) end,

---@param x number
---@return number
---Caluclates the arccos.
Acos = function(x) end,

---@param cheat integer
---Activate a cheat.
ActivateCheat = function(cheat) end,

ActivateNetworkSettingsMenu = function() end,

ActivateReplayMenu = function() end,

ActivateSaveMenu = function() end,

---@param x number
---@param y number
---@param z number
---@param heading number
---@param islandnum integer
---Adds a coord where the player will be restarted after he has been killed.
AddHospitalRestart = function(x, y, z, heading, islandnum) end,

---@param x number
---@param y number
---@param z number
---@param heading number
---@param islandnum integer
---Adds a coord where the player will be restarted after he has been arrested.
AddPoliceRestart = function(x, y, z, heading, islandnum) end,

---@param newsString string
---@return integer newsString
---Add texts to a news scrollbar.
AddStringToNewsScrollbar = function(newsString) end,

---@param startMinX number
---@param startMinY number
---@param startMinZ number
---@param startMaxX number
---@param startMaxY number
---@param startMaxZ number
---@param endMinX number
---@param endMinY number
---@param endMinZ number
---@param endMaxX number
---@param endMaxY number
---@param endMaxZ number
---@param cameraX number
---@param cameraY number
---@param cameraZ number
---@param reward integer
---Adds a stunt jump area in the map.
AddStuntJump = function(startMinX, startMinY, startMinZ, startMaxX, startMaxY, startMaxZ, endMinX, endMinY, endMinZ, endMaxX, endMaxY, endMaxZ, cameraX, cameraY, cameraZ, reward) end,

---@return boolean
AllowOneTimeOnlyCommandsToRun = function() end,

---@param allow boolean
---Sets if the stunt jumps are active.
AllowStuntJumpsToTrigger = function(allow) end,

---@param scriptCanBePaused boolean
---If this command is called with FALSE then this script will not be paused if another script calls PAUSE_GAME.
AllowThisScriptToBePaused = function(scriptCanBePaused) end,

---@return boolean
AreCreditsFinished = function() end,

---@param ascii integer
---@return string
AsciiIntToString = function(ascii) end,

---@param x number
---@return number
---Caluclates the arcsin.
Asin = function(x) end,

---@param x number
---@return number
---Caluclates the arctan.
Atan = function(x) end,

---@param y number
---@param x number
---@return number
Atan2 = function(y, x) end,

---@param ped integer
---@param obj integer
AttachParachuteModelToPlayer = function(ped, obj) end,

CancelOverrideRestart = function() end,

---@return boolean
---Will return TRUE if autosave is switched off in frontend or the saving spinning disc help message is being displayed.
CanStartMissionPassedTune = function() end,

---@param cheat integer
---@param time integer
---@return boolean
CheatHappenedRecently = function(cheat, time) end,

---@param angledArea1X number
---@param angledArea1Y number
---@param angledArea1Z number
---@param angledArea2X number
---@param angledArea2Y number
---@param angledArea2Z number
---@param distanceOfOppositeFace number
---Clears the non axis aligned area of all all non-mission cars.
ClearAngledAreaOfCars = function(angledArea1X, angledArea1Y, angledArea1Z, angledArea2X, angledArea2Y, angledArea2Z, distanceOfOppositeFace) end,

---@param centreX number
---@param centreY number
---@param centreZ number
---@param radius number
---@param deleteProjectilesFlag boolean
---Clears all non-mission cars and chars within the defined sphere.
ClearArea = function(centreX, centreY, centreZ, radius, deleteProjectilesFlag) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---Clears all non-mission cars within the defined sphere.
ClearAreaOfCars = function(x, y, z, radius) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---Clears all non-mission chars within the defined sphere.
ClearAreaOfChars = function(x, y, z, radius) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---Clears all non-mission cops within the defined sphere.
ClearAreaOfCops = function(x, y, z, radius) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---Clears all non-mission objects within the defined sphere.
ClearAreaOfObjects = function(x, y, z, radius) end,

---@param bit integer
---@return integer val
ClearBit = function(bit) end,

---Clears the text that is currently displayed on the news scrollbar.
ClearNewsScrollbar = function() end,

ClearUpTripSkip = function() end,

---@param arg1 string
---@param arg2 string
---@return integer
---@return integer arg1
---@return integer arg2
CompareString = function(arg1, arg2) end,

DeactivateNetworkSettingsMenu = function() end,

---@return boolean
---Checks that the save completed.
DidSaveCompleteSuccessfully = function() end,

---Runs an auto save.
DoAutoSave = function() end,

---@param saveHouseId integer
---@param enable boolean
EnableSaveHouse = function(saveHouseId, enable) end,

---This native function doesn't work (nullsub).
EnableXboxScreenSaver = function() end,

FailKillFrenzy = function() end,

---@param startX number
---@param startY number
---@param startZ number
---@param endX number
---@param endY number
---@param endZ number
---@param damageCaused integer
---Fires an instant hit bullet between the two points.
FireSingleBullet = function(startX, startY, startZ, endX, endY, endZ, damageCaused) end,

FlushAllOutOfDateRadarBlipsFromMissionCleanupList = function() end,

ForcePopulationInit = function() end,

---@param weather integer
ForceWeather = function(weather) end,

---@param weather integer
ForceWeatherNow = function(weather) end,

---@param wind number
ForceWind = function(wind) end,

---@return number arg1
GenerateRandomFloat = function() end,

---@param min number
---@param max number
---@return number randomFloat
---Gets a random float from the range passed in.
GenerateRandomFloatInRange = function(min, max) end,

---@return integer arg1
GenerateRandomInt = function() end,

---@param min integer
---@param max integer
---@return integer randomInt
---Gets a random int from the range passed in.
GenerateRandomIntInRange = function(min, max) end,

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number pResult
GetAngleBetween2dVectors = function(x1, y1, x2, y2) end,

---@param val integer
---@param rangebegin integer
---@param rangeend integer
---@return integer
GetBitsInRange = function(val, rangebegin, rangeend) end,

---@return integer
---Return the current active episode.
GetCurrentEpisode = function() end,

---@return integer
---Gets the current language settings.
GetCurrentLanguage = function() end,

---@return integer
---Gets the size of the calling scripts current stack size.
GetCurrentStackSize = function() end,

---@return integer weather
GetCurrentWeather = function() end,

---@return integer weatherparam0
---@return integer weatherparam1
---@return integer weatherparam2
GetCurrentWeatherFull = function() end,

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number pDist
GetDistanceBetweenCoords2d = function(x1, y1, x2, y2) end,

---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@return number pDist
GetDistanceBetweenCoords3d = function(x1, y1, z1, x2, y2, z2) end,

---@param episode integer
---@return string
---Return an episode name.
GetEpisodeName = function(episode) end,

---@return number time
---Returns the time since the last frame (in seconds).
GetFrameTime = function() end,

---@return integer timer
---Gets the current game timer in milliseconds.
GetGameTimer = function() end,

---@param x number
---@param y number
---@param z number
---@return boolean
---@return number returnZ
---Trys to store the Z coordinate of the highest ground below the given point.
GetGroundZFor3dCoord = function(x, y, z) end,

---@param string string
---@return integer
---@return integer string
---Creates a hash key for the given string.
GetHashKey = function(string) end,

---@param x number
---@param y number
---@return number heading
---Gets a heading in degrees between the x and y vector components.
GetHeadingFromVector2d = function(x, y) end,

---@param interiorIndex integer
---@return number heading
---Gets the offest point returned in world coords.
GetInteriorHeading = function(interiorIndex) end,

---@return boolean
GetIsAutosaveOff = function() end,

---@return boolean
GetIsDisplayingsavemessage = function() end,

---@return number
GetLineHeight = function() end,

---@return boolean
GetMissionFlag = function() end,

---@param modelHashKey integer
---@return number returnMin_x
---@return number returnMin_y
---@return number returnMin_z
---@return number returnMax_x
---@return number returnMax_y
---@return number returnMax_z
---Gets the dimensions of a model. 
GetModelDimensions = function(modelHashKey) end,

---@param interiorIndex integer
---@param x number
---@param y number
---@param z number
---@return number offset_x
---@return number offset_y
---@return number offset_z
GetOffsetFromInteriorInWorldCoords = function(interiorIndex, x, y, z) end,

GetOverrideNoSprintingOnPhoneInMultiplayer = function() end,

---@param settingid integer
---@return integer
GetProfileSetting = function(settingid) end,

---@param textLabel string
---@return number
---@return integer textLabel
---Gets the width of a string.
GetStringWidth = function(textLabel) end,

---@param textLabel string
---@param number integer
---@return number
---@return integer textLabel
---Gets the width of a string with numbers.
GetStringWidthWithNumber = function(textLabel, number) end,

---@param textLabel string
---@param smallString string
---@return number
---@return integer textLabel
---@return integer smallString
---Gets the width of a string inside a string.
GetStringWidthWithString = function(textLabel, smallString) end,

---@param str string
---@return integer
---@return integer str
GetWidthOfLiteralString = function(str) end,

ImproveLowPerformanceMissionPerFrameFlag = function() end,

---@param minX number
---@param minY number
---@param minZ number
---@param maxX number
---@param maxY number
---@param maxZ number
---@param buildingFlag boolean
---@param vehicleFlag boolean
---@param pedFlag boolean
---@param objectFlag boolean
---@param dummyFlag boolean
---@return boolean
---Checks if an area is ocupied by an entity/entities.
IsAreaOccupied = function(minX, minY, minZ, maxX, maxY, maxZ, buildingFlag, vehicleFlag, pedFlag, objectFlag, dummyFlag) end,

---@return boolean
---Returns TRUE when running with the Australian executable.
IsAussieVersion = function() end,

---@return boolean
---Checks if an auto save is happening.
IsAutoSaveInProgress = function() end,

---@param val integer
---@param bitnum integer
---@return boolean
IsBitSet = function(val, bitnum) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param isPlayer boolean
---@return boolean
---Checks that a bullet is in the defined sphere.
IsBulletInArea = function(x, y, z, radius, isPlayer) end,

---@param minX number
---@param minY number
---@param minZ number
---@param maxX number
---@param maxY number
---@param maxZ number
---@param isPlayer boolean
---@return boolean
---Checks that a bullet is in the area.
IsBulletInBox = function(minX, minY, minZ, maxX, maxY, maxZ, isPlayer) end,

---@param episode integer
---@return boolean
---Return if episode is available.
IsEpisodeAvailable = function(episode) end,

---@return boolean
IsEpisodicDiscBuild = function() end,

---@return boolean
---Only returns FALSE if no frontend fade is running.
IsFrontendFading = function() end,

---@return boolean
---Returns TRUE when running with the German executable - no blood etc.
IsGermanVersion = function() end,

---@return boolean
---Checks if the game is in an interior.
IsInteriorScene = function() end,

---@return boolean
---Will eventually return TRUE when running with the Japanese executable.
IsJapaneseVersion = function() end,

---@return boolean
IsLiveVersion = function() end,

---@return boolean
---Checks if a memory card is in use.
IsMemoryCardInUse = function() end,

---@return boolean
---Checks if a minigame is in progress.
IsMinigameInProgress = function() end,

---@return boolean
IsPcVersion = function() end,

---@param x number
---@param y number
---@param z number
---@param locateX number
---@param locateY number
---@param locateZ number
---@return boolean
---Returns TRUE if any mission-created cars, chars or objects are in the defined area.
IsPointObscuredByAMissionEntity = function(x, y, z, locateX, locateY, locateZ) end,

---@param minX number
---@param minY number
---@param minZ number
---@param maxX number
---@param maxY number
---@param maxZ number
---@return boolean
---Checks that a projectile object is in the area.
IsProjectileInArea = function(minX, minY, minZ, maxX, maxY, maxZ) end,

---@return boolean
IsReplaySystemActive = function() end,

---@return boolean
IsReplaySystemSaving = function() end,

---@param minX number
---@param minY number
---@param minZ number
---@param maxX number
---@param maxY number
---@param maxZ number
---@return boolean
---Checks that a sniper bullet is in a area.
IsSniperBulletInArea = function(minX, minY, minZ, maxX, maxY, maxZ) end,

---@return boolean
---Checks if the sniper rifle control is inverted.
IsSniperInverted = function() end,

---@param str string
---@return boolean
---@return integer str
---Checks if the string is NULL.
IsStringNull = function(str) end,

---@return boolean
---Checks that this is a mingame script.
IsThisAMinigameScript = function() end,

---@return boolean
---Returns TRUE when running with the Xbox360 executable.
IsXbox360Version = function() end,

---@param angle number
---@return number anglelimited
LimitAngle = function(angle) end,

---@param str string
---@return string
---@return integer str
ObfuscateString = function(str) end,

---@param override boolean
---Forces all exterior chars and cars to freeze, regardless of player's position.
OverrideFreezeFlags = function(override) end,

---@param x number
---@param y number
---@param z number
---@param heading number
OverrideNextRestart = function(x, y, z, heading) end,

PauseGame = function() end,

---This native function doesn't work (nullsub).
PickRandomWeather = function() end,

PopulateNow = function() end,

---Deletes all chars and cars that have previously been added to this list.
ProcessMissionDeletionList = function() end,

---@return integer
ReadKillFrenzyStatus = function() end,

---@param x number
---@param y number
---@param z number
---@param heading number
---@param roomName string
---@param mapAreaName integer
---@return integer
---@return integer roomName
RegisterSaveHouse = function(x, y, z, heading, roomName, mapAreaName) end,

ReleaseWeather = function() end,

---@return boolean
SecuromSpotCheck1 = function() end,

---@return boolean
SecuromSpotCheck2 = function() end,

---@return boolean
SecuromSpotCheck3 = function() end,

---@return boolean
SecuromSpotCheck4 = function() end,

---@param bit integer
---@return integer val
SetBit = function(bit) end,

---@param rangebegin integer
---@param rangeend integer
---@param val integer
---@return integer arg1
SetBitsInRange = function(rangebegin, rangeend, val) end,

---@param set boolean
SetClearManifolds = function(set) end,

---@param set boolean
SetCreditsToRenderBeforeFade = function(set) end,

SetDefaultGlobalInstancePriority = function() end,

---@param x number
---@param y number
---@param z number
---@param arg4 number
---@param arg5 number
SetExtraHospitalRestartPoint = function(x, y, z, arg4, arg5) end,

---@param x number
---@param y number
---@param z number
---@param arg4 number
---@param arg5 number
SetExtraPoliceStationRestartPoint = function(x, y, z, arg4, arg5) end,

---@param set boolean
SetFadeInAfterLoad = function(set) end,

---@param x number
---@param y number
---@param radius number
SetFakeWantedCircle = function(x, y, radius) end,

---@param level integer
---Draws a fake number of wanted stars.
SetFakeWantedLevel = function(level) end,

---@param priority integer
SetGlobalInstancePriority = function(priority) end,

---@param set boolean
SetGravityOff = function(set) end,

SetKillstreak = function() end,

---@param waiting boolean
---Displays the envelope icon near radar to say you have unread text messages waiting.
SetMessagesWaiting = function(waiting) end,

---@param newState boolean
---Informs the game of a mini-games status.
SetMinigameInProgress = function(newState) end,

---@param missionFlagValue boolean
---Sets the script as a mission script.
SetMissionFlag = function(missionFlagValue) end,

---@param state boolean
---Sets if the player can sprint when on the phone, default is no sprint.
SetOverrideNoSprintingOnPhoneInMultiplayer = function(state) end,

---@param type integer
---@param textLabel string
---@param number integer
---@return integer textLabel
---Displays the relevant hud item.
SetPhoneHudItem = function(type, textLabel, number) end,

---@param set boolean
SetPhysCcdHandlesRotation = function(set) end,

---@param setPlayerControlOnInCleanup boolean
---Sets the player control at the after script has terminated.
SetPlayerControlOnInMissionCleanup = function(setPlayerControlOnInCleanup) end,

---@param seed integer
---Creates a random seed.
SetRandomSeed = function(seed) end,

---@param active boolean
---Sets the sleep mode of the mobile.
SetSleepModeActive = function(active) end,

---@param canRemoveBlipsCreatedByOtherScripts boolean
SetThisScriptCanRemoveBlipsCreatedByAnyScript = function(canRemoveBlipsCreatedByOtherScripts) end,

---@param newTimeScale number
---Sets the time scale of the game to make it run slower.
SetTimeScale = function(newTimeScale) end,

SetUpTripSkip = function() end,

SetUpTripSkipAfterMission = function() end,

---@param arg1 number
---@param arg2 number
---@param arg3 number
---@param arg4 number
---@param veh integer
SetUpTripSkipForSpecificVehicle = function(arg1, arg2, arg3, arg4, veh) end,

SetUpTripSkipForVehicleFinishedByScript = function() end,

SetUpTripSkipToBeFinishedByScript = function() end,

---@return boolean
SpotCheck5 = function() end,

---@return boolean
SpotCheck6 = function() end,

---@return boolean
SpotCheck7 = function() end,

---@return boolean
SpotCheck8 = function() end,

StartCredits = function() end,

---@param gxtname string
---@param arg2 integer
---@param arg3 integer
---@param arg4 integer
---@param arg5 integer
---@param arg6 integer
---@param arg7 integer
---@param arg8 integer
---@param arg9 boolean
---@return integer gxtname
StartKillFrenzy = function(gxtname, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) end,

StopCredits = function() end,

---@param str0 string
---@param str1 string
---@return integer
---@return integer str0
---@return integer str1
StringDifference = function(str0, str1) end,

---@param arg1 string
---@param arg2 string
---@return integer
---@return integer arg1
---@return integer arg2
StringString = function(arg1, arg2) end,

---@param stringToConvert string
---@return boolean
---@return integer stringToConvert
---@return integer returnInteger
---Converts a string to an int.
StringToInt = function(stringToConvert) end,

---@param doFade boolean
---Sets whether the screen fades back in after a death arrest has been intiated.
SuppressFadeInAfterDeathArrest = function(doFade) end,

---@param x number
---@return number
---Caluclates the tan.
Tan = function(x) end,

TerminateAllScriptsForNetworkGame = function() end,

---@param name string
---@return integer name
---Terminates all scripts with the specified name.
TerminateAllScriptsWithThisName = function(name) end,

---Tell the game not to remove this script when TERMINATE_ALL_SCRIPTS_FOR_NETWORK_GAME is called.
ThisScriptIsSafeForNetworkGame = function() end,

---Only scripts that call this command will be stored on the memory card.
ThisScriptShouldBeSaved = function() end,

---@param str string
---@return string
---@return integer str
UnobfuscateString = function(str) end,

UnpauseGame = function() end,

---@param networkId integer
---@param activateTracker boolean
ActivateDamageTrackerOnNetworkId = function(networkId, activateTracker) end,

AddNetworkRestart = function() end,

---@param arg2 integer
---@return integer
---@return integer array
CalculateChecksum = function(arg2) end,

CanRegisterMissionEntities = function() end,

---@return boolean
CanRegisterMissionObject = function() end,

---@return boolean
CanRegisterMissionPed = function() end,

---@return boolean
CanRegisterMissionVehicle = function() end,

ClanIsPending = function() end,

---@param scratchpadIndex integer
ClearScriptArrayFromScratchpad = function(scratchpadIndex) end,

DisplayPlayerIcons = function() end,

---@param display boolean
DisplayPlayerNames = function(display) end,

---@return boolean
DoesGameCodeWantToLeaveNetworkSession = function() end,

---@param networkId integer
---@return boolean
---Returns true if an object with the specified network ID exists on the local machine.
DoesObjectExistWithNetworkId = function(networkId) end,

---@param networkId integer
---@return boolean
---Returns true if an ped with the specified network ID exists on the local machine.
DoesPedExistWithNetworkId = function(networkId) end,

---@param playerIndex integer
---@param networkIndex integer
---@return boolean
---Returns true if the player has ownership of the object with the specified network ID.
DoesPlayerHaveControlOfNetworkId = function(playerIndex, networkIndex) end,

---@param networkId integer
---@return boolean
---Returns true if an vehicle with the specified network ID exists on the local machine.
DoesVehicleExistWithNetworkId = function(networkId) end,

---@param playerId integer
---@return integer
---Returns the player that has killed the other player last.
FindNetworkKillerOfPlayer = function(playerId) end,

---@param arg3 integer
---@return boolean
---@return number position_x
---@return number position_y
---@return number position_z
---@return number heading
FindNetworkRestartPoint = function(arg3) end,

GetCameraFromNetworkId = function() end,

---@return boolean
GetCellphoneRanked = function() end,

---@param networkIndex integer
---@return integer
---@return integer weaponType
---Returns the player index of the player that destroyed the network object with the specified network ID.
GetDestroyerOfNetworkId = function(networkIndex) end,

---@return integer
---Returns the index of the episode for the summons that has just been received.
GetEpisodeIndexFromSummons = function() end,

---@return boolean
GetFilterMenuOn = function() end,

---@return boolean
GetGfwlHasSafeHouse = function() end,

---@return boolean
GetGfwlIsReturningToSinglePlayer = function() end,

---@return integer
GetHostId = function() end,

---@return boolean
GetHostMatchOn = function() end,

---@param modelHash integer
---@param weaponType integer
---@return integer
---Return how many times the local player has kills a char with the specified char model with the specified weapon.
GetKillTrackingResults = function(modelHash, weaponType) end,

---@param networkId integer
---@return integer
GetLastTimeNetworkIdDamaged = function(networkId) end,

---@return integer
GetLcpdCopScore = function() end,

---@return integer
GetLcpdCriminalScore = function() end,

---@return integer
GetLocalGamerlevelFromProfilesettings = function() end,

---@param objectIndex integer
---@return integer networkId
---Returns the network ID of the object with the specified index.
GetNetworkIdFromObject = function(objectIndex) end,

---@param charId integer
---@return integer networkId
---Returns the network ID of the character with the specified index.
GetNetworkIdFromPed = function(charId) end,

---@param carId integer
---@return integer networkId
---Returns the network ID of the car with the specified index.
GetNetworkIdFromVehicle = function(carId) end,

---@return boolean
GetNetworkJoinFail = function() end,

---@return boolean
GetNetworkPlayerVip = function() end,

---@return integer timer
---Gets the current network timer in milliseconds.
GetNetworkTimer = function() end,

---@param modelHash integer
---@return integer
---Return how many times the local player has killed a char using the specified char model, all kills of chars with models not registered are tracked separately and returned as a combined total.
GetNumKillsForRankPoints = function(modelHash) end,

---@param networkId integer
---@return integer objectIndex
---Returns the object index of the object with the specified network ID.
GetObjectFromNetworkId = function(networkId) end,

---@return boolean
GetOnlineLan = function() end,

---@param arg1 integer
---@return integer
GetOnlineScore = function(arg1) end,

---@param networkId integer
---@return integer charIndex
GetPedFromNetworkId = function(networkId) end,

---@param playerIndex integer
---@return integer
GetPlayerLcpdScore = function(playerIndex) end,

---@param playerIndex integer
---@return integer
GetPlayerRankLevelDuringMp = function(playerIndex) end,

---@return boolean
GetReturnToFilterMenu = function() end,

GetSafeLocalRestartCoords = function() end,

---@return integer
GetServerId = function() end,

---@return boolean
GetStartFromFilterMenu = function() end,

GetTeamColour = function() end,

---@param team integer
---@return integer red
---@return integer green
---@return integer blue
---Gets the RGB colour of the team.
GetTeamRgbColour = function(team) end,

---@param networkId integer
---@return integer vehicleIndex
---Returns the vehicle index of the vehicle with the specified network ID.
GetVehicleFromNetworkId = function(networkId) end,

---@param networkId integer
---@return boolean
---Returns true if the local machine has ownership of the object with the specified network ID.
HasControlOfNetworkId = function(networkId) end,

HasNetIdBeenCloned = function() end,

---@param playerIndex integer
---@return boolean
HasNetworkPlayerLeftGame = function(playerIndex) end,

---@param playerIndex integer
---@param pickupIndex integer
---@return boolean
---Returns a true if the specified network player has collected the specified pickup.
HasPlayerCollectedPickup = function(playerIndex, pickupIndex) end,

---@param playerIndex integer
---@return integer
---Returns the time (in milliseconds) that a specific player has been dead for.
HowLongHasNetworkPlayerBeenDeadFor = function(playerIndex) end,

---@param charIndex integer
---@param playerIndex integer
---@return boolean
IsCharOnPlayerMachine = function(charIndex, playerIndex) end,

---@param networkId integer
---@return boolean
IsDamageTrackerActiveOnNetworkId = function(networkId) end,

---@return boolean
IsInMpTutorial = function() end,

---@return boolean
IsInSpectatorMode = function() end,

---@return boolean
IsLcpdDataValid = function() end,

---@return boolean
IsNetworkConnected = function() end,

---@return boolean
IsNetworkGamePending = function() end,

---@return boolean
IsNetworkGameRunning = function() end,

---@param playerId integer
---@return boolean
IsNetworkPlayerActive = function(playerId) end,

---@param playerIndex integer
---@return boolean
---Returns true if the given player is visible on screen, and not occluded. Can be called every frame.
IsNetworkPlayerVisible = function(playerIndex) end,

---@return boolean
IsNetworkSession = function() end,

---@param objectIndex integer
---@param playerIndex integer
---@return boolean
IsObjectOnPlayerMachine = function(objectIndex, playerIndex) end,

---@return boolean
IsObjectReassignmentInProgress = function() end,

---@param playerIndex integer
---@return boolean
IsOurPlayerHigherPriorityForCarGeneration = function(playerIndex) end,

---@return boolean
IsPartyMode = function() end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@return boolean
IsSphereVisibleToAnotherMachine = function(x, y, z, radius) end,

---@return boolean
IsThisMachineTheServer = function() end,

---@param carIndex integer
---@param playerIndex integer
---@return boolean
IsVehicleOnPlayerMachine = function(carIndex, playerIndex) end,

LaunchLocalPlayerInNetworkGame = function() end,

---@return boolean
LcpdFirstTime = function() end,

---@return boolean
LcpdHasBeenConfigured = function() end,

---@return boolean
LocalPlayerIsReadyToStartPlaying = function() end,

---@param index integer
---@return boolean
---Accepts the unaccepted invite at the given index.
NetworkAcceptInvite = function(index) end,

---@param advertise boolean
---@return boolean
---Enables/disables session advertisement. Callable only on the host.
NetworkAdvertiseSession = function(advertise) end,

---@return boolean
NetworkAllPartyMembersPresent = function() end,

---@param playerIndex integer
---@return boolean
---Check communication status with a particular player.
NetworkAmIBlockedByPlayer = function(playerIndex) end,

---@param playerIndex integer
---@return boolean
---Check communication status with a particular player.
NetworkAmIMutedByPlayer = function(playerIndex) end,

---@return integer gameConfig
NetworkChangeExtendedGameConfig = function() end,

---@param gameMode integer
---@param maxPlayers integer
---@param maxPrivateSlots integer
---@param maxTeams integer
---@return boolean
---Changes the game mode and number of slots of the current session.
---Callable only by the host.
---Number of slots cannot be reduced from their current number.
NetworkChangeGameMode = function(gameMode, maxPlayers, maxPrivateSlots, maxTeams) end,

---@return boolean
NetworkChangeGameModePending = function() end,

---@return boolean
NetworkChangeGameModeSucceeded = function() end,

---@return boolean
---Returns true if a new invitation has arrived.
NetworkCheckInviteArrival = function() end,

---Clears the flag indicating the presence of a new invitation.
NetworkClearInviteArrival = function() end,

---@return boolean
NetworkClearSummons = function() end,

---@param friendName string
---@return boolean
---@return integer friendName
---Returns true if an invitation was sent to the friend during the current session.
NetworkDidInviteFriend = function(friendName) end,

NetworkDisplayHostGamerCard = function() end,

---@return boolean
---Ends a network session.
NetworkEndSession = function() end,

---@return boolean
NetworkEndSessionPending = function() end,

---@return boolean
NetworkExpandTo32Players = function() end,

---@param gameMode integer
---@param arg2 boolean
---@param arg3 integer
---@param arg4 integer
NetworkFindGame = function(gameMode, arg2, arg3, arg4) end,

---@return boolean
NetworkFindGamePending = function() end,

NetworkFinishExtendedSearch = function() end,

---@param findIndex integer
---@return integer results
NetworkGetFindResult = function(findIndex) end,

---@return integer
NetworkGetFriendCount = function() end,

---@return boolean
NetworkGetFriendlyFireOption = function() end,

---@param friendIndex integer
---@return string
NetworkGetFriendName = function(friendIndex) end,

---@return integer
---Returns the game mode.
NetworkGetGameMode = function() end,

---@return boolean
NetworkGetHealthReticuleOption = function() end,

---@param host integer
---@return integer
NetworkGetHostAverageRank = function(host) end,

---@param host integer
---@return integer
NetworkGetHostLatency = function(host) end,

---@param host integer
---@return integer
NetworkGetHostMatchProgress = function(host) end,

---@return string
NetworkGetHostName = function() end,

---@param host integer
---@return string
NetworkGetHostServerName = function(host) end,

---@return boolean
NetworkGetLanSession = function() end,

---@return integer
---Returns the maximum available private slots.
NetworkGetMaxPrivateSlots = function() end,

---@return integer
---Returns the maximum available slots.
NetworkGetMaxSlots = function() end,

---@param playerMetIndex integer
---@return string
---Given an index into the player history, returns the name of the player.
NetworkGetMetPlayerName = function(playerMetIndex) end,

---@return string
NetworkGetNextTextChat = function() end,

---@return integer
NetworkGetNumberOfGames = function() end,

---@return integer
NetworkGetNumOpenPublicSlots = function() end,

---@return integer
NetworkGetNumPartyMembers = function() end,

---@return integer
---Returns the number of players met during the current session.
NetworkGetNumPlayersMet = function() end,

---@return integer
NetworkGetNumUnacceptedInvites = function() end,

---@return integer
---Returns the number of reserved but unfilled slots in the session.
NetworkGetNumUnfilledReservations = function() end,

---@return integer
NetworkGetPlayerIdOfNextTextChat = function() end,

---@return integer
NetworkGetRendezvousHostPlayerId = function() end,

---@return string
NetworkGetServerName = function() end,

NetworkGetTeamOption = function() end,

---@param inviteIndex integer
---@return integer
---Returns the episode being used in the invited session.
NetworkGetUnacceptedInviteEpisode = function(inviteIndex) end,

---@param inviteIndex integer
---@return integer
---Returns the game mode being used in the invited session.
NetworkGetUnacceptedInviteGameMode = function(inviteIndex) end,

---@param inviteIndex integer
---@return string
---Returns the name of the inviting player at the given index.
NetworkGetUnacceptedInviterName = function(inviteIndex) end,

---@return boolean
NetworkHasStrictNat = function() end,

---@return boolean
---Returns true if the local player has accepted an invitation.
NetworkHaveAcceptedInvite = function() end,

---@return boolean
---Returns true if the local player has online privileges.
NetworkHaveOnlinePrivileges = function() end,

---@return boolean
---Returns true if we've accepted an invitation or received a summons to join a session.
NetworkHaveSummons = function() end,

NetworkHostGameCnc = function() end,

---@param gameMode integer
---@param ranked boolean
---@param maxPlayers integer
---@param maxPrivateSlots integer
---@param episode integer
---@param maxTeams integer
---@return boolean
NetworkHostGameE1 = function(gameMode, ranked, maxPlayers, maxPrivateSlots, episode, maxTeams) end,

---@return boolean
NetworkHostGamePending = function() end,

---@return boolean
NetworkHostGameSucceeded = function() end,

---@param gameMode integer
---@param maxPlayers integer
---@param episode integer
---@return boolean
NetworkHostRendezvousE1 = function(gameMode, maxPlayers, episode) end,

---@param friendName string
---@param salutation string
---@return boolean
---@return integer friendName
---@return integer salutation
---Invite a friend to join your session.
---Salutation is a text string that will be included in the invitation.
NetworkInviteFriend = function(friendName, salutation) end,

---@return boolean
NetworkIsBeingKicked = function() end,

---@param episode integer
---@return boolean
---Returns true if everyone in the session has the DLC for the given episode.
NetworkIsCommonEpisode = function(episode) end,

---@return boolean
NetworkIsDataModded = function() end,

---@param findIndex integer
---@return boolean
NetworkIsFindResultUpdated = function(findIndex) end,

---@param findIndex integer
---@return boolean
NetworkIsFindResultValid = function(findIndex) end,

---@param friendName string
---@return boolean
---@return integer friendName
---Returns true if the friend is playing the same game (e.g. GTAIV).
NetworkIsFriendInSameTitle = function(friendName) end,

---@param friendName string
---@return boolean
---@return integer friendName
NetworkIsFriendOnline = function(friendName) end,

---@return boolean
---Returns true if the game is ranked.
NetworkIsGameRanked = function() end,

---@return boolean
---Returns true if the player who accepted the invite is online.
NetworkIsInviteeOnline = function() end,

NetworkIsLinkConnected = function() end,

---@return boolean
NetworkIsNetworkAvailable = function() end,

---@return boolean
---Returns true if an asynchronous operation is pending. (e.g. NETWORK_HOST_GAME_PENDING(), etc.)
NetworkIsOperationPending = function() end,

---@param playerIndex integer
---@return boolean
---Check communication status with a particular player.
NetworkIsPlayerBlockedByMe = function(playerIndex) end,

---@param playerIndex integer
---@return boolean
---Returns true if the given player is muted by the local player.
NetworkIsPlayerMutedByMe = function(playerIndex) end,

---@param playerIndex integer
---@return boolean
---Returns true if the given player is currently voice chatting.
NetworkIsPlayerTalking = function(playerIndex) end,

---@param playerIndex integer
---@return boolean
NetworkIsPlayerTyping = function(playerIndex) end,

---@return boolean
NetworkIsRendezvous = function() end,

---@return boolean
NetworkIsRendezvousHost = function() end,

---@return boolean
NetworkIsRockstartSessionIdValid = function() end,

---@return boolean
---Returns true if the session is currently advertised.
NetworkIsSessionAdvertise = function() end,

---@return boolean
---Returns true if invites can be sent.
NetworkIsSessionInvitable = function() end,

---@return boolean
NetworkIsSessionStarted = function() end,

---@return boolean
NetworkIsTvt = function() end,

---@param findIndex integer
---@return boolean
NetworkJoinGame = function(findIndex) end,

NetworkJoinGameCnc = function() end,

---@return boolean
NetworkJoinGamePending = function() end,

---@return boolean
NetworkJoinGameSucceeded = function() end,

---@return boolean
NetworkJoinSummons = function() end,

---@param playerIndex integer
---@param hasHacked boolean
---Kicks the given player from the session. Callable only by the host.
NetworkKickPlayer = function(playerIndex, hasHacked) end,

---@return boolean
---Leaves a network game.
NetworkLeaveGame = function() end,

---@return boolean
NetworkLeaveGamePending = function() end,

---@return boolean
NetworkLimitTo16Players = function() end,

---@return boolean
NetworkPlayerHasCommPrivs = function() end,

---@param playerIndex integer
---@return boolean
NetworkPlayerHasDiedRecently = function(playerIndex) end,

---@param playerIndex integer
---@return boolean
---Returns true if the given player has a headset connected.
NetworkPlayerHasHeadset = function(playerIndex) end,

---@param playerIndex integer
---@return boolean
---Returns true if the given player has a keyboard connected.
NetworkPlayerHasKeyboard = function(playerIndex) end,

---@return integer gameConfig
NetworkRestoreGameConfig = function() end,

---@param findIndex integer
---@return boolean
NetworkResultMatchesSearchCriteria = function(findIndex) end,

---@return boolean
NetworkReturnToRendezvous = function() end,

---@return boolean
NetworkReturnToRendezvousPending = function() end,

---@return boolean
NetworkReturnToRendezvousSucceeded = function() end,

---@param playerId integer
---@param message string
---@return boolean
---@return integer message
NetworkSendTextChat = function(playerId, message) end,

---@param friendlyFire boolean
NetworkSetFriendlyFireOption = function(friendlyFire) end,

---@param healthReticule boolean
NetworkSetHealthReticuleOption = function(healthReticule) end,

---@param arg1 boolean
NetworkSetLanSession = function(arg1) end,

NetworkSetLocalPlayerCanTalk = function() end,

---@param playerIndex integer
---@return boolean
NetworkSetLocalPlayerIsTyping = function(playerIndex) end,

---@param progress integer
NetworkSetMatchProgress = function(progress) end,

---@param playerIndex integer
---@param muted boolean
---@return boolean
---Mutes / unmutes the remote player.
NetworkSetPlayerMuted = function(playerIndex, muted) end,

---@param state boolean
NetworkSetScriptLobbyState = function(state) end,

---@param name string
---@return boolean
---@return integer name
NetworkSetServerName = function(name) end,

---@param invitable boolean
---@return boolean
NetworkSetSessionInvitable = function(invitable) end,

---@param playerIndex integer
---Sets the voice chat focus on the given player.
NetworkSetTalkerFocus = function(playerIndex) end,

---@param distance number
---Sets the distance threshold that determines how close a player must be before we can chat with him.
NetworkSetTalkerProximity = function(distance) end,

---@param teamOnlyChat boolean
---Enables/disables team-only chat.
NetworkSetTeamOnlyChat = function(teamOnlyChat) end,

---@param arg1 integer
NetworkSetTextChatRecipients = function(arg1) end,

---@param friendName string
---@return integer friendName
---Displays a UI showing a friend's profile info (gamer card on Xbox).
NetworkShowFriendProfileUi = function(friendName) end,

---@param playerMetIndex integer
---Given an index into the player history, displays a UI for submitting feedback for that player.(Xbox only).
NetworkShowMetPlayerFeedbackUi = function(playerMetIndex) end,

---@param playerMetIndex integer
---Displays a UI showing a player's profile info (gamer card on Xbox).
NetworkShowMetPlayerProfileUi = function(playerMetIndex) end,

NetworkShowPlayerFeedbackUi = function() end,

---@param playerIndex integer
---Displays a UI showing a player's profile info (gamer card on Xbox).
NetworkShowPlayerProfileUi = function(playerIndex) end,

---@return integer arg1
NetworkStartExtendedSearch = function() end,

---@return boolean
---Starts a network session (for scoring, leaderboard).
NetworkStartSession = function() end,

---@return boolean
NetworkStartSessionPending = function() end,

---@return boolean
NetworkStartSessionSucceeded = function() end,

---@return integer gameConfig
NetworkStoreGameConfig = function() end,

---@return boolean
NetworkStoreSinglePlayerGame = function() end,

---@return boolean
NetworkStringVerifyPending = function() end,

---@return boolean
NetworkStringVerifySucceeded = function() end,

---@param string string
---@return integer string
NetworkVerifyUserString = function(string) end,

---@param arg1 integer
---@param arg2 integer
ObfuscateInt = function(arg1, arg2) end,

---@param arg1 integer
---@param arg2 integer
ObfuscateIntArray = function(arg1, arg2) end,

---@param playerIndex integer
---@return boolean
PlayerWantsToJoinNetworkGame = function(playerIndex) end,

---@param arg1 integer
---@return integer
ReadLobbyPreference = function(arg1) end,

---@param size integer
---@param arg3 integer
---@return integer vars
---Registers the variables for each client running the script.
RegisterClientBroadcastVariables = function(size, arg3) end,

---@param size integer
---@param arg3 integer
---@return integer vars
---Registers the variables that the host alters and that the clients need to be updated on.
RegisterHostBroadcastVariables = function(size, arg3) end,

---@param killer integer
---@param victim integer
---@param weaponType integer
RegisterKillInMultiplayerGame = function(killer, victim, weaponType) end,

RegisterMod = function() end,

---@param modelHash integer
---Registers a char model for tracking when a char using it is killed for the purposes of assigning rank points.
RegisterModelForRankPoints = function(modelHash) end,

RemoveAllNetworkRestartPoints = function() end,

---@param networkId integer
---@return boolean
---Request ownership of the object with the specified network ID from the current owner.
RequestControlOfNetworkId = function(networkId) end,

---@param numObjectsToReserve integer
---Reserves space in the population pool for the given number of objects.
ReserveNetworkMissionObjects = function(numObjectsToReserve) end,

---@param numObjectsToReserve integer
ReserveNetworkMissionObjectsForHost = function(numObjectsToReserve) end,

---@param numPedsToReserve integer
---Reserves space in the population pool for the given number of peds.
ReserveNetworkMissionPeds = function(numPedsToReserve) end,

---@param numPedsToReserve integer
ReserveNetworkMissionPedsForHost = function(numPedsToReserve) end,

---@param numVehiclesToReserve integer
---Reserves space in the population pool for the given number of vehicles.
ReserveNetworkMissionVehicles = function(numVehiclesToReserve) end,

---@param numVehiclesToReserve integer
ReserveNetworkMissionVehiclesForHost = function(numVehiclesToReserve) end,

---@param size integer
---@param scriptIndex integer
---@param scratchpadIndex integer
---@return integer array
RestoreScriptArrayFromScratchpad = function(size, scriptIndex, scratchpadIndex) end,

---@return boolean
---@return integer array
RestoreScriptValuesForNetworkGame = function() end,

---@param playerIndex integer
---@param x number
---@param y number
---@param z number
---@param heading number
---Revives the specified player who was previously dead.
ResurrectNetworkPlayer = function(playerIndex, x, y, z, heading) end,

---@param size integer
---@param scriptIndex integer
---@param scratchpadIndex integer
---@return integer array
SaveScriptArrayInScratchpad = function(size, scriptIndex, scratchpadIndex) end,

SendClientBroadcastVariablesNow = function() end,

SendHostBroadcastVariablesNow = function() end,

---@param carIndex integer
---@param existsOnAllMachines boolean
SetCarExistsOnAllMachines = function(carIndex, existsOnAllMachines) end,

---@param carIndex integer
---@param stopCloning boolean
SetCarStopCloning = function(carIndex, stopCloning) end,

---@param arg1 boolean
SetCellphoneRanked = function(arg1) end,

---@param playerIndex integer
---@param display boolean
SetDisplayPlayerNameAndIcon = function(playerIndex, display) end,

---@param arg1 boolean
SetFilterMenuOn = function(arg1) end,

---@param arg1 boolean
SetGfwlHasSafeHouse = function(arg1) end,

---@param arg1 boolean
SetGfwlIsReturningToSinglePlayer = function(arg1) end,

---@param arg1 boolean
SetHostMatchOn = function(arg1) end,

---@param networkId integer
---@param ignore boolean
SetIgnoreServerUpdate = function(networkId, ignore) end,

---@param playerIndex integer
---@param disabled boolean
SetIkDisabledForNetworkPlayer = function(playerIndex, disabled) end,

---@param inMPTutorial boolean
SetInMpTutorial = function(inMPTutorial) end,

---@param inSpectatorMode boolean
---Set the local in spectator mode.
SetInSpectatorMode = function(inSpectatorMode) end,

---@param duration integer
SetInvincibilityTimerDuration = function(duration) end,

---@param arg1 integer
SetLcpdCopScore = function(arg1) end,

---@param arg1 integer
SetLcpdCriminalScore = function(arg1) end,

---@param msg string
---@return integer msg
---Sets a message that will be displayed during the loading screen.
SetMsgForLoadingScreen = function(msg) end,

---@param networkId integer
---@param canMigrate boolean
SetNetworkIdCanMigrate = function(networkId, canMigrate) end,

---@param networkId integer
---@param existsOnAllMachines boolean
---Sets whether a script object will be created on all machines running this script.
SetNetworkIdExistsOnAllMachines = function(networkId, existsOnAllMachines) end,

---@param networkId integer
---@param stopCloning boolean
SetNetworkIdStopCloning = function(networkId, stopCloning) end,

---@param networkId integer
---@param stopCloning boolean
SetNetworkIdStopCloningForEnemies = function(networkId, stopCloning) end,

---@param arg1 boolean
SetNetworkJoinFail = function(arg1) end,

---@param networkId integer
SetNetworkPedUsingParachute = function(networkId) end,

---@param playerIndex integer
---@param vip boolean
SetNetworkPlayerAsVip = function(playerIndex, vip) end,

---@param networkIndex integer
---@param timer integer
SetNetworkVehicleRespotTimer = function(networkIndex, timer) end,

---@param networkId integer
---@param visibility boolean
SetNetworkVisibility = function(networkId, visibility) end,

---@param objectIndex integer
---@param existsOnAllMachines boolean
SetObjectExistsOnAllMachines = function(objectIndex, existsOnAllMachines) end,

---@param objectIndex integer
---@param stopCloning boolean
SetObjectStopCloning = function(objectIndex, stopCloning) end,

---@param arg1 boolean
SetOnlineLan = function(arg1) end,

---@param type integer
---@param value integer
SetOnlineScore = function(type, value) end,

---@param charIndex integer
---@param existsOnAllMachines boolean
SetPedExistsOnAllMachines = function(charIndex, existsOnAllMachines) end,

---@param charIndex integer
---@param stopCloning boolean
SetPedStopCloning = function(charIndex, stopCloning) end,

---@param playerIndex integer
---@param playerIndex2 integer
---@param arg3 boolean
SetPlayerAsDamagedPlayer = function(playerIndex, playerIndex2, arg3) end,

---@param arg1 boolean
SetReturnToFilterMenu = function(arg1) end,

---@param arg1 integer
---@param arg2 integer
---@param arg3 integer
---@param arg4 integer
---@param arg5 integer
SetRichPresence = function(arg1, arg2, arg3, arg4, arg5) end,

SetRichPresenceTemplatefilter = function() end,

---@param arg1 integer
SetRichPresenceTemplatelobby = function(arg1) end,

---@param arg1 integer
---@param arg2 integer
---@param arg3 integer
---@param arg4 integer
SetRichPresenceTemplatemp1 = function(arg1, arg2, arg3, arg4) end,

---@param arg1 integer
SetRichPresenceTemplatemp2 = function(arg1) end,

---@param arg1 integer
---@param arg2 integer
SetRichPresenceTemplatemp3 = function(arg1, arg2) end,

---@param arg1 integer
---@param arg2 integer
SetRichPresenceTemplatemp4 = function(arg1, arg2) end,

---@param arg1 integer
---@param arg2 integer
---@param arg3 integer
SetRichPresenceTemplatemp5 = function(arg1, arg2, arg3) end,

---@param arg1 integer
---@param arg2 integer
---@param arg3 integer
SetRichPresenceTemplatemp6 = function(arg1, arg2, arg3) end,

SetRichPresenceTemplateparty = function() end,

---@param arg1 integer
---@param arg2 integer
---@param arg3 integer
SetRichPresenceTemplatesp1 = function(arg1, arg2, arg3) end,

---@param arg1 integer
SetRichPresenceTemplatesp2 = function(arg1) end,

---@param arg1 integer
SetServerId = function(arg1) end,

---@param arg1 boolean
SetStartFromFilterMenu = function(arg1) end,

---@param toggle boolean
SetSyncWeatherAndGameTime = function(toggle) end,

---@param team integer
---@param colour integer
SetTeamColour = function(team, colour) end,

---@param toggle boolean
SetThisMachineRunningServerScript = function(toggle) end,

---@param episodeToLaunch integer
ShutdownAndLaunchNetworkGame = function(episodeToLaunch) end,

ShutdownAndLaunchSinglePlayerGame = function() end,

---@param modelHash integer
---@param weaponType integer
---Start tracking how many times the local player kills the specified char model with the specified weapon.
StartKillTracking = function(modelHash, weaponType) end,

---@param modelHash integer
---@param weaponType integer
---Stop tracking how many times the local player kills the specified char model with the specified weapon.
StopKillTracking = function(modelHash, weaponType) end,

---@param stopSync boolean
StopSyncingScriptAnimations = function(stopSync) end,

---@param playerIndex integer
---@param weaponType integer
---@param networkId integer
---@return integer
StoreDamageTrackerForNetworkPlayer = function(playerIndex, weaponType, networkId) end,

---@return integer array
StoreScriptValuesForNetworkGame = function() end,

---@param playerIndex integer
---@param x number
---@param y number
---@param z number
---@param heading number
TeleportNetworkPlayer = function(playerIndex, x, y, z, heading) end,

---@param playerIndex integer
---@param teamIndex integer
TellNetPlayerToStartPlaying = function(playerIndex, teamIndex) end,

---@param count integer
---@return integer val
UnobfuscateInt = function(count) end,

---@param arg1 integer
---@return integer array
UnobfuscateIntArray = function(arg1) end,

---@param playerIndex integer
---@param arg2 integer
UpdatePlayerLcpdScore = function(playerIndex, arg2) end,

---@param active boolean
---Forces the player colour to be used for the radar and gametag instead of team colours.
UsePlayerColourInsteadOfTeamColour = function(active) end,

WriteLobbyPreference = function() end,

---@param objectIndex integer
---@param roomKey integer
AddObjectToInteriorRoomByKey = function(objectIndex, roomKey) end,

---@param objectIndex integer
---@param roomName string
---@return integer roomName
AddObjectToInteriorRoomByName = function(objectIndex, roomName) end,

---@param pickupIndex integer
---@param roomKey integer
AddPickupToInteriorRoomByKey = function(pickupIndex, roomKey) end,

---@param pickupIndex integer
---@param roomName string
---@return integer roomName
AddPickupToInteriorRoomByName = function(pickupIndex, roomName) end,

---@param allow boolean
AllowMultipleDrivebyPickups = function(allow) end,

---@param objectId integer
---@param anchor boolean
---@param flags integer
AnchorObject = function(objectId, anchor, flags) end,

---@param objectIndex integer
---@param applyType integer
---@param forceX number
---@param forceY number
---@param forceZ number
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param component integer
---@param localForce boolean
---@param localOffset boolean
---@param scaleByMass boolean
---Apply a force to an object.
ApplyForceToObject = function(objectIndex, applyType, forceX, forceY, forceZ, offsetX, offsetY, offsetZ, component, localForce, localOffset, scaleByMass) end,

---@param objectIndex integer
---@param carIndex integer
---@param boneIndex integer
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
---Attaches an object to an car with a non physical attachement.
AttachObjectToCar = function(objectIndex, carIndex, boneIndex, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ) end,

---@param objectIndex integer
---@param carIndex integer
---@param parentBone integer
---@param childBone integer
---@param posX number
---@param posY number
---@param posZ number
---@param physicalPivotX number
---@param physicalPivotY number
---@param physicalPivotZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
---@param strength number
---@param constrainRotation boolean
---Attaches an object to a car using a physical attachment.
AttachObjectToCarPhysically = function(objectIndex, carIndex, parentBone, childBone, posX, posY, posZ, physicalPivotX, physicalPivotY, physicalPivotZ, rotationX, rotationY, rotationZ, strength, constrainRotation) end,

---@param obj0 integer
---@param obj1_attach_to integer
---@param arg3 integer
---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
AttachObjectToObject = function(obj0, obj1_attach_to, arg3, x0, y0, z0, x1, y1, z1) end,

AttachObjectToObjectPhysically = function() end,

---@param objectIndex integer
---@param charIndex integer
---@param boneIndex integer
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param rotationX number
---@param rotationY number
---@param rotationZ number
---@param detachOnRagdoll boolean
---Attaches an object to an char with a non physical attachement.
AttachObjectToPed = function(objectIndex, charIndex, boneIndex, offsetX, offsetY, offsetZ, rotationX, rotationY, rotationZ, detachOnRagdoll) end,

AttachObjectToPedPhysically = function() end,

---@param obj integer
ClearObjectLastDamageEntity = function(obj) end,

---@param objectIndex integer
ClearRoomForObject = function(objectIndex) end,

---@param obj0 integer
---@param obj1 integer
ConnectLods = function(obj0, obj1) end,

---@param type integer
---@return integer
CountPickupsOfType = function(type) end,

---@param x number
---@param y number
---@param z number
---@param amount integer
---@param permanent boolean
---@return integer pickupIndex
CreateMoneyPickup = function(x, y, z, amount, permanent) end,

---@param modelHashKey integer
---@param x number
---@param y number
---@param z number
---@param registerAsNetworkObject boolean
---@return integer objectIndex
---Create an object with an offset (from the root the base) at the given coord.
CreateObject = function(modelHashKey, x, y, z, registerAsNetworkObject) end,

---@param modelHash integer
---@param x number
---@param y number
---@param z number
---@param registerAsNetworkObject boolean
---@return integer objectIndex
---Create an object with no offset at the given coord.
CreateObjectNoOffset = function(modelHash, x, y, z, registerAsNetworkObject) end,

---@param modelHashKey integer
---@param pickupType integer
---@param x number
---@param y number
---@param z number
---@param unknownFalse boolean
---@return integer pickupIndex
---Create an object that the player can pickup.
CreatePickup = function(modelHashKey, pickupType, x, y, z, unknownFalse) end,

---@param modelHash integer
---@param pickupType integer
---@param ammo integer
---@param x number
---@param y number
---@param z number
---@param rX number
---@param rY number
---@param rZ number
---@return integer pickupIndex
---Creates a pickup that can be given any orientation.
CreatePickupRotate = function(modelHash, pickupType, ammo, x, y, z, rX, rY, rZ) end,

---@param modelHash integer
---@param pickupType integer
---@param ammo integer
---@param x number
---@param y number
---@param z number
---@return integer pickupIndex
---Creates a weapon pickup, giving the player the specified amount of ammo when they pick it up.
CreatePickupWithAmmo = function(modelHash, pickupType, ammo, x, y, z) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param bliptype integer
CreateTemporaryRadarBlipsForPickupsInArea = function(x, y, z, radius, bliptype) end,

---@param pObj integer
---@return integer pObj
DeleteObject = function(pObj) end,

---@param objectIndex integer
---@param applyVelocity boolean
---Detaches an object from being attached.
DetachObject = function(objectIndex, applyVelocity) end,

---@param obj integer
---@param flag boolean
DetachObjectNoCollide = function(obj, flag) end,

---@param disable boolean
DisableLocalPlayerPickups = function(disable) end,

---@param obj integer
---@return boolean
DoesObjectExist = function(obj) end,

---@param obj integer
---@return boolean
DoesObjectHavePhysics = function(obj) end,

---@param objectIndex integer
---@param modelHashKey integer
---@return boolean
DoesObjectHaveThisModel = function(objectIndex, modelHashKey) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param modelHash integer
---@return boolean
---Returns TRUE if the closest object within radius is a proper object - not a dummy or building.
DoesObjectOfTypeExistAtCoords = function(x, y, z, radius, modelHash) end,

---@param pickup integer
---@return boolean
DoesPickupExist = function(pickup) end,

---@param obj integer
DontRemoveObject = function(obj) end,

---@param obj integer
---@param enable boolean
EnableDisabledAttractorsOnObject = function(obj, enable) end,

---@param x number
---@param y number
---@param z number
FindNearestCollectableBinBags = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
FindNearestEntitiesWithSpecialAttribute = function(x, y, z) end,

---@param obj integer
---@param frozen boolean
FreezeObjectPosition = function(obj, frozen) end,

---@param obj integer
---@param freeze boolean
FreezeObjectPositionAndDontLoadCollision = function(obj, freeze) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param modelHash integer
---@param freeze boolean
---Freezes the object of type.
FreezePositionOfClosestObjectOfType = function(x, y, z, radius, modelHash, freeze) end,

---@param objectIndex integer
---@return integer
GetCarObjectIsAttachedTo = function(objectIndex) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@return integer obj
GetClosestStealableObject = function(x, y, z, radius) end,

---@param objectId integer
---@return integer lockState
---@return number openRatio
---Get the state of a door.
GetDoorState = function(objectId) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param modelHash integer
---@param flag boolean
---@return number
GetFragmentDamageHealthOfClosestObjectOfType = function(x, y, z, radius, modelHash, flag) end,

---@param x number
---@param y number
---@param z number
---@return integer interiorIndex
---Gets the interior index from coords.
GetInteriorAtCoords = function(x, y, z) end,

---@param obj integer
---@param arg2 integer
---@return number
---@return number x
---@return number y
---@return number z
GetLevelDesignCoordsForObject = function(obj, arg2) end,

---@param obj integer
---@param animname0 string
---@param animname1 string
---@return integer animname0
---@return integer animname1
---@return number time
GetObjectAnimCurrentTime = function(obj, animname0, animname1) end,

---@param obj integer
---@param animname0 string
---@param animname1 string
---@return integer animname0
---@return integer animname1
---@return number time
GetObjectAnimTotalTime = function(obj, animname0, animname1) end,

---@param obj integer
---@return number pX
---@return number pY
---@return number pZ
GetObjectCoordinates = function(obj) end,

---@param objectIndex integer
---@param healthPercentageByMass boolean
---@return number
---Get the damage health of a fragment heap.
GetObjectFragmentDamageHealth = function(objectIndex, healthPercentageByMass) end,

---@param obj integer
---@return number pHeading
GetObjectHeading = function(obj) end,

---@param obj integer
---@return number pHealth
GetObjectHealth = function(obj) end,

---@param obj integer
---@return number mass
GetObjectMass = function(obj) end,

---@param objectIndex integer
---@return integer modelHashKey
---Get the model hash for the object.
GetObjectModel = function(objectIndex) end,

---@param obj integer
---@return number arg2
---@return number arg3
---@return number arg4
---@return number arg5
GetObjectQuaternion = function(obj) end,

---@param obj integer
---@return number pX
---@return number pY
---@return number pZ
GetObjectRotationVelocity = function(obj) end,

---@param obj integer
---@return number pSpeed
GetObjectSpeed = function(obj) end,

---@param obj integer
---@return number turnmass
GetObjectTurnMass = function(obj) end,

---@param obj integer
---@return number pX
---@return number pY
---@return number pZ
GetObjectVelocity = function(obj) end,

---@param obj integer
---@param x number
---@param y number
---@param z number
---@return number pOffX
---@return number pOffY
---@return number pOffZ
GetOffsetFromObjectInWorldCoords = function(obj, x, y, z) end,

---@param objectIndex integer
---@return integer
GetPedObjectIsAttachedTo = function(objectIndex) end,

---@param pickup integer
---@return number pX
---@return number pY
---@return number pZ
GetPickupCoordinates = function(pickup) end,

---@param objectIndex integer
---@return integer roomKey
GetRoomKeyFromObject = function(objectIndex) end,

---@param pickupIndex integer
---@return integer roomKey
GetRoomKeyFromPickup = function(pickupIndex) end,

---@param obj integer
---@return number height
GetRopeHeightForObject = function(obj) end,

---@param x number
---@param y number
---@param z number
---@return number pSafeX
---@return number pSafeY
---@return number pSafeZ
GetSafePickupCoords = function(x, y, z) end,

---@param modelHash integer
---@param x number
---@param y number
---@param z number
---@return integer lockState
---@return number openRatio
---Gets the state of the closest door type.
GetStateOfClosestDoorOfType = function(modelHash, x, y, z) end,

---@param obj integer
---@return integer arg2
---@return integer arg3
---@return integer arg4
GrabEntityOnRopeForObject = function(obj) end,

---@param attribute integer
---@return integer obj
GrabNearbyObjectWithSpecialAttribute = function(attribute) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param modelHash integer
---@param carId integer
---@return boolean
---Checks if the closest object of type has been damaged by a specific car.
HasClosestObjectOfTypeBeenDamagedByCar = function(x, y, z, radius, modelHash, carId) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param modelHash integer
---@param charId integer
---@return boolean
---Checks if the closest object of type has been damaged by a specific character.
HasClosestObjectOfTypeBeenDamagedByChar = function(x, y, z, radius, modelHash, charId) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param modelHash integer
---@return boolean
---This command works in a similar manner to HAS_OBJECT_FRAGMENT_ROOT_BEEN_DAMAGED but first finds the closest object with the given modelHash within the specified range.
HasFragmentRootOfClosestObjectOfTypeBeenDamaged = function(x, y, z, radius, modelHash) end,

---@param obj integer
---@return boolean
HasObjectBeenDamaged = function(obj) end,

---@param obj integer
---@param vehicle integer
---@return boolean
HasObjectBeenDamagedByCar = function(obj, vehicle) end,

---@param obj integer
---@param ped integer
---@return boolean
HasObjectBeenDamagedByChar = function(obj, ped) end,

---@param obj integer
---@return boolean
HasObjectBeenPhotographed = function(obj) end,

---@param obj integer
---@return boolean
HasObjectBeenUprooted = function(obj) end,

---@param obj integer
---@return boolean
HasObjectCollidedWithAnything = function(obj) end,

---@param obj integer
---@return boolean
HasObjectFragmentRootBeenDamaged = function(obj) end,

---@param pickup integer
---@return boolean
HasPickupBeenCollected = function(pickup) end,

---@param x number
---@param y number
---@param z number
---@return boolean
IsAnyPickupAtCoords = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param modelHash integer
---@param isSmashed boolean
---@param isDamaged boolean
---@return boolean
---Gets the closest object (within the defined sphere) with the given modelHash and returns TRUE if it is smashed or damaged.
IsClosestObjectOfTypeSmashedOrDamaged = function(x, y, z, radius, modelHash, isSmashed, isDamaged) end,

---@param x number
---@param y number
---@param z number
---@return boolean
IsMoneyPickupAtCoords = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param modelHash integer
---@return boolean
---Checks whether or not a non-frag object has been smashed.
IsNonFragObjectSmashed = function(x, y, z, radius, modelHash) end,

---@param obj integer
---@return boolean
IsObjectAttached = function(obj) end,

IsObjectInAngledArea2d = function() end,

---@param obj integer
---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@param arg8 number
---@param flag boolean
---@return boolean
IsObjectInAngledArea3d = function(obj, x0, y0, z0, x1, y1, z1, arg8, flag) end,

IsObjectInArea2d = function() end,

---@param obj integer
---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@param flag boolean
---@return boolean
IsObjectInArea3d = function(obj, x0, y0, z0, x1, y1, z1, flag) end,

---@param obj integer
---@return boolean
IsObjectInWater = function(obj) end,

---@param obj integer
---@return boolean
IsObjectOnScreen = function(obj) end,

---@param obj integer
---@param animname0 string
---@param animname1 string
---@return boolean
---@return integer animname0
---@return integer animname1
IsObjectPlayingAnim = function(obj, animname0, animname1) end,

---@param obj integer
---@return boolean
IsObjectStatic = function(obj) end,

---@param obj0 integer
---@param obj1 integer
---@return boolean
IsObjectTouchingObject = function(obj0, obj1) end,

---@param obj integer
---@param angle number
---@return boolean
IsObjectUpright = function(obj, angle) end,

---@param obj integer
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param flag boolean
---@return boolean
LocateObject2d = function(obj, x0, y0, x1, y1, flag) end,

---@param obj integer
---@param x number
---@param y number
---@param z number
---@param xr number
---@param yr number
---@param zr number
---@param flag boolean
---@return boolean
LocateObject3d = function(obj, x, y, z, xr, yr, zr, flag) end,

---@param arg1 integer
---@return boolean
---@return number coords_x
---@return number coords_y
---@return number coords_z
---@return number distance
---@return integer arg4
---@return integer arg5
---@return number arg6
LookAtNearbyEntityWithSpecialAttribute = function(arg1) end,

---@param obj integer
---@param targettable boolean
MakeObjectTargettable = function(obj, targettable) end,

---@param pObj integer
---@return integer pObj
MarkObjectAsNoLongerNeeded = function(pObj) end,

---@param time integer
PickupsPassTime = function(time) end,

---@param obj integer
---@param car integer
---@param x number
---@param y number
---@param z number
PlaceObjectRelativeToCar = function(obj, car, x, y, z) end,

---@param x number
---@param y number
---@param z number
---@return boolean
PlayerIsNearFirstPigeon = function(x, y, z) end,

---@param obj integer
---@param animname0 string
---@param animname1 string
---@param unk number
---@param flag0 boolean
---@param flag1 boolean
---@return boolean
---@return integer animname0
---@return integer animname1
PlayObjectAnim = function(obj, animname0, animname1, unk, flag0, flag1) end,

ReleaseEntityFromRopeForObject = function() end,

---@param type integer
---Remove objects of certain pickup type.
RemoveAllPickupsOfType = function(type) end,

---@param pickup integer
RemovePickup = function(pickup) end,

---@param obj integer
RemoveProjtexFromObject = function(obj) end,

RemoveTemporaryRadarBlipsForPickups = function() end,

---@param value boolean
RenderWeaponPickupsBigger = function(value) end,

ResetArmourPickupNetworkRegenTime = function() end,

ResetHealthPickupNetworkRegenTime = function() end,

ResetMoneyPickupNetworkRegenTime = function() end,

ResetWeaponPickupNetworkRegenTime = function() end,

---@param obj integer
---@param x number
---@param y number
---@param flag boolean
---@return boolean
RotateObject = function(obj, x, y, flag) end,

---@param obj integer
---@param set boolean
SetActivateObjectPhysicsAsSoonAsItIsUnfrozen = function(obj, set) end,

---@param pickuptype integer
---@param set boolean
SetAllPickupsOfTypeCollectableByCar = function(pickuptype, set) end,

---@param set boolean
SetAlwaysDisplayWeaponPickupMessage = function(set) end,

---@param regenTime integer
---Sets the time before a armour pickup respawns in a network games.
SetArmourPickupNetworkRegenTime = function(regenTime) end,

---@param total integer
SetCollectable1Total = function(total) end,

---@param set boolean
SetDeadPedsDropWeapons = function(set) end,

---@param pickup integer
---@param set boolean
SetDoNotSpawnParkedCarsOnTop = function(pickup, set) end,

---@param door integer
---@param flag boolean
---@param arg3 number
SetDoorState = function(door, flag, arg3) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param modelHash integer
---@param newHeading number
---Sets the heading of the closest model of type.
SetHeadingOfClosestObjectOfType = function(x, y, z, radius, modelHash, newHeading) end,

---@param regenTime integer
---Sets the time before a health pickup respawns in a network games.
SetHealthPickupNetworkRegenTime = function(regenTime) end,

---@param set boolean
SetHotWeaponSwap = function(set) end,

---@param obj integer
---@param set boolean
SetLoadCollisionForObjectFlag = function(obj, set) end,

SetMoneyPickupNetworkRegenTime = function() end,

---@param obj integer
---@param alpha integer
SetObjectAlpha = function(obj, alpha) end,

---@param obj integer
---@param animname0 string
---@param animname1 string
---@param time number
---@return integer animname0
---@return integer animname1
SetObjectAnimCurrentTime = function(obj, animname0, animname1, time) end,

---@param obj integer
---@param animname0 string
---@param animname1 string
---@param flag boolean
---@return integer animname0
---@return integer animname1
SetObjectAnimPlayingFlag = function(obj, animname0, animname1, flag) end,

---@param obj integer
---@param animname0 string
---@param animname1 string
---@param speed number
---@return integer animname0
---@return integer animname1
SetObjectAnimSpeed = function(obj, animname0, animname1, speed) end,

---@param obj integer
---@param set boolean
SetObjectAsStealable = function(obj, set) end,

---@param obj integer
---@param set boolean
SetObjectCcd = function(obj, set) end,

---@param obj integer
---@param value boolean
SetObjectCollision = function(obj, value) end,

---@param obj integer
---@param pX number
---@param pY number
---@param pZ number
SetObjectCoordinates = function(obj, pX, pY, pZ) end,

---@param obj integer
---@param set boolean
SetObjectDrawLast = function(obj, set) end,

---@param obj integer
---@param set boolean
SetObjectDynamic = function(obj, set) end,

---@param obj integer
---@param value number
SetObjectHeading = function(obj, value) end,

---@param obj integer
---@param health number
SetObjectHealth = function(obj, health) end,

---@param obj integer
---@param x number
---@param y number
---@param z number
SetObjectInitialRotationVelocity = function(obj, x, y, z) end,

---@param obj integer
---@param x number
---@param y number
---@param z number
SetObjectInitialVelocity = function(obj, x, y, z) end,

---@param obj integer
---@param set boolean
SetObjectInvincible = function(obj, set) end,

---@param obj integer
---@param lights boolean
SetObjectLights = function(obj, lights) end,

---@param obj integer
---@param set boolean
SetObjectOnlyDamagedByPlayer = function(obj, set) end,

---@param objectId integer
---@param mass number
---@param gravityFactor number
---@param translationalDampingX number
---@param translationalDampingY number
---@param translationalDampingZ number
---@param rotationalDampingX number
---@param rotationalDampingY number
---@param rotationalDampingZ number
---@param collisionMargin number
---@param maxAngularSpeed number
---Set physics parameters on this instance of an object.
SetObjectPhysicsParams = function(objectId, mass, gravityFactor, translationalDampingX, translationalDampingY, translationalDampingZ, rotationalDampingX, rotationalDampingY, rotationalDampingZ, collisionMargin, maxAngularSpeed) end,

---@param objectIndex integer
---@param bulletProof boolean
---@param flameProof boolean
---@param explosionProof boolean
---@param collisionProof boolean
---@param meleeWeaponProof boolean
---Sets what immunities the object has.
SetObjectProofs = function(objectIndex, bulletProof, flameProof, explosionProof, collisionProof, meleeWeaponProof) end,

---@param obj integer
---@param arg2 number
---@param arg3 number
---@param arg4 number
---@param arg5 number
SetObjectQuaternion = function(obj, arg2, arg3, arg4, arg5) end,

---@param obj integer
---@param set boolean
SetObjectRecordsCollisions = function(obj, set) end,

---@param obj integer
---@param set boolean
SetObjectRenderScorched = function(obj, set) end,

---@param obj integer
---@param x number
---@param y number
---@param z number
SetObjectRotation = function(obj, x, y, z) end,

---@param obj integer
---@param scale number
SetObjectScale = function(obj, scale) end,

---@param obj integer
---@param value boolean
SetObjectVisible = function(obj, value) end,

---@param pickup integer
---@param set boolean
SetPickupCollectableByCar = function(pickup, set) end,

---@param set boolean
SetPickupsFixCars = function(set) end,

---@param set boolean
SetPlayerCanDropWeaponsInCar = function(set) end,

---@param bValue boolean
SetPlayersDropMoneyInNetworkGame = function(bValue) end,

SetRopeHeightForObject = function() end,

---@param modelHash integer
---@param x number
---@param y number
---@param z number
---@param lockState boolean
---@param openRatio number
---Sets the state of the closest door of type.
SetStateOfClosestDoorOfType = function(modelHash, x, y, z, lockState, openRatio) end,

---@param set boolean
SetSuppressHeadlightSwitch = function(set) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param modelHash integer
---@param usesCollision boolean
---Sets whether the closest object with the given modelHash will have collision or not.
SetUsesCollisionOfClosestObjectOfType = function(x, y, z, radius, modelHash, usesCollision) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param modelHash integer
---@param visibility boolean
---Sets a object of a specific model visible.
SetVisibilityOfClosestObjectOfType = function(x, y, z, radius, modelHash, visibility) end,

---@param attribute integer
---@param set boolean
SetVisibilityOfNearbyEntityWithSpecialAttribute = function(attribute, set) end,

---@param weaponType integer
---@param regenTime integer
---Sets the time before a weapon respawns in a network games.
SetWeaponPickupNetworkRegenTime = function(weaponType, regenTime) end,

---@param obj integer
---@param x number
---@param y number
---@param z number
---@param xs number
---@param ys number
---@param zs number
---@param flag boolean
---@return boolean
SlideObject = function(obj, x, y, z, xs, ys, zs, flag) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param modelHash integer
---@param force number
---@return boolean
---Smashes all of the glass on an object.
SmashGlassOnObject = function(x, y, z, radius, modelHash, force) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param oldModel integer
---@param newModel integer
---Find the nearest building to a point within a radius and change it's model.
SwapNearestBuildingModel = function(x, y, z, radius, oldModel, newModel) end,

---@param on boolean
SwitchArrowAboveBlippedPickups = function(on) end,

---@param obj integer
---@param can boolean
WinchCanPickObjectUp = function(obj, can) end,

ClearShakePlayerpadWhenControllerDisabled = function() end,

---@return integer
GetAcceptButton = function() end,

---@param key integer
---@return boolean
---@return integer arg2
GetAsciiJustPressed = function(key) end,

---@param key integer
---@return boolean
---@return integer arg2
GetAsciiPressed = function(key) end,

---@param key integer
---@return boolean
---@return integer arg2
GetBufferedAscii = function(key) end,

---@param arg1 integer
---@param controlid integer
---@return integer
GetControlValue = function(arg1, controlid) end,

---@return integer arg1
---@return integer arg2
GetKeyboardMoveInput = function() end,

---@return integer
GetMotionControlPreference = function() end,

GetMotionControlsEnabled = function() end,

GetMotionSensorValues = function() end,

---@return integer x
---@return integer y
GetMouseInput = function() end,

---@return number x
---@return number y
---Gets the x, y position of the mouse pointer on the screen. Starting top left 0.0 to bottom right 1.0
GetMousePosition = function() end,

---@return number
GetMouseSensitivity = function() end,

---@return integer arg1
GetMouseWheel = function() end,

GetPadOrientation = function() end,

---@param padNumber integer
---@return boolean
---@return number pitch
---@return number roll
---Returns True/false if motion controls are enabled / disabled.
GetPadPitchRoll = function(padNumber) end,

---@param arg1 integer
---@param arg2 integer
---@return integer arg3
GetPadState = function(arg1, arg2) end,

---@param PadNumber integer
---@return integer ReturnLeftX
---@return integer ReturnLeftY
---@return integer ReturnRightX
---@return integer ReturnRightY
---Gets the position of analogue stickes between -128 and 128. A value of 0 means that the stick is in the central position.
GetPositionOfAnalogueSticks = function(PadNumber) end,

---@return boolean
GetTextInputActive = function() end,

---@param padNumber integer
---@return boolean
---@return integer hasReloaded
---Returns true/false if motion controls are enabled/disabled.
HasReloadedWithMotionControl = function(padNumber) end,

---@return boolean
IsAutoAimingOn = function() end,

---@param padNumber integer
---@param buttonNumber integer
---@return boolean
---Returns TRUE if the specified button on the specified controller is has been pressed this frame.
IsButtonJustPressed = function(padNumber, buttonNumber) end,

---@param padNumber integer
---@param buttonNumber integer
---@return boolean
---Returns TRUE if the specified button on the specified controller is being pressed/used.
IsButtonPressed = function(padNumber, buttonNumber) end,

---@param arg1 integer
---@param controlid integer
---@return boolean
IsControlJustPressed = function(arg1, controlid) end,

---@param arg1 integer
---@param controlid integer
---@return boolean
IsControlPressed = function(arg1, controlid) end,

---@param key integer
---@return boolean
IsGameKeyboardKeyJustPressed = function(key) end,

---@param key integer
---@return boolean
IsGameKeyboardKeyPressed = function(key) end,

---@param arg1 boolean
---@return boolean
IsGameKeyboardNavDownPressed = function(arg1) end,

---@param arg1 boolean
---@return boolean
IsGameKeyboardNavLeftPressed = function(arg1) end,

---@param arg1 boolean
---@return boolean
IsGameKeyboardNavRightPressed = function(arg1) end,

---@param arg1 boolean
---@return boolean
IsGameKeyboardNavUpPressed = function(arg1) end,

---@return boolean
IsInCarFireButtonPressed = function() end,

---@param key integer
---@return boolean
IsKeyboardKeyJustPressed = function(key) end,

---@param key integer
---@return boolean
IsKeyboardKeyPressed = function(key) end,

---@return boolean
IsLookInverted = function() end,

---@param arg1 integer
---@return boolean
IsMouseButtonJustPressed = function(arg1) end,

---@param arg1 integer
---@return boolean
IsMouseButtonPressed = function(arg1) end,

---@return boolean
IsMouseUsingVerticalInversion = function() end,

---@return boolean
IsNumlockEnabled = function() end,

---@return boolean
IsPcUsingJoypad = function() end,

---@return boolean
IsUsingController = function() end,

---This native function doesn't work (nullsub).
SetAllMotionControlPreferencesOnOff = function() end,

---@param set boolean
SetTextInputActive = function(set) end,

---@param arg1 integer
---@param arg2 integer
---@param arg3 integer
ShakePad = function(arg1, arg2, arg3) end,

---@param arg1 integer
---@param arg2 integer
---@param arg3 integer
ShakePadInCutscene = function(arg1, arg2, arg3) end,

ShakePlayerpadWhenControllerDisabled = function() end,

---@return boolean
UsingStandardControls = function() end,

AddAreaToNetworkRestartNodeGroupMapping = function() end,

---@param arg1 integer
AddGroupToNetworkRestartNodeGroupList = function(arg1) end,

---@param x number
---@param y number
---@param z number
---@return integer
AddNavmeshRequiredRegion = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---Spawning will avoid this area, build these as a list each frame, calling FLUSH_ALL_SPAWN_BLOCKING_AREAS before rebuilding the list
AddSpawnBlockingArea = function(x, y, z, radius) end,

---@param x number
---@param y number
---@param z number
---@param arg4 number
---@param arg5 number
AddSpawnBlockingDisc = function(x, y, z, arg4, arg5) end,

---@return boolean
---Returns whether all the requested navmeshes have loaded.
AreAllNavmeshRegionsLoaded = function() end,

CalculateFurthestNetworkRestartNodes = function() end,

---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@return number
CalculateTravelDistanceBetweenNodes = function(x0, y0, z0, x1, y1, z1) end,

ClearNetworkRestartNodeGroupList = function() end,

---@param x number
---@param y number
---@param z number
---@param radius number
DefinePedGenerationConstraintArea = function(x, y, z, radius) end,

DestroyPedGenerationConstraintArea = function() end,

---@param x number
---@param y number
---@param z number
---@return integer hashName1
---@return integer hashName2
---Finds the two nearest nodes that have a road name set up for them.
FindStreetNameAtPosition = function(x, y, z) end,

FlushAllPlayerRespawnCoords = function() end,

FlushAllSpawnBlockingAreas = function() end,

---@param x number
---@param y number
---@param z number
---@return integer direction
---@return number arg5_x
---@return number arg5_y
---@return number arg5_z
GenerateDirections = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
---@return boolean
---@return number outX
---@return number outY
---@return number outZ
---Will return if can the closest car node to a coord.
GetClosestCarNode = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
---@param faceX number
---@param faceY number
---@param faceZ number
---@return boolean
---@return number outX
---@return number outY
---@return number outZ
---@return number outHeading
---Will return if can the closest vehicle node, tries to return a heading which points the car in the right direction to reach face coords.
GetClosestCarNodeFavourDirection = function(x, y, z, faceX, faceY, faceZ) end,

---@param x number
---@param y number
---@param z number
---@return boolean
---@return number outX
---@return number outY
---@return number outZ
---@return number outHeading
---Will return if can the closest car node with a heading, to a coord.
GetClosestCarNodeWithHeading = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
---@return boolean
---@return number outX
---@return number outY
---@return number outZ
---Will return if can the closest car node even if switched off, to a coord.
GetClosestMajorCarNode = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
---@return boolean
---@return number arg4_x
---@return number arg4_y
---@return number arg4_z
---@return number arg5
GetClosestNetworkRestartNode = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
---@param minLength number
---@param minLanes integer
---@return boolean
---@return number southEndNode_x
---@return number southEndNode_y
---@return number southEndNode_z
---@return number northEndNode_x
---@return number northEndNode_y
---@return number northEndNode_z
---@return integer lanesGoingSouth
---@return integer lanesGoingNorth
---@return number centralReservationWidth
---Will return if can the closest road segment of a certein length with a certain number of lanes.
GetClosestRoad = function(x, y, z, minLength, minLanes) end,

GetClosestStraightRoad = function() end,

---@param nodeId integer
---@return number vecReturn_x
---@return number vecReturn_y
---@return number vecReturn_z
---@return number heading
GetCoordinatesForNetworkRestartNode = function(nodeId) end,

GetFurthestNetworkRestartNode = function() end,

---@param x number
---@param y number
---@param z number
---@return boolean
---@return number pX
---@return number pY
---@return number pZ
GetNextClosestCarNode = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
---@return boolean
---@return number pX
---@return number pY
---@return number pZ
---@return number direction
GetNextClosestCarNodeFavourDirection = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
---@return boolean
---@return number pX
---@return number pY
---@return number pZ
---@return number heading
GetNextClosestCarNodeWithHeading = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
---@param island integer
---@return boolean
---@return number nearestNodeX
---@return number nearestNodeY
---@return number nearestNodeZ
---@return number returnHeading
---Will return if can the next closest car node with a heading, to a coord on an island.
GetNextClosestCarNodeWithHeadingOnIsland = function(x, y, z, island) end,

---@param x number
---@param y number
---@param z number
---@param node integer
---@return boolean
---@return number outX
---@return number outY
---@return number outZ
---Will return if can the nth (n = 1 being closest) closest car node, to a coord.
GetNthClosestCarNode = function(x, y, z, node) end,

---@param x number
---@param y number
---@param z number
---@param faceX number
---@param faceY number
---@param faceZ number
---@param node integer
---@return boolean
---@return number nearestNodeCoors_x
---@return number nearestNodeCoors_y
---@return number nearestNodeCoors_z
---@return number heading
---Will return if can the closest car node, tries to return a heading which points the car in the right direction to reach FaceCoors.
GetNthClosestCarNodeFavourDirection = function(x, y, z, faceX, faceY, faceZ, node) end,

---@param x number
---@param y number
---@param z number
---@param nodeNumber integer
---@return boolean
---@return number nodeX
---@return number nodeY
---@return number nodeZ
---@return number heading
---Will return if can the nth (n = 1 being closest) closest car node with a heading, to a coord.
GetNthClosestCarNodeWithHeading = function(x, y, z, nodeNumber) end,

---@param x number
---@param y number
---@param z number
---@param nodeNum integer
---@param island integer
---@return boolean
---@return number nearestNodeX
---@return number nearestNodeY
---@return number nearestNodeZ
---@return number returnHeading
---@return integer numLanes
---Will return if can the nth (n = 1 being closest) closest car node with a heading, to a coord on an island.
GetNthClosestCarNodeWithHeadingOnIsland = function(x, y, z, nodeNum, island) end,

---@param x number
---@param y number
---@param z number
---@param flag0 boolean
---@param flag1 boolean
---@return boolean
---@return number node_x
---@return number node_y
---@return number node_z
---@return number heading
GetNthClosestWaterNodeWithHeading = function(x, y, z, flag0, flag1) end,

GetParkingNodeInArea = function() end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param minLanes integer
---@param avoidDeadEnds boolean
---@param avoidHighways boolean
---@return boolean
---@return number vecReturn_x
---@return number vecReturn_y
---@return number vecReturn_z
---@return integer nodeId
---Will return a random node to satisfy the specified conditions.
GetRandomCarNode = function(x, y, z, radius, minLanes, avoidDeadEnds, avoidHighways) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param minLanes integer
---@param avoidDeadEnds boolean
---@param avoidHighways boolean
---@return boolean
---@return number vecReturn_x
---@return number vecReturn_y
---@return number vecReturn_z
---@return integer nodeId
GetRandomCarNodeIncludeSwitchedOffNodes = function(x, y, z, radius, minLanes, avoidDeadEnds, avoidHighways) end,

---@param x number
---@param y number
---@param z number
---@param range number
---@return boolean
---@return number arg5_x
---@return number arg5_y
---@return number arg5_z
---@return integer nodeIndex
GetRandomNetworkRestartNode = function(x, y, z, range) end,

GetRandomNetworkRestartNodeExcludingGroup = function() end,

GetRandomNetworkRestartNodeOfGroup = function() end,

---@param x number
---@param y number
---@param z number
---@param range number
---@return boolean
---@return number arg5_x
---@return number arg5_y
---@return number arg5_z
---@return integer nodeIndex
GetRandomNetworkRestartNodeUsingGroupList = function(x, y, z, range) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param flag0 boolean
---@param flag1 boolean
---@param flag2 boolean
---@param flag3 boolean
---@return boolean
---@return number pX
---@return number pY
---@return number pZ
---@return number heading
GetRandomWaterNode = function(x, y, z, radius, flag0, flag1, flag2, flag3) end,

---@param x number
---@param y number
---@param z number
---@param onlyOnPavement boolean
---@return boolean
---@return number pSafeX
---@return number pSafeY
---@return number pSafeZ
---Checks to see if it can find a safe bit of ground to place a char.
GetSafePositionForChar = function(x, y, z, onlyOnPavement) end,

---@param x number
---@param y number
---@param z number
---@param arg4 number
---@param playerIndex integer
---@param arg8 integer
---@param arg9 number
---@return boolean
---@return number vecReturn_x
---@return number vecReturn_y
---@return number vecReturn_z
---@return integer nodeId
GetSortedNetworkRestartNode = function(x, y, z, arg4, playerIndex, arg8, arg9) end,

GetSortedNetworkRestartNodeExcludingGroup = function() end,

GetSortedNetworkRestartNodeOfGroup = function() end,

---@param x number
---@param y number
---@param z number
---@param arg4 number
---@param playerIndex integer
---@param arg8 integer
---@param arg9 number
---@return boolean
---@return number vecReturn_x
---@return number vecReturn_y
---@return number vecReturn_z
---@return integer nodeId
GetSortedNetworkRestartNodeUsingGroupList = function(x, y, z, arg4, playerIndex, arg8, arg9) end,

---@param nodeId integer
---@param towardsPosX number
---@param towardsPosY number
---@param towardsPosZ number
---@return number vecReturn_x
---@return number vecReturn_y
---@return number vecReturn_z
---@return number orientation
---Will find the spawn coordinates for a car given a node.
GetSpawnCoordinatesForCarNode = function(nodeId, towardsPosX, towardsPosY, towardsPosZ) end,

---@param requestId integer
---@return boolean
HaveRequestedPathNodesBeenLoaded = function(requestId) end,

---@param set boolean
---@return boolean
---Loads/unloads all path nodes on the map.
LoadAllPathNodes = function(set) end,

---@param minX number
---@param minY number
---@param maxX number
---@param maxY number
---Use to load one additional area of the map.
LoadPathNodesInArea = function(minX, minY, maxX, maxY) end,

---@param x number
---@param y number
---@param z number
MarkRoadNodeAsDontWander = function(x, y, z) end,

---@param playerIndex integer
---@param x number
---@param y number
---@param z number
---Stops peds from spawning nearby this coord instead of the players pos for 3 seconds.
RegisterPlayerRespawnCoords = function(playerIndex, x, y, z) end,

---Allows any nodes loaded by LOAD_PATH_NODES_IN_AREA to be unloaded.
ReleasePathNodes = function() end,

---@param arg1 number
---@param arg2 number
---@return boolean
RemoveNavmeshRequiredRegion = function(arg1, arg2) end,

ResetNetworkRestartNodeGroupMapping = function() end,

---@param ignore boolean
SetIgnoreNoGpsFlag = function(ignore) end,

---@param minX number
---@param minY number
---@param minZ number
---@param maxX number
---@param maxY number
---@param maxZ number
---Switch the ped paths off in the given area.
SwitchPedPathsOff = function(minX, minY, minZ, maxX, maxY, maxZ) end,

---@param minX number
---@param minY number
---@param minZ number
---@param maxX number
---@param maxY number
---@param maxZ number
---Switch the ped paths on in the given area.
SwitchPedPathsOn = function(minX, minY, minZ, maxX, maxY, maxZ) end,

---@param minX number
---@param minY number
---@param minZ number
---@param maxX number
---@param maxY number
---@param maxZ number
---Sets all ped nodes back to their original state. (as per the map data)
SwitchPedRoadsBackToOriginal = function(minX, minY, minZ, maxX, maxY, maxZ) end,

---@param minX number
---@param minY number
---@param minZ number
---@param maxX number
---@param maxY number
---@param maxZ number
---Sets all car nodes back to their original state. (as per the map data).
SwitchRoadsBackToOriginal = function(minX, minY, minZ, maxX, maxY, maxZ) end,

---@param minX number
---@param minY number
---@param minZ number
---@param maxX number
---@param maxY number
---@param maxZ number
---Switch the road node off in the given area.
SwitchRoadsOff = function(minX, minY, minZ, maxX, maxY, maxZ) end,

---@param minX number
---@param minY number
---@param minZ number
---@param maxX number
---@param maxY number
---@param maxZ number
---Switch the road node on in the given area.
SwitchRoadsOn = function(minX, minY, minZ, maxX, maxY, maxZ) end,

UnmarkAllRoadNodesAsDontWander = function() end,

---@param modelHash integer
AddAdditionalPopulationModel = function(modelHash) end,

---@param charId integer
---@param armourToAdd integer
---Increments the characters armour.
AddArmourToChar = function(charId, armourToAdd) end,

---@param decisionMakerIndex integer
---@param eventType integer
---@param eventResponseTaskType integer
---@param friendChance number
---@param threatChance number
---@param playerChance number
---@param otherChance number
---@param inCarFlag boolean
---@param onFootFlag boolean
---Adds a task response to the decision maker for a particular event.
AddCharDecisionMakerEventResponse = function(decisionMakerIndex, eventType, eventResponseTaskType, friendChance, threatChance, playerChance, otherChance, inCarFlag, onFootFlag) end,

---@param decisionMakerIndex integer
---@param eventType integer
---@param eventResponseTaskType integer
---@param friendChance number
---@param threatChance number
---@param playerChance number
---@param otherChance number
---@param inCarFlag boolean
---@param onFootFlag boolean
---Adds a task response to the decision maker for a particular event.
AddGroupDecisionMakerEventResponse = function(decisionMakerIndex, eventType, eventResponseTaskType, friendChance, threatChance, playerChance, otherChance, inCarFlag, onFootFlag) end,

---@param ped integer
---@param arg2 boolean
AddPedToMissionDeletionList = function(ped, arg2) end,

---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
AddScenarioBlockingArea = function(x0, y0, z0, x1, y1, z1) end,

---@param ped integer
---@param allow boolean
AllowAutoConversationLookats = function(ped, allow) end,

---@param value boolean
AllowGangRelationshipsToBeChangedByNextCommand = function(value) end,

---@param ped integer
---@param allow boolean
AllowReactionAnims = function(ped, allow) end,

---@param value boolean
AllowScenarioPedsToBeReturnedByNextCommand = function(value) end,

---@param ped integer
---@param allow boolean
AllowTargetWhenInjured = function(ped, allow) end,

---@param ped integer
---@param use boolean
AlwaysUseHeadOnHornAnimWhenDeadInCar = function(ped, use) end,

---@param charIndex integer
---@param type integer
---@param forceX number
---@param forceY number
---@param forceZ number
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param component integer
---@param localForce boolean
---@param localOffset boolean
---@param scaleByMass boolean
---Apply a force to an char.
ApplyForceToPed = function(charIndex, type, forceX, forceY, forceZ, offsetX, offsetY, offsetZ, component, localForce, localOffset, scaleByMass) end,

---@param ped integer
---@param radius number
---@return boolean
AreAnyCharsNearChar = function(ped, radius) end,

---@param ped integer
---@param x number
---@param y number
---@param z number
---@param radius number
---@return boolean
AreEnemyPedsInArea = function(ped, x, y, z, radius) end,

---@param charIndex integer
---@param carIndex integer
---@param boneIndex integer
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param defaultHeading number
---@param headingLimit number
---@param detachWhenDead boolean
---@param detachWhenRagdoll boolean
---Attaches an ped to an car with a non physical attachement.
AttachPedToCar = function(charIndex, carIndex, boneIndex, offsetX, offsetY, offsetZ, defaultHeading, headingLimit, detachWhenDead, detachWhenRagdoll) end,

AttachPedToCar2 = function() end,

---@param ped integer
---@param car integer
---@param pedbone integer
---@param x number
---@param y number
---@param z number
---@param angle number
---@param arg8 number
---@param arg9 boolean
---@param arg10 boolean
AttachPedToCarPhysically = function(ped, car, pedbone, x, y, z, angle, arg8, arg9, arg10) end,

---@param ped integer
---@param obj integer
---@param pedbone integer
---@param x number
---@param y number
---@param z number
---@param angle number
---@param arg8 number
---@param arg9 boolean
---@param arg10 boolean
AttachPedToObject = function(ped, obj, pedbone, x, y, z, angle, arg8, arg9, arg10) end,

---@param ped integer
---@param obj integer
---@param pedbone integer
---@param x number
---@param y number
---@param z number
---@param angle number
---@param arg8 number
---@param arg9 boolean
---@param arg10 boolean
AttachPedToObjectPhysically = function(ped, obj, pedbone, x, y, z, angle, arg8, arg9, arg10) end,

AttachPedToWorldPhysically = function() end,

BeginCharSearchCriteria = function() end,

---@param ped integer
---@param AnimName0 string
---@param AnimName1 string
---@param arg4 integer
---@param x number
---@param y number
---@param z number
---@return integer AnimName0
---@return integer AnimName1
BlendFromNmWithAnim = function(ped, AnimName0, AnimName1, arg4, x, y, z) end,

---@param ped integer
BlendOutCharMoveAnims = function(ped) end,

---@param ped integer
---@param block boolean
BlockCharAmbientAnims = function(ped, block) end,

---@param ped integer
---@param value boolean
BlockCharGestureAnims = function(ped, value) end,

---@param ped integer
---@param block boolean
BlockCharHeadIk = function(ped, block) end,

---@param ped integer
---@param block boolean
BlockCharVisemeAnims = function(ped, block) end,

---@param ped integer
---@param set boolean
BlockCoweringInCover = function(ped, set) end,

---@param ped integer
---@param value boolean
BlockPedWeaponSwitching = function(ped, value) end,

---@param ped integer
---@param set boolean
BlockPeekingInCover = function(ped, set) end,

---@param ped integer
---@param pednext integer
---@return boolean
CanCharSeeDeadChar = function(ped, pednext) end,

---@param male boolean
---@param female boolean
---@return boolean
---Call this before trying to create a ped with a random model, to ensure that a model is available.
CanCreateRandomChar = function(male, female) end,

---@param ped integer
---@param id integer
---@param arg3 boolean
---@return boolean
CheckNmFeedback = function(ped, id, arg3) end,

---@param ped integer
ClearAllCharProps = function(ped) end,

---@param ped integer
---@param relgroup integer
ClearAllCharRelationships = function(ped, relgroup) end,

---@param ped integer
ClearCharLastDamageBone = function(ped) end,

---@param ped integer
ClearCharLastDamageEntity = function(ped) end,

---@param charIndex integer
---@param position integer
---Clear the prop slot for the given chat at the given position.
ClearCharProp = function(charIndex, position) end,

---@param ped integer
---@param reltype integer
---@param relgroup integer
ClearCharRelationship = function(ped, reltype, relgroup) end,

---@param dm integer
---@param eventid integer
ClearGroupDecisionMakerEventResponse = function(dm, eventid) end,

ClearPedNonCreationArea = function() end,

ClearPedNonRemovalArea = function() end,

---@param arg1 integer
---@param arg2 integer
---@param arg3 integer
ClearRelationship = function(arg1, arg2, arg3) end,

---@param charIndex integer
ClearRoomForChar = function(charIndex) end,

---@param ped integer
ClearRoomForDummyChar = function(ped) end,

ClearScriptedConversionCentre = function() end,

---@param ped integer
---@param pednext integer
---@param speed number
CopyAnimations = function(ped, pednext, speed) end,

---@param sourceDecisionMaker integer
---@return integer decisionMaker
---Creates a copy of a already loaded decision maker.
CopyCharDecisionMaker = function(sourceDecisionMaker) end,

---@param type integer
---@return integer pDM
CopyCombatDecisionMaker = function(type) end,

---@param type integer
---@return integer pDM
CopyGroupCharDecisionMaker = function(type) end,

---@param type integer
---@return integer pDM
CopyGroupCombatDecisionMaker = function(type) end,

---@param type integer
---@return integer pDM
CopySharedCharDecisionMaker = function(type) end,

---@param type integer
---@return integer pDM
CopySharedCombatDecisionMaker = function(type) end,

---@param charType integer
---@param modelHashKey integer
---@param x number
---@param y number
---@param z number
---@param registerAsNetworkObject boolean
---@return integer charIndex
---Creates a char on foot at the specified coords.
CreateChar = function(charType, modelHashKey, x, y, z, registerAsNetworkObject) end,

---@param vehicleIndex integer
---@param charType integer
---@param modelHashKey integer
---@param passengerIndex integer
---@return integer charIndex
CreateCharAsPassenger = function(vehicleIndex, charType, modelHashKey, passengerIndex) end,

---@param vehicleIndex integer
---@param charType integer
---@param modelHashKey integer
---@return integer charIndex
CreateCharInsideCar = function(vehicleIndex, charType, modelHashKey) end,

CreateDummyChar = function() end,

---@param arg1 integer
---@param arg3 boolean
---@return integer groupIndex
---Creates a group.
CreateGroup = function(arg1, arg3) end,

---@param arg1 boolean
---@param id integer
CreateNmMessage = function(arg1, id) end,

---@param x number
---@param y number
---@param z number
---@return integer pPed
CreateRandomChar = function(x, y, z) end,

---@param vehicle integer
---@return integer pPed
CreateRandomCharAsDriver = function(vehicle) end,

---@param carId integer
---@param seat integer
---@return integer charId
CreateRandomCharAsPassenger = function(carId, seat) end,

---@param x number
---@param y number
---@param z number
---@return integer pPed
CreateRandomFemaleChar = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
---@return integer pPed
CreateRandomMaleChar = function(x, y, z) end,

---@param charIndex integer
---@param damage integer
---@param damageArmourFlag boolean
---Applies damage to the char, can apply to the body armour as well.
DamageChar = function(charIndex, damage, damageArmourFlag) end,

---@param charId integer
---@param part integer
---@param hitPoints integer
DamagePedBodyPart = function(charId, part, hitPoints) end,

---@param pPed integer
---@return integer pPed
DeleteChar = function(pPed) end,

DeleteDummyChar = function() end,

---@param charIndex integer
---@param noCollisionUntilClear boolean
---Detaches an char from being attached.
DetachPed = function(charIndex, noCollisionUntilClear) end,

---@param charIndex integer
---@param noCollisionUntilClear boolean
DetachPedFromWithinCar = function(charIndex, noCollisionUntilClear) end,

---@param ped integer
---@param disable boolean
DisablePlayerAutoVehicleExit = function(ped, disable) end,

---@param ped integer
---@return boolean
DoesCharExist = function(ped) end,

---@param dm integer
---@return boolean
DoesDecisionMakerExist = function(dm) end,

---@param group integer
---@return boolean
DoesGroupExist = function(group) end,

---@param ped integer
DontRemoveChar = function(ped) end,

DontSuppressAnyPedModels = function() end,

---@param modelHash integer
DontSuppressPedModel = function(modelHash) end,

---@param enable boolean
EnableAllPedHelmets = function(enable) end,

---@param ped integer
---@param enable boolean
EnablePedHelmet = function(ped, enable) end,

EndCharSearchCriteria = function() end,

---@param ped integer
ExplodeCharHead = function(ped) end,

---@param ped integer
---@param x number
---@param y number
---@param z number
FirePedWeapon = function(ped, x, y, z) end,

FlushScenarioBlockingAreas = function() end,

---@param charId integer
---@param pinned boolean
---@param time integer
---Sets the character to be pinned down for time in milliseconds.
ForcePedPinnedDown = function(charId, pinned, time) end,

---@param ped integer
---@param vehicle integer
ForcePedToFleeWhilstDrivingVehicle = function(ped, vehicle) end,

---@param ped integer
---@param force boolean
ForcePedToLoadCover = function(ped, force) end,

---@param type integer
ForceRandomPedType = function(type) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param arg5 integer
ForceSpawnScenarioPedsInArea = function(x, y, z, radius, arg5) end,

---@param ped integer
---@param frozen boolean
FreezeCharPosition = function(ped, frozen) end,

---@param ped integer
---@param frozen boolean
FreezeCharPositionAndDontLoadCollision = function(ped, frozen) end,

---@param ped integer
---@return string
GetAnimGroupFromChar = function(ped) end,

---@param ped integer
---@return integer pVehicle
GetCarCharIsUsing = function(ped) end,

---@param ped integer
---@return boolean
GetCharAllowedToRunOnBoats = function(ped) end,

---@param ped integer
---@param AnimName0 string
---@param AnimName1 string
---@return integer AnimName0
---@return integer AnimName1
---@return number amount
GetCharAnimBlendAmount = function(ped, AnimName0, AnimName1) end,

---@param ped integer
---@param animGroup string
---@param animName string
---@return integer animGroup
---@return integer animName
---@return number pValue
GetCharAnimCurrentTime = function(ped, animGroup, animName) end,

GetCharAnimEventTime = function() end,

---@param ped integer
---@param AnimName0 string
---@param AnimName1 string
---@param flag boolean
---@return boolean
---@return integer AnimName0
---@return integer AnimName1
GetCharAnimIsEvent = function(ped, AnimName0, AnimName1, flag) end,

---@param ped integer
---@param animGroup string
---@param animName string
---@return integer animGroup
---@return integer animName
---@return number pValue
GetCharAnimTotalTime = function(ped, animGroup, animName) end,

GetCharAreaVisible = function() end,

---@param charId integer
---@return integer armour
---Get the characters current armour.
GetCharArmour = function(charId) end,

---@param charIndex integer
---@return number pX
---@return number pY
---@return number pZ
GetCharCoordinates = function(charIndex) end,

---@param charId integer
---@param componentNumber integer
---@return integer
---Gets the index of the current drawable for the specified part of the character's body (component).
GetCharDrawableVariation = function(charId, componentNumber) end,

---@param charIndex integer
---@param worldspace boolean
---@return number x
---@return number y
---@return number z
---Gets the displacement (in meters) that will be applied to the given char this frame.
---
---If worldspace is set to TRUE the result will be in world coordinates (absolute worldspace). If worldspace is set to FALSE the result will be in local coordinates (relative to the character).
GetCharExtractedDisplacement = function(charIndex, worldspace) end,

---@param ped integer
---@param arg2 boolean
---@return number x
---@return number y
---@return number z
GetCharExtractedVelocity = function(ped, arg2) end,

---@param ped integer
---@return integer
GetCharGravity = function(ped) end,

---@param ped integer
---@return number pValue
GetCharHeading = function(ped) end,

---@param charId integer
---@return integer health
GetCharHealth = function(charId) end,

---@param charIndex integer
---@return number height
---Gets the char's height above the ground.
GetCharHeightAboveGround = function(charIndex) end,

---@param ped integer
---@return integer event
GetCharHighestPriorityEvent = function(ped) end,

---@param charIndex integer
---@return boolean
---@return integer pBone
---Gets the bone that took the last piece of damage.
GetCharLastDamageBone = function(charIndex) end,

---@param ped integer
---@return number
GetCharMaxMoveBlendRatio = function(ped) end,

---@param ped integer
---@return boolean
GetCharMeleeActionFlag0 = function(ped) end,

---@param ped integer
---@return boolean
GetCharMeleeActionFlag1 = function(ped) end,

---@param ped integer
---@return boolean
GetCharMeleeActionFlag2 = function(ped) end,

---@param charIndex integer
---@return integer modelHashKey
---Get the model hash for the char.
GetCharModel = function(charIndex) end,

---@param charId integer
---@return integer
---Gets the char current money.
GetCharMoney = function(charId) end,

---@param ped integer
---@return number multiplier
GetCharMoveAnimSpeedMultiplier = function(ped) end,

---@param ped integer
---@return boolean
GetCharMovementAnimsBlocked = function(ped) end,

---@param charIndex integer
---@param position integer
---@return integer propIndex
---Get the id of the prop which has been assigned at the given position for the given char.
GetCharPropIndex = function(charIndex, position) end,

---@param ped integer
---@return boolean
GetCharReadyToBeExecuted = function(ped) end,

---@param ped integer
---@return boolean
GetCharReadyToBeStunned = function(ped) end,

---@param ped integer
---@return number pValue
GetCharSpeed = function(ped) end,

---@param ped integer
---@return boolean
---@return integer state
GetCharSwimState = function(ped) end,

---@param charIndex integer
---@param componentNumber integer
---@return integer
---Gets the index of the current texture variation for the specified char component (part of the body).
GetCharTextureVariation = function(charIndex, componentNumber) end,

---@param charIndex integer
---@return number pX
---@return number pY
---@return number pZ
---Gets the current velocity of the char.
GetCharVelocity = function(charIndex) end,

---@param ped integer
---@return boolean
GetCharWalkAlongsideLeaderWhenAppropriate = function(ped) end,

---@param ped integer
---@return boolean
GetCharWillCowerInsteadOfFleeing = function(ped) end,

---@param ped integer
---@return boolean
GetCharWillTryToLeaveBoatAfterLeader = function(ped) end,

---@param ped integer
---@return boolean
GetCharWillTryToLeaveWater = function(ped) end,

---@param centreX number
---@param centreY number
---@param centreZ number
---@param radius number
---@param scanRandomPeds boolean
---@param scanMissionPeds boolean
---@return boolean
---@return integer charIndex
---Trys to get closest random char to a coord.
GetClosestChar = function(centreX, centreY, centreZ, radius, scanRandomPeds, scanMissionPeds) end,

---@return boolean
GetCreateRandomCops = function() end,

---@return integer modelHash
---Gets the current model as used by the game, ignores wanted level.
GetCurrentBasicCopModel = function() end,

---@return integer modelHash
---Returns the current model as used by the game.
GetCurrentCopModel = function() end,

---@param charIndex integer
---@param part integer
---@return integer
GetDamageToPedBodyPart = function(charIndex, part) end,

---@param charIndex integer
---@return number pX
---@return number pY
---@return number pZ
GetDeadCharCoordinates = function(charIndex) end,

---@param ped integer
---@return number pX
---@return number pY
---@return number pZ
GetDeadCharPickupCoords = function(ped) end,

---@param ped integer
---@return boolean
GetGroupCharDucksWhenAimedAt = function(ped) end,

---@param group integer
---@return integer formation
GetGroupFormation = function(group) end,

---@param group integer
---@return number spacing
GetGroupFormationSpacing = function(group) end,

---@param group integer
---@return integer pPed
GetGroupLeader = function(group) end,

---@param groupIndex integer
---@param memberNumber integer
---@return integer charIndex
---Gets the charIndex from the group member.
GetGroupMember = function(groupIndex, memberNumber) end,

---@param groupIndex integer
---@return integer hasLeader
---@return integer numberOfFollowers
---Gets the number of leaders (1 or 0) and the number of followers (in the range 0-7) that are in the relevant group.
GetGroupSize = function(groupIndex) end,

---@param ped integer
---@return integer pInterior
GetInteriorFromChar = function(ped) end,

GetInteriorFromDummyChar = function() end,

---@param charIndex integer
---@return integer roomKey
GetKeyForCharInRoom = function(charIndex) end,

---@param ped integer
---@return integer room
GetKeyForDummyCharInRoom = function(ped) end,

---@param charIndex integer
---@return integer
GetModelPedIsHolding = function(charIndex) end,

---@param group integer
---@param n integer
---@return integer ped
GetNthGroupMember = function(group, n) end,

---@param charIndex integer
---@param componentNumber integer
---@return integer
---Gets the total number of different drawables for the specified part of the char's body (component).
GetNumberOfCharDrawableVariations = function(charIndex, componentNumber) end,

---@param charIndex integer
---@param componentNumber integer
---@param drawableNumber integer
---@return integer
---Gets the total number of different textures for the specified drawable for the component (body part) for the char's model.
GetNumberOfCharTextureVariations = function(charIndex, componentNumber, drawableNumber) end,

---@param ped integer
---@return integer followers
GetNumberOfFollowers = function(ped) end,

---@param charIndex integer
---@return integer
GetObjectPedIsHolding = function(charIndex) end,

---@param ped integer
---@param x number
---@param y number
---@param z number
---@return number pOffX
---@return number pOffY
---@return number pOffZ
GetOffsetFromCharInWorldCoords = function(ped, x, y, z) end,

---@param charIndex integer
---@param bone integer
---@param x number
---@param y number
---@param z number
---@return number pPosition_x
---@return number pPosition_y
---@return number pPosition_z
GetPedBonePosition = function(charIndex, bone, x, y, z) end,

---@param charIndex integer
---@return integer groupIndex
---Get the group index form the ped.
GetPedGroupIndex = function(charIndex) end,

---@param ped integer
---@return boolean
GetPedSteersAroundObjects = function(ped) end,

---@param ped integer
---@return boolean
GetPedSteersAroundPeds = function(ped) end,

---@param charIndex integer
---@return integer type
---Returns the type of the char.
GetPedType = function(charIndex) end,

---@param x number
---@param y number
---@param z number
---@param sx number
---@param sy number
---@param sz number
---@return integer pPed
GetRandomCharInAreaOffsetNoSave = function(x, y, z, sx, sy, sz) end,

---@param charIndex integer
---@param modelHash integer
GivePedAmbientObject = function(charIndex, modelHash) end,

---@param ped integer
---@param name string
---@param r integer
---@param g integer
---@param b integer
---@param a integer
---@return integer name
GivePedFakeNetworkName = function(ped, name, r, g, b, a) end,

---@param ped integer
GivePedHelmet = function(ped) end,

---@param ped integer
---@param arg2 boolean
GivePedHelmetWithOpts = function(ped, arg2) end,

---@param ped integer
---@param obj integer
---@param flag boolean
GivePedPickupObject = function(ped, obj, flag) end,

---@param ped integer
---@param AnimName0 string
---@param AnimName1 string
---@return boolean
---@return integer AnimName0
---@return integer AnimName1
HasCharAnimFinished = function(ped, AnimName0, AnimName1) end,

---@param ped integer
---@return boolean
HasCharBeenArrested = function(ped) end,

---@param ped integer
---@param vehicle integer
---@return boolean
HasCharBeenDamagedByCar = function(ped, vehicle) end,

---@param charIndex integer
---@param damagerCharIndex integer
---@param checkDamagerVehicle boolean
---@return boolean
---Returns TRUE if the last thing to damage the given char was the given damager char.
HasCharBeenDamagedByChar = function(charIndex, damagerCharIndex, checkDamagerVehicle) end,

---@param ped integer
---@return boolean
HasCharBeenPhotographed = function(ped) end,

---@param ped integer
---@param otherChar integer
---@return boolean
HasCharSpottedChar = function(ped, otherChar) end,

---@param ped integer
---@param otherChar integer
---@return boolean
HasCharSpottedCharInFront = function(ped, otherChar) end,

---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@param flag boolean
---@return boolean
IsAnyCharShootingInArea = function(x0, y0, z0, x1, y1, z1, flag) end,

---@param ped integer
---@return boolean
IsCharDead = function(ped) end,

---@param ped integer
---@return boolean
IsCharDucking = function(ped) end,

---@param ped integer
---@param otherChar integer
---@param angle number
---@return boolean
IsCharFacingChar = function(ped, otherChar, angle) end,

---@param ped integer
---@return boolean
IsCharFatallyInjured = function(ped) end,

---@param ped integer
---@return boolean
IsCharGesturing = function(ped) end,

---@param ped integer
---@return boolean
IsCharGettingInToACar = function(ped) end,

---@param charIndex integer
---@param health integer
---@return boolean
IsCharHealthGreater = function(charIndex, health) end,

---@param ped integer
---@return boolean
IsCharInAir = function(ped) end,

---@param charIndex integer
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param areaWidth number
---@param highlightArea boolean
---@return boolean
---Checks if the character is within the angled 2D area.
IsCharInAngledArea2d = function(charIndex, x1, y1, x2, y2, areaWidth, highlightArea) end,

---@param charIndex integer
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param areaWidth number
---@param highlightArea boolean
---@return boolean
---Checks if the character is within the angled 3D area.
IsCharInAngledArea3d = function(charIndex, x1, y1, z1, x2, y2, z2, areaWidth, highlightArea) end,

---@param ped integer
---@return boolean
IsCharInAnyBoat = function(ped) end,

---@param ped integer
---@return boolean
IsCharInAnyCar = function(ped) end,

---@param ped integer
---@return boolean
IsCharInAnyHeli = function(ped) end,

---@param ped integer
---@return boolean
IsCharInAnyPlane = function(ped) end,

---@param ped integer
---@return boolean
IsCharInAnyPoliceVehicle = function(ped) end,

---@param ped integer
---@return boolean
IsCharInAnyTrain = function(ped) end,

---@param charIndex integer
---@param minX number
---@param minY number
---@param maxX number
---@param maxY number
---@param highlightArea boolean
---@return boolean
---Returns true if the character is within the specified 2D area.
IsCharInArea2d = function(charIndex, minX, minY, maxX, maxY, highlightArea) end,

---@param charIndex integer
---@param minX number
---@param minY number
---@param minZ number
---@param maxX number
---@param maxY number
---@param maxZ number
---@param highlightArea boolean
---@return boolean
---Returns true if the character is within the specified 3D area.
IsCharInArea3d = function(charIndex, minX, minY, minZ, maxX, maxY, maxZ, highlightArea) end,

---@param charIndex integer
---@param minX number
---@param minY number
---@param maxX number
---@param maxY number
---@param highlightArea boolean
---@return boolean
---Returns true if the character is within the specified 2D area on foot.
IsCharInAreaOnFoot2d = function(charIndex, minX, minY, maxX, maxY, highlightArea) end,

---@param ped integer
---@param vehicle integer
---@return boolean
IsCharInCar = function(ped, vehicle) end,

---@param ped integer
---@return boolean
IsCharInFlyingVehicle = function(ped) end,

---@param ped integer
---@return boolean
IsCharInjured = function(ped) end,

---@param ped integer
---@return boolean
IsCharInMeleeCombat = function(ped) end,

---@param charIndex integer
---@param modelHashKey integer
---@return boolean
---Checks the char is in the specified model.
IsCharInModel = function(charIndex, modelHashKey) end,

---@param ped integer
---@return boolean
IsCharInTaxi = function(ped) end,

---@param ped integer
---@return boolean
IsCharInWater = function(ped) end,

---@param ped integer
---@param zonename string
---@return boolean
---@return integer zonename
IsCharInZone = function(ped, zonename) end,

---@param ped integer
---@return boolean
IsCharMale = function(ped) end,

---@param charIndex integer
---@param modelHasKey integer
---@return boolean
---Checks that the char is a specific model.
IsCharModel = function(charIndex, modelHasKey) end,

---@param ped integer
---@return boolean
IsCharOnAnyBike = function(ped) end,

---@param ped integer
---@return boolean
IsCharOnFoot = function(ped) end,

---@param ped integer
---@return boolean
IsCharOnScreen = function(ped) end,

---@param ped integer
---@param animSet string
---@param animName string
---@return boolean
---@return integer animSet
---@return integer animName
IsCharPlayingAnim = function(ped, animSet, animName) end,

---@param ped integer
---@return boolean
IsCharRespondingToAnyEvent = function(ped) end,

---@param ped integer
---@param eventid integer
---@return boolean
IsCharRespondingToEvent = function(ped, eventid) end,

---@param ped integer
---@return boolean
IsCharShooting = function(ped) end,

---@param charIndex integer
---@param minX number
---@param minY number
---@param maxX number
---@param maxY number
---@param highlightArea boolean
---@return boolean
---Checks that a character is shooting in an area.
IsCharShootingInArea = function(charIndex, minX, minY, maxX, maxY, highlightArea) end,

---@param ped integer
---@return boolean
IsCharSittingInAnyCar = function(ped) end,

---@param ped integer
---@param vehicle integer
---@return boolean
IsCharSittingInCar = function(ped, vehicle) end,

---@param ped integer
---@return boolean
IsCharStopped = function(ped) end,

---@param ped integer
---@return boolean
IsCharStuckUnderCar = function(ped) end,

---@param ped integer
---@return boolean
IsCharSwimming = function(ped) end,

---@param ped integer
---@param otherChar integer
---@return boolean
IsCharTouchingChar = function(ped, otherChar) end,

---@param ped integer
---@param obj integer
---@return boolean
IsCharTouchingObject = function(ped, obj) end,

---@param ped integer
---@param obj integer
---@return boolean
IsCharTouchingObjectOnFoot = function(ped, obj) end,

---@param ped integer
---@param vehicle integer
---@return boolean
IsCharTouchingVehicle = function(ped, vehicle) end,

---@param ped integer
---@return boolean
IsCharTryingToEnterALockedCar = function(ped) end,

---@param ped integer
---@return boolean
IsCharUsingAnyScenario = function(ped) end,

---@param ped integer
---@param scenarioName string
---@return boolean
---@return integer scenarioName
IsCharUsingScenario = function(ped, scenarioName) end,

---@param ped integer
---@return boolean
IsCharVisible = function(ped) end,

---@param ped integer
---@return boolean
IsCharWaitingForWorldCollision = function(ped) end,

---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@return boolean
IsCopPedInArea3dNoSave = function(x0, y0, z0, x1, y1, z1) end,

---@param ped integer
---@param group integer
---@return boolean
IsGroupLeader = function(ped, group) end,

---@param ped integer
---@param g integer
---@return boolean
IsGroupMember = function(ped, g) end,

---@param ped integer
---@return boolean
IsPedAMissionPed = function(ped) end,

---@param ped integer
---@return boolean
IsPedAttachedToAnyCar = function(ped) end,

---@param ped integer
---@param obj integer
---@return boolean
IsPedAttachedToObject = function(ped, obj) end,

---@param ped integer
---@return boolean
IsPedBeingJacked = function(ped) end,

---@param ped integer
---@return boolean
IsPedClimbing = function(ped) end,

---@param ped integer
---@return boolean
IsPedDoingDriveby = function(ped) end,

---@param ped integer
---@return boolean
IsPedFleeing = function(ped) end,

---@param ped integer
---@return boolean
IsPedHoldingAnObject = function(ped) end,

---@param ped integer
---@return boolean
IsPedInCombat = function(ped) end,

---@param ped integer
---@return boolean
IsPedInCover = function(ped) end,

---@param ped integer
---@return boolean
IsPedInGroup = function(ped) end,

---@param ped integer
---@return boolean
IsPedJacking = function(ped) end,

---@param ped integer
---@param car integer
---@return boolean
IsPedLookingAtCar = function(ped, car) end,

---@param ped integer
---@param obj integer
---@return boolean
IsPedLookingAtObject = function(ped, obj) end,

---@param ped integer
---@param otherChar integer
---@return boolean
IsPedLookingAtPed = function(ped, otherChar) end,

---@param ped integer
---@return boolean
IsPedPinnedDown = function(ped) end,

---@param charIndex integer
---@return boolean
---Is ped a ragdoll.
IsPedRagdoll = function(charIndex) end,

---@param charIndex integer
---@return boolean
IsPedRetreating = function(charIndex) end,

---@param ped integer
---@return boolean
IsPedsVehicleHot = function(ped) end,

---@return boolean
IsPlayerBeingArrested = function() end,

---@param arg1 integer
---@param arg2 integer
---@param arg3 integer
---@return boolean
IsRelationshipSet = function(arg1, arg2, arg3) end,

---@param vehicle integer
KnockPedOffBike = function(vehicle) end,

---@param ped integer
---@param set boolean
ListenToPlayerGroupCommands = function(ped, set) end,

---@param type integer
---@return integer decisionMakerIndex
LoadCharDecisionMaker = function(type) end,

---@param type integer
---@return integer pDM
LoadCombatDecisionMaker = function(type) end,

---@param ped integer
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param flag boolean
---@return boolean
LocateCharAnyMeans2d = function(ped, x0, y0, x1, y1, flag) end,

---@param ped integer
---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@param flag boolean
---@return boolean
LocateCharAnyMeans3d = function(ped, x0, y0, z0, x1, y1, z1, flag) end,

---@param ped integer
---@param car integer
---@param x number
---@param y number
---@param flag boolean
---@return boolean
LocateCharAnyMeansCar2d = function(ped, car, x, y, flag) end,

---@param ped integer
---@param car integer
---@param x number
---@param y number
---@param z number
---@param flag boolean
---@return boolean
LocateCharAnyMeansCar3d = function(ped, car, x, y, z, flag) end,

---@param ped integer
---@param pednext integer
---@param x number
---@param y number
---@param flag boolean
---@return boolean
LocateCharAnyMeansChar2d = function(ped, pednext, x, y, flag) end,

---@param ped integer
---@param pednext integer
---@param x number
---@param y number
---@param z number
---@param flag boolean
---@return boolean
LocateCharAnyMeansChar3d = function(ped, pednext, x, y, z, flag) end,

---@param ped integer
---@param obj integer
---@param x number
---@param y number
---@param flag boolean
---@return boolean
LocateCharAnyMeansObject2d = function(ped, obj, x, y, flag) end,

---@param ped integer
---@param obj integer
---@param x number
---@param y number
---@param z number
---@param flag boolean
---@return boolean
LocateCharAnyMeansObject3d = function(ped, obj, x, y, z, flag) end,

---@param ped integer
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param flag boolean
---@return boolean
LocateCharInCar2d = function(ped, x0, y0, x1, y1, flag) end,

---@param ped integer
---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z number
---@param flag boolean
---@return boolean
LocateCharInCar3d = function(ped, x0, y0, z0, x1, y1, z, flag) end,

---@param ped integer
---@param car integer
---@param x number
---@param y number
---@param flag boolean
---@return boolean
LocateCharInCarCar2d = function(ped, car, x, y, flag) end,

---@param ped integer
---@param car integer
---@param x number
---@param y number
---@param z number
---@param flag boolean
---@return boolean
LocateCharInCarCar3d = function(ped, car, x, y, z, flag) end,

---@param ped integer
---@param pednext integer
---@param x number
---@param y number
---@param flag boolean
---@return boolean
LocateCharInCarChar2d = function(ped, pednext, x, y, flag) end,

---@param ped integer
---@param pednext integer
---@param x number
---@param y number
---@param z number
---@param flag boolean
---@return boolean
LocateCharInCarChar3d = function(ped, pednext, x, y, z, flag) end,

---@param ped integer
---@param obj integer
---@param x number
---@param y number
---@param flag boolean
---@return boolean
LocateCharInCarObject2d = function(ped, obj, x, y, flag) end,

---@param ped integer
---@param obj integer
---@param x number
---@param y number
---@param z number
---@param flag boolean
---@return boolean
LocateCharInCarObject3d = function(ped, obj, x, y, z, flag) end,

---@param ped integer
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param flag boolean
---@return boolean
LocateCharOnFoot2d = function(ped, x0, y0, x1, y1, flag) end,

---@param ped integer
---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@param flag boolean
---@return boolean
LocateCharOnFoot3d = function(ped, x0, y0, z0, x1, y1, z1, flag) end,

---@param ped integer
---@param car integer
---@param x number
---@param y number
---@param flag boolean
---@return boolean
LocateCharOnFootCar2d = function(ped, car, x, y, flag) end,

---@param ped integer
---@param car integer
---@param x number
---@param y number
---@param z number
---@param flag boolean
---@return boolean
LocateCharOnFootCar3d = function(ped, car, x, y, z, flag) end,

---@param ped integer
---@param pednext integer
---@param x number
---@param y number
---@param flag boolean
---@return boolean
LocateCharOnFootChar2d = function(ped, pednext, x, y, flag) end,

---@param ped integer
---@param pednext integer
---@param x number
---@param y number
---@param z number
---@param flag boolean
---@return boolean
LocateCharOnFootChar3d = function(ped, pednext, x, y, z, flag) end,

---@param ped integer
---@param obj integer
---@param x number
---@param y number
---@param flag boolean
---@return boolean
LocateCharOnFootObject2d = function(ped, obj, x, y, flag) end,

---@param ped integer
---@param obj integer
---@param x number
---@param y number
---@param z number
---@param flag boolean
---@return boolean
LocateCharOnFootObject3d = function(ped, obj, x, y, z, flag) end,

---@param pPed integer
---@return integer pPed
MarkCharAsNoLongerNeeded = function(pPed) end,

---@param ped integer
---@param id integer
---@return integer
MpGetAmountOfAnchorPoints = function(ped, id) end,

---@param ped integer
---@param componentid integer
---@return integer
MpGetAmountOfVariationComponent = function(ped, componentid) end,

---@param prefid integer
---@return integer
MpGetPreferenceValue = function(prefid) end,

---@param ped integer
---@param arg2 integer
---@param arg3 integer
---@param arg4 integer
---@param arg5 integer
---@return integer
MpGetPropSetup = function(ped, arg2, arg3, arg4, arg5) end,

---@param ped integer
---@param arg2 integer
---@param arg3 integer
---@param arg4 integer
---@param arg5 integer
---@return integer
MpGetVariationSetup = function(ped, arg2, arg3, arg4, arg5) end,

---@param prefid integer
---@param value integer
MpSetPreferenceValue = function(prefid, value) end,

---@param ped integer
---@param radius number
RegisterHatedTargetsAroundPed = function(ped, radius) end,

---@param arg1 integer
---@param x number
---@param y number
---@param z number
---@param radius number
RegisterHatedTargetsInArea = function(arg1, x, y, z, radius) end,

---@param ped integer
---@param target integer
RegisterTarget = function(ped, target) end,

---@param modelHash integer
RemoveAdditionalPopulationModel = function(modelHash) end,

RemoveAllInactiveGroupsFromCleanupList = function() end,

---@param ped integer
RemoveCharDefensiveArea = function(ped) end,

---@param ped integer
RemoveCharElegantly = function(ped) end,

---@param ped integer
---@param car integer
RemoveCharFromCarMaintainPosition = function(ped, car) end,

---@param ped integer
RemoveCharFromGroup = function(ped) end,

---@param dm integer
RemoveDecisionMaker = function(dm) end,

---@param ped integer
RemoveFakeNetworkNameFromPed = function(ped) end,

---@param group integer
RemoveGroup = function(group) end,

---@param ped integer
---@param removed boolean
RemovePedHelmet = function(ped, removed) end,

---@param ped integer
ResetVisiblePedDamage = function(ped) end,

---@param ped integer
ReviveInjuredPed = function(ped) end,

---@param flagid integer
SearchCriteriaConsiderPedsWithFlagFalse = function(flagid) end,

---@param flag integer
---Sets which random peds will be selected by the search.
SearchCriteriaConsiderPedsWithFlagTrue = function(flag) end,

---@param flagid integer
SearchCriteriaRejectPedsWithFlagFalse = function(flagid) end,

---@param flag integer
---Sets which random peds will be rejecected by the search.
SearchCriteriaRejectPedsWithFlagTrue = function(flag) end,

---@param ped integer
SendNmMessage = function(ped) end,

---@param dm integer
---@param arg2 integer
---@param arg3 integer
---@param arg4 integer
---@param arg5 boolean
SetAdvancedBoolInDecisionMaker = function(dm, arg2, arg3, arg4, arg5) end,

---@param set boolean
SetAllowDummyConversions = function(set) end,

---@param ped integer
---@param grname string
---@return integer grname
SetAnimGroupForChar = function(ped, grname) end,

---@param ped integer
---@param value boolean
SetBlockingOfNonTemporaryEvents = function(ped, value) end,

---@param ped integer
---@param set boolean
SetCanTargetCharWithoutLos = function(ped, set) end,

---@param charIndex integer
---@param newAccuracy integer
---Sets the chars shooting accuracy, between 0 to 100.
SetCharAccuracy = function(charIndex, newAccuracy) end,

---@param ped integer
---@param speed number
SetCharAllAnimsSpeed = function(ped, speed) end,

---@param ped integer
---@param set boolean
SetCharAllowedToDuck = function(ped, set) end,

---@param ped integer
---@param set boolean
SetCharAllowedToRunOnBoats = function(ped, set) end,

---@param ped integer
---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@param angle number
SetCharAngledDefensiveArea = function(ped, x0, y0, z0, x1, y1, z1, angle) end,

---@param ped integer
---@param AnimName0 string
---@param AnimName1 string
---@param delta number
---@return integer AnimName0
---@return integer AnimName1
SetCharAnimBlendOutDelta = function(ped, AnimName0, AnimName1, delta) end,

---@param ped integer
---@param AnimName0 string
---@param AnimName1 string
---@param time number
---@return integer AnimName0
---@return integer AnimName1
SetCharAnimCurrentTime = function(ped, AnimName0, AnimName1, time) end,

---@param ped integer
---@param AnimName0 string
---@param AnimName1 string
---@param flag boolean
---@return boolean
---@return integer AnimName0
---@return integer AnimName1
SetCharAnimPlayingFlag = function(ped, AnimName0, AnimName1, flag) end,

---@param ped integer
---@param AnimName0 string
---@param AnimName1 string
---@param speed number
---@return integer AnimName0
---@return integer AnimName1
SetCharAnimSpeed = function(ped, AnimName0, AnimName1, speed) end,

---@param ped integer
---@param value boolean
SetCharAsEnemy = function(ped, value) end,

---@param ped integer
SetCharAsMissionChar = function(ped) end,

---@param ped integer
---@param set boolean
SetCharBleeding = function(ped, set) end,

---@param ped integer
---@param set boolean
SetCharBulletproofVest = function(ped, set) end,

---@param ped integer
---@param value boolean
SetCharCanBeKnockedOffBike = function(ped, value) end,

---@param ped integer
---@param enabled boolean
SetCharCanBeShotInVehicle = function(ped, enabled) end,

---@param ped integer
---@param set boolean
SetCharCanSmashGlass = function(ped, set) end,

---@param ped integer
---@param enabled boolean
SetCharCantBeDraggedOut = function(ped, enabled) end,

---@param ped integer
---@param rate number
SetCharClimbAnimRate = function(ped, rate) end,

---@param ped integer
---@param set boolean
SetCharCollision = function(ped, set) end,

---@param charIndex integer
---@param componentNumber integer
---@param newDrawableNumber integer
---@param newTextureNumber integer
---Sets the drawable and texture for the specified char component.
SetCharComponentVariation = function(charIndex, componentNumber, newDrawableNumber, newTextureNumber) end,

---@param ped integer
---@param x number
---@param y number
---@param z number
SetCharCoordinates = function(ped, x, y, z) end,

---@param ped integer
---@param x number
---@param y number
---@param z number
SetCharCoordinatesDontClearPlayerTasks = function(ped, x, y, z) end,

---@param ped integer
---@param x number
---@param y number
---@param z number
SetCharCoordinatesDontWarpGang = function(ped, x, y, z) end,

---@param ped integer
---@param x number
---@param y number
---@param z number
SetCharCoordinatesDontWarpGangNoOffset = function(ped, x, y, z) end,

---@param ped integer
---@param x number
---@param y number
---@param z number
SetCharCoordinatesNoOffset = function(ped, x, y, z) end,

---@param ped integer
---@param dm integer
SetCharDecisionMaker = function(ped, dm) end,

---@param ped integer
SetCharDecisionMakerToDefault = function(ped) end,

---@param ped integer
SetCharDefaultComponentVariation = function(ped) end,

SetCharDefensiveAreaAttachedToCar = function() end,

---@param ped integer
---@param pednext integer
---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@param arg9 integer
---@param arg10 integer
SetCharDefensiveAreaAttachedToPed = function(ped, pednext, x0, y0, z0, x1, y1, z1, arg9, arg10) end,

---@param ped integer
---@param heading number
SetCharDesiredHeading = function(ped, heading) end,

---@param ped integer
---@param allow boolean
SetCharDiesInstantlyInWater = function(ped, allow) end,

---@param ped integer
---@param set boolean
SetCharDrownsInSinkingVehicle = function(ped, set) end,

---@param ped integer
---@param set boolean
SetCharDrownsInWater = function(ped, set) end,

---@param ped integer
---@param drugged boolean
SetCharDruggedUp = function(ped, drugged) end,

---@param charIndex integer
---@param duck boolean
---Sets a char to a ducking pose.
SetCharDucking = function(charIndex, duck) end,

---@param ped integer
---@param timed integer
SetCharDuckingTimed = function(ped, timed) end,

---@param ped integer
---@param multiplier number
SetCharFireDamageMultiplier = function(ped, multiplier) end,

---@param ped integer
---@param set boolean
SetCharForceDieInCar = function(ped, set) end,

---@param ped integer
---@param AnimGroup string
---@return integer AnimGroup
SetCharGestureGroup = function(ped, AnimGroup) end,

---@param ped integer
---@param set boolean
SetCharGetOutUpsideDownCar = function(ped, set) end,

---@param ped integer
---@param value number
SetCharGravity = function(ped, value) end,

---@param ped integer
---@param heading number
SetCharHeading = function(ped, heading) end,

---@param charIndex integer
---@param health integer
SetCharHealth = function(charIndex, health) end,

---@param ped integer
---@param set boolean
SetCharInCutscene = function(ped, set) end,

---@param ped integer
---@param enable boolean
SetCharInvincible = function(ped, enable) end,

---@param ped integer
---@param enable boolean
SetCharIsTargetPriority = function(ped, enable) end,

---@param ped integer
---@param value boolean
SetCharKeepTask = function(ped, value) end,

---@param charIndex integer
---@param maxHealth integer
---Sets the chars max health.
SetCharMaxHealth = function(charIndex, maxHealth) end,

---@param ped integer
---@param ratio number
SetCharMaxMoveBlendRatio = function(ped, ratio) end,

---@param ped integer
---@param time number
SetCharMaxTimeInWater = function(ped, time) end,

---@param ped integer
---@param time number
SetCharMaxTimeUnderwater = function(ped, time) end,

---@param ped integer
---@param set boolean
SetCharMeleeActionFlag0 = function(ped, set) end,

---@param ped integer
---@param set boolean
SetCharMeleeActionFlag1 = function(ped, set) end,

---@param ped integer
---@param set boolean
SetCharMeleeActionFlag2 = function(ped, set) end,

---@param ped integer
---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
SetCharMeleeMovementConstaintBox = function(ped, x0, y0, z0, x1, y1, z1) end,

---@param charIndex integer
---@param money integer
---Sets the chars money.
SetCharMoney = function(charIndex, money) end,

---@param ped integer
---@param multiplier number
SetCharMoveAnimSpeedMultiplier = function(ped, multiplier) end,

---@param ped integer
---@param set boolean
SetCharMovementAnimsBlocked = function(ped, set) end,

---This native function doesn't work (debug function removed in release build).
SetCharNameDebug = function() end,

---@param ped integer
---@param value boolean
SetCharNeverLeavesGroup = function(ped, value) end,

---@param ped integer
---@param set boolean
SetCharNeverTargetted = function(ped, set) end,

---@param charIndex integer
---@param relationshipGroup integer
---@param enable boolean
SetCharNotDamagedByRelationshipGroup = function(charIndex, relationshipGroup, enable) end,

---@param ped integer
---@param set boolean
SetCharOnlyDamagedByPlayer = function(ped, set) end,

---@param ped integer
---@param set boolean
---@param relgroup integer
SetCharOnlyDamagedByRelationshipGroup = function(ped, set, relgroup) end,

---@param charIndex integer
---@param notDamagedByBulletsFlag boolean
---@param notDamagedByFlamesFlag boolean
---@param ignoresExplosionsFlag boolean
---@param notDamagedByCollisionsFlag boolean
---@param notDamagedByMeleeFlag boolean
---Sets the character's immunities.
SetCharProofs = function(charIndex, notDamagedByBulletsFlag, notDamagedByFlamesFlag, ignoresExplosionsFlag, notDamagedByCollisionsFlag, notDamagedByMeleeFlag) end,

---@param charIndex integer
---@param position integer
---@param newPropIndex integer
---Set the id of the prop at the given position for the given char.
SetCharPropIndex = function(charIndex, position, newPropIndex) end,

---@param ped integer
---@param arg2 integer
---@param arg3 integer
---@param arg4 integer
SetCharPropIndexTexture = function(ped, arg2, arg3, arg4) end,

---@param ped integer
---@param set boolean
SetCharProvideCoveringFire = function(ped, set) end,

---@param ped integer
SetCharRandomComponentVariation = function(ped) end,

---@param ped integer
---@param set boolean
SetCharReadyToBeExecuted = function(ped, set) end,

---@param ped integer
---@param set boolean
SetCharReadyToBeStunned = function(ped, set) end,

---@param charIndex integer
---@param relationshipLevel integer
---@param relationshipGroup integer
SetCharRelationship = function(charIndex, relationshipLevel, relationshipGroup) end,

---@param charIndex integer
---@param relationshipGroup integer
SetCharRelationshipGroup = function(charIndex, relationshipGroup) end,

---@param ped integer
---@param xr number
---@param yr number
---@param zr number
SetCharRotation = function(ped, xr, yr, zr) end,

---@param ped integer
---@param rate integer
SetCharShootRate = function(ped, rate) end,

---@param ped integer
---@param set boolean
SetCharSignalAfterKill = function(ped, set) end,

---@param ped integer
---@param x number
---@param y number
---@param z number
---@param radius number
SetCharSphereDefensiveArea = function(ped, x, y, z, radius) end,

---@param ped integer
---@param set boolean
SetCharStayInCarWhenJacked = function(ped, set) end,

---@param ped integer
---@param value boolean
SetCharSuffersCriticalHits = function(ped, value) end,

---@param ped integer
---@param set boolean
SetCharUsesDeafultAnimGroupWhenFleeing = function(ped, set) end,

---@param ped integer
---@param set boolean
SetCharUsesUpperbodyDamageAnimsOnly = function(ped, set) end,

---@param charIndex integer
---@param x number
---@param y number
---@param z number
---Sets the char's current velocity.
SetCharVelocity = function(charIndex, x, y, z) end,

---@param ped integer
---@param value boolean
SetCharVisible = function(ped, value) end,

---@param ped integer
---@param set boolean
SetCharWalkAlongsideLeaderWhenAppropriate = function(ped, set) end,

---@param ped integer
---@param wanted boolean
SetCharWantedByPolice = function(ped, wanted) end,

---@param ped integer
---@param set boolean
SetCharWatchMelee = function(ped, set) end,

---@param ped integer
---@param set boolean
SetCharWillCowerInsteadOfFleeing = function(ped, set) end,

---@param ped integer
---@param value boolean
SetCharWillDoDrivebys = function(ped, value) end,

---@param ped integer
---@param value boolean
SetCharWillFlyThroughWindscreen = function(ped, value) end,

---@param ped integer
---@param set boolean
SetCharWillLeaveCarInCombat = function(ped, set) end,

---@param ped integer
---@param value boolean
SetCharWillMoveWhenInjured = function(ped, value) end,

---@param ped integer
---@param set boolean
SetCharWillOnlyFireWithClearLos = function(ped, set) end,

---@param ped integer
---@param set boolean
SetCharWillRemainOnBoatAfterMissionEnds = function(ped, set) end,

---@param ped integer
---@param set boolean
SetCharWillTryToLeaveBoatAfterLeader = function(ped, set) end,

---@param ped integer
---@param set boolean
SetCharWillTryToLeaveWater = function(ped, set) end,

---@param ped integer
---@param value boolean
SetCharWillUseCarsInCombat = function(ped, value) end,

---@param ped integer
---@param value boolean
SetCharWillUseCover = function(ped, value) end,

---@param ped integer
---@param dm integer
SetCombatDecisionMaker = function(ped, dm) end,

---@param set boolean
SetCreateRandomCops = function(set) end,

---@param ped integer
---@param x number
---@param y number
---@param z number
SetDeadCharCoordinates = function(ped, x, y, z) end,

---@param dm integer
---@param value boolean
SetDecisionMakerAttributeCanChangeTarget = function(dm, value) end,

---@param dm integer
---@param value integer
SetDecisionMakerAttributeCaution = function(dm, value) end,

---@param dm integer
---@param value integer
SetDecisionMakerAttributeFireRate = function(dm, value) end,

---@param dm integer
---@param value integer
SetDecisionMakerAttributeLowHealth = function(dm, value) end,

---@param dm integer
---@param value integer
SetDecisionMakerAttributeMovementStyle = function(dm, value) end,

---@param dm integer
---@param value integer
SetDecisionMakerAttributeNavigationStyle = function(dm, value) end,

---@param dm integer
---@param value integer
SetDecisionMakerAttributeRetreatingBehaviour = function(dm, value) end,

---@param dm integer
---@param value integer
SetDecisionMakerAttributeSightRange = function(dm, value) end,

---@param dm integer
---@param value integer
SetDecisionMakerAttributeStandingStyle = function(dm, value) end,

---@param dm integer
---@param value integer
SetDecisionMakerAttributeTargetInjuredReaction = function(dm, value) end,

---@param dm integer
---@param value integer
SetDecisionMakerAttributeTargetLossResponse = function(dm, value) end,

---@param dm integer
---@param value integer
SetDecisionMakerAttributeTeamwork = function(dm, value) end,

---@param dm integer
---@param value integer
SetDecisionMakerAttributeWeaponAccuracy = function(dm, value) end,

---@param arg1 integer
---@param arg2 string
---@return integer arg2
SetDefaultTargetScoringFunction = function(arg1, arg2) end,

---@param ped integer
---@param disable boolean
SetDisablePlayerShoveAnimation = function(ped, disable) end,

---@param ped integer
---@param set boolean
SetDontActivateRagdollFromPlayerImpact = function(ped, set) end,

---@param ped integer
---@param set boolean
SetForcePlayerToEnterThroughDirectDoor = function(ped, set) end,

---@param group integer
---@param dm integer
SetGroupCharDecisionMaker = function(group, dm) end,

---@param ped integer
---@param value boolean
SetGroupCharDucksWhenAimedAt = function(ped, value) end,

---@param group integer
---@param dm integer
SetGroupCombatDecisionMaker = function(group, dm) end,

---@param groupIndex integer
---@param status integer
SetGroupFollowStatus = function(groupIndex, status) end,

---@param groupIndex integer
---@param formation integer
---Sets the formation a group can take.
SetGroupFormation = function(groupIndex, formation) end,

---@param group integer
---@param space number
SetGroupFormationSpacing = function(group, space) end,

---@param group integer
---@param leader integer
SetGroupLeader = function(group, leader) end,

---@param group integer
---@param member integer
SetGroupMember = function(group, member) end,

---@param group integer
---@param seperation number
SetGroupSeparationRange = function(group, seperation) end,

---@param ped integer
---@param heading0 number
---@param heading1 number
SetHeadingLimitForAttachedPed = function(ped, heading0, heading1) end,

---@param ped integer
---@param arg2 integer
---@param arg3 integer
SetInformRespectedFriends = function(ped, arg2, arg3) end,

---@param ped integer
---@param set boolean
SetLoadCollisionForCharFlag = function(ped, set) end,

---@param money integer
SetMoneyCarriedByAllNewPeds = function(money) end,

---@param modelHash integer
---@param m0 integer
---@param m1 integer
SetMoneyCarriedByPedWithModel = function(modelHash, m0, m1) end,

---@param ped integer
---@param AnimName0 string
---@param AnimName1 string
---@param pose number
---@return integer AnimName0
---@return integer AnimName1
SetNmAnimPose = function(ped, AnimName0, AnimName1, pose) end,

---@param id integer
---@param value boolean
SetNmMessageBool = function(id, value) end,

---@param id integer
---@param value number
SetNmMessageFloat = function(id, value) end,

---@param id integer
---@param ped integer
---@param car integer
---@param obj integer
SetNmMessageInstanceIndex = function(id, ped, car, obj) end,

---@param id integer
---@param value integer
SetNmMessageInt = function(id, value) end,

---@param id integer
---@param string string
---@return integer string
SetNmMessageString = function(id, string) end,

---@param id integer
---@param x number
---@param y number
---@param z number
SetNmMessageVec3 = function(id, x, y, z) end,

---@param ped integer
---@param set boolean
SetPedAllowMissionOnlyDrivebyUse = function(ped, set) end,

---@param ped integer
---@param alpha integer
SetPedAlpha = function(ped, alpha) end,

---@param ped integer
SetPedComponentsToNetworkPlayersettingsModel = function(ped) end,

---@param density number
SetPedDensityMultiplier = function(density) end,

---@param ped integer
---@param value boolean
SetPedDiesWhenInjured = function(ped, value) end,

---@param ped integer
---@param value boolean
SetPedDontDoEvasiveDives = function(ped, value) end,

---@param ped integer
---@param set boolean
SetPedDontUseVehicleSpecificAnims = function(ped, set) end,

---@param ped integer
---@param set boolean
SetPedEnableLegIk = function(ped, set) end,

---@param ped integer
---@param set boolean
SetPedFallOffBikesWhenShot = function(ped, set) end,

---@param ped integer
---@param set boolean
SetPedForceFlyThroughWindscreen = function(ped, set) end,

---@param ped integer
---@param set boolean
SetPedForceVisualiseHeadDamageFromBullets = function(ped, set) end,

---@param ped integer
---@param set boolean
SetPedGeneratesDeadBodyEvents = function(ped, set) end,

---@param ped integer
---@param set boolean
SetPedHeedsTheEveryoneIgnorePlayerFlag = function(ped, set) end,

---@param ped integer
---@param set boolean
SetPedHeliPilotRespectsMinimummHeight = function(ped, set) end,

---@param ped integer
---@param index integer
SetPedHelmetTextureIndex = function(ped, index) end,

---@param ped integer
---@param set boolean
SetPedInstantBlendsWeaponAnims = function(ped, set) end,

---@param ped integer
---@param set boolean
SetPedMotionBlur = function(ped, set) end,

---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
SetPedNonCreationArea = function(x0, y0, z0, x1, y1, z1) end,

---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
SetPedNonRemovalArea = function(x0, y0, z0, x1, y1, z1) end,

---@param ped integer
---@param set boolean
SetPedSkipsComplexCoverCollisionChecks = function(ped, set) end,

---@param ped integer
---@param set boolean
SetPedSteersAroundObjects = function(ped, set) end,

---@param ped integer
---@param set boolean
SetPedSteersAroundPeds = function(ped, set) end,

---@param charIndex integer
---@param scale number
SetPedWindyClothingScale = function(charIndex, scale) end,

---@param ped integer
---@param set boolean
SetPedWithBrainCanBeConvertedToDummyPed = function(ped, set) end,

---@param ped integer
---@param set boolean
SetPedWontAttackPlayerWithoutWantedLevel = function(ped, set) end,

---@param ped integer
SetPlayerSettingsGenre = function(ped) end,

---@param relationshipType integer
---@param relGroup integer
---@param otherRelGroup integer
---Set the relationship between rel groups.
SetRelationship = function(relationshipType, relGroup, otherRelGroup) end,

---@param charIndex integer
---@param roomKey integer
SetRoomForCharByKey = function(charIndex, roomKey) end,

---@param charIndex integer
---@param roomName string
---@return integer roomName
SetRoomForCharByName = function(charIndex, roomName) end,

---@param dummy integer
---@param key integer
SetRoomForDummyCharByKey = function(dummy, key) end,

---@param ped integer
---@param roomname string
---@return integer roomname
SetRoomForDummyCharByName = function(ped, roomname) end,

---@param ped integer
---@param xr number
---@param yr number
---@param zr number
SetRotationForAttachedPed = function(ped, xr, yr, zr) end,

---@param density number
---@param densitynext number
SetScenarioPedDensityMultiplier = function(density, densitynext) end,

---@param ped integer
---@param offset number
SetScriptedAnimSeatOffset = function(ped, offset) end,

---@param x number
---@param y number
---@param z number
SetScriptedConversionCentre = function(x, y, z) end,

---@param ped integer
---@param value number
SetSenseRange = function(ped, value) end,

---@param ped integer
---@param index integer
SetSpecificPassengerIndexToUseInGroups = function(ped, index) end,

---@param ped integer
---@param speed number
SetSwimSpeed = function(ped, speed) end,

---@param ped integer
StopPedDoingFallOffTestsWhenShot = function(ped) end,

---@param ped integer
StopPedWeaponFiringWhenDropped = function(ped) end,

---@param ped integer
---@return integer car
StoreCarCharIsInNoSave = function(ped) end,

---@param modelHash integer
SuppressPedModel = function(modelHash) end,

---@param charIndex integer
---@param forceSwitch boolean
---Sets a character from a ragdoll state to an animated state.
SwitchPedToAnimated = function(charIndex, forceSwitch) end,

---@param charIndex integer
---@param minTime integer
---@param maxTime integer
---@param startTask integer
---@param abortIfInjured boolean
---@param abortIfDead boolean
---@param forceScriptControl boolean
---@return boolean
---Sets a ped into a rag doll state.
SwitchPedToRagdoll = function(charIndex, minTime, maxTime, startTask, abortIfInjured, abortIfDead, forceScriptControl) end,

---@param charIndex integer
---@param minTime integer
---@param maxTime integer
---@param fallType integer
---@param directionX number
---@param directionY number
---@param directionZ number
---@param groundHeight number
---@param grab1x number
---@param grab1y number
---@param grab1z number
---@param grab2x number
---@param grab2y number
---@param grab2z number
---@return boolean
SwitchPedToRagdollWithFall = function(charIndex, minTime, maxTime, fallType, directionX, directionY, directionZ, groundHeight, grab1x, grab1y, grab1z, grab2x, grab2y, grab2z) end,

---@param charIndex integer
---Toggles char ducking pose.
ToggleCharDucking = function(charIndex) end,

---@param ped integer
---@param value boolean
UnlockRagdoll = function(ped, value) end,

---@param ped integer
UnsetCharMeleeMovementConstaintBox = function(ped) end,

---@param ped integer
---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
UpdatePedPhysicalAttachmentPosition = function(ped, x0, y0, z0, x1, y1) end,

---@param charIndex integer
---@param carIndex integer
---@param seat integer
WarpCharFromCarToCar = function(charIndex, carIndex, seat) end,

---@param ped integer
---@param x number
---@param y number
---@param z number
WarpCharFromCarToCoord = function(ped, x, y, z) end,

---@param ped integer
---@param vehicle integer
WarpCharIntoCar = function(ped, vehicle) end,

---@param charIndex integer
---@param carIndex integer
---@param seat integer
WarpCharIntoCarAsPassenger = function(charIndex, carIndex, seat) end,

---@param ped integer
---@return boolean
WasPedKilledByHeadshot = function(ped) end,

---@param ped integer
---@return boolean
WasPedSkeletonUpdated = function(ped) end,

---@param playerIndex integer
---@param score integer
AddScore = function(playerIndex, score) end,

---@param playerIndex integer
---@param allow boolean
---Multiplayer only, this explicitly allows player vs friendly player lockons in a network game: By default its disabled.
AllowLockonToFriendlyPlayers = function(playerIndex, allow) end,

---@param player integer
---@param allow boolean
AllowLockonToRandomPeds = function(player, allow) end,

---@param playerIndex integer
---@param allow boolean
AllowPlayerToCarryNonMissionObjects = function(playerIndex, allow) end,

---@param playerIndex integer
---@param level integer
---Sets the wanted level for the player.
AlterWantedLevel = function(playerIndex, level) end,

---@param playerIndex integer
---@param level integer
---Sets the wanted level only if its higher than the current.
AlterWantedLevelNoDrop = function(playerIndex, level) end,

---@param playerIndex integer
---Sets the wanted level for the player immediately.
ApplyWantedLevelChangeNow = function(playerIndex) end,

---@param achievementIndex integer
---@return boolean
---Award an achievement to the main player.
AwardAchievement = function(achievementIndex) end,

---@param player integer
BlockStatsMenuActions = function(player) end,

---@param playerIndex integer
---@return boolean
---Returns TRUE if it is safe for the player to start a mission.
CanPlayerStartMission = function(playerIndex) end,

---@param playerIndex integer
---@param modelHashKey integer
---Changes the model for the player.
ChangePlayerModel = function(playerIndex, modelHashKey) end,

---@param playerIndex integer
---@param modelHash integer
ChangePlayerPhoneModel = function(playerIndex, modelHash) end,

---@param player integer
---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
ChangePlayerPhoneModelOffsets = function(player, x0, y0, z0, x1, y1, z1) end,

---@param playerIndex integer
---Call this once before you start checking HAS_PLAYER_DAMAGED_AT_LEAST_ONE_PED.
ClearPlayerHasDamagedAtLeastOnePed = function(playerIndex) end,

---@param playerIndex integer
---Call this once before you start checking HAS_PLAYER_DAMAGED_AT_LEAST_ONE_VEHICLE.
ClearPlayerHasDamagedAtLeastOneVehicle = function(playerIndex) end,

---@param playerIndex integer
---Clears the players wanted level immediately.
ClearWantedLevel = function(playerIndex) end,

---@param playerIndex integer
---@return integer
---Converts an int to a player index.
ConvertIntToPlayerindex = function(playerIndex) end,

---@param playerIndex integer
---@param x number
---@param y number
---@param z number
---@return integer playerIndex
---Creates a player at the given coordinates.
CreatePlayer = function(playerIndex, x, y, z) end,

DeletePlayer = function() end,

---@param playerIndex integer
---@param disabled boolean
---Set lockon active state for mulitplayer games.
DisablePlayerLockon = function(playerIndex, disabled) end,

---@param playerIndex integer
---@param disabled boolean
---Sets if the player can sprint.
DisablePlayerSprint = function(playerIndex, disabled) end,

---@param playerIndex integer
---@param disable boolean
DisablePlayerVehicleEntry = function(playerIndex, disable) end,

---@param playerIndex integer
---@param flag boolean
---Sets if the cops will be dispatched for the player.
DontDispatchCopsForPlayer = function(playerIndex, flag) end,

DoWeaponStuffAtStartOf2pGame = function() end,

FakeDeatharrest = function() end,

---@param playerIndex integer
---@param multiplier number
---Force higher air drag mult on any car or bike the player uses until the mission ends or this command is called again with 1.0, fDragMult range 1.0 - 15.0  (5.0 is standard for high air resistance zones on the map).
ForceAirDragMultForPlayersCar = function(playerIndex, multiplier) end,

---@param player integer
---@param force boolean
ForceInteriorLightingForPlayer = function(player, force) end,

---@param playerIndex integer
---@param flag boolean
ForceNetPlayerInvisible = function(playerIndex, flag) end,

---@param level integer
---@return integer
---Returns how much cash is required to level up.
GetLeftPlayerCashToReachLevel = function(level) end,

---@return integer
---Return the player total cash earned in all ranked multiplayer games.
GetLocalPlayerMpCash = function() end,

---@param wtype integer
---@param wid integer
---@return number
GetLocalPlayerWeaponStat = function(wtype, wid) end,

---@return integer maxWantedLevel
---Gets the players max wanted level.
GetMaxWantedLevel = function() end,

GetNeededPlayerCashForLevel = function() end,

---@return integer
GetNoLawVehiclesDestroyedByLocalPlayer = function() end,

---@param teamIndex integer
---@return integer
---Get the number of players in a team.
GetNoOfPlayersInTeam = function(teamIndex) end,

---@return integer
---Gets the number of players.
GetNumberOfPlayers = function() end,

---@param playerIndex integer
---@param modelHash integer
---@return integer num
GetNumOfModelsKilledByPlayer = function(playerIndex, modelHash) end,

---@param playerIndex integer
---@return integer charIndex
---Gets the char index from the players index.
GetPlayerChar = function(playerIndex) end,

---@param playerIndex integer
---@return integer
GetPlayerColour = function(playerIndex) end,

---@param playerIndex integer
---@return integer groupIndex
---Gets the players group.
GetPlayerGroup = function(playerIndex) end,

---@return integer
---Gets the player index for the main player.
GetPlayerId = function() end,

---@param charIndex integer
---@return integer
---Returns the player index of a player whos ped is the one with the given ped index. Returns -1 otherwise.
GetPlayerIdForThisPed = function(charIndex) end,

---@param playerIndex integer
---@return integer maxArmour
---Gets the players max armour value.
GetPlayerMaxArmour = function(playerIndex) end,

---@param playerIndex integer
---@return integer maxHealth
---Gets the players max armour value.
GetPlayerMaxHealth = function(playerIndex) end,

---@param playerIndex integer
---@return string
---Returns the name of the player.
GetPlayerName = function(playerIndex) end,

---@param playerIndex integer
---@return integer red
---@return integer green
---@return integer blue
---Gets the RGB colour of the player.
GetPlayerRgbColour = function(playerIndex) end,

---@return integer
GetPlayersettingsModelChoice = function() end,

---@return integer carIndex
---Returns the last car that the player has been in.
GetPlayersLastCarNoSave = function() end,

---@param playerIndex integer
---@return integer
---Gets the team the player is in.
GetPlayerTeam = function(playerIndex) end,

---@param playerIndex integer
---@return integer increment
GetPlayerWantedLevelIncrement = function(playerIndex) end,

GetRemoteControlledCar = function() end,

---@return integer
---Returns the time in milliseconds since the player was arrested and got respawned outside a police station.
GetTimeSinceLastArrest = function() end,

---@return integer
---Returns the time in milliseconds since the player died.
GetTimeSinceLastDeath = function() end,

---@param playerIndex integer
---@return integer
---Returns (in milliseconds) how long ago the player last drove against the flow of traffic.
GetTimeSincePlayerDroveAgainstTraffic = function(playerIndex) end,

---@param playerIndex integer
---@return integer
---Returns (in milliseconds) how long ago the player drove on the pavement.
GetTimeSincePlayerDroveOnPavement = function(playerIndex) end,

---@param playerIndex integer
---@return integer
---Returns (in milliseconds) how long ago the player (in a car) last hit a building.
GetTimeSincePlayerHitBuilding = function(playerIndex) end,

---@param playerIndex integer
---@return integer
---Return (in milliseconds) how long ago the player (in a car) last hit a car.
GetTimeSincePlayerHitCar = function(playerIndex) end,

---@param playerIndex integer
---@return integer
---Returns (in milliseconds) how long ago the player (in a car) last hit a object.
GetTimeSincePlayerHitObject = function(playerIndex) end,

---@param playerIndex integer
---@return integer
---Returns (in milliseconds) how long ago the player (in a car) last hit a ped.
GetTimeSincePlayerHitPed = function(playerIndex) end,

---@param playerIndex integer
---@return integer
---Returns (in milliseconds) how long ago the player last ran a red light.
GetTimeSincePlayerRanLight = function(playerIndex) end,

---@param playerIndex integer
---@return integer trainIndex
---Gets the train the player would like to enter.
GetTrainPlayerWouldEnter = function(playerIndex) end,

---@param playerIndex integer
---@return integer carIndex
---Gets the vehicle the player would like to enter.
GetVehiclePlayerWouldEnter = function(playerIndex) end,

---@param playerIndex integer
---Give the player a helmet.
GivePlayerHelmet = function(playerIndex) end,

---@param playerIndex integer
---@param giveControl boolean
---Gives the player control of the ragdoll.
GivePlayerRagdollControl = function(playerIndex, giveControl) end,

GiveRemoteControlledModelToPlayer = function() end,

---@param achievementId integer
---@return boolean
---Verify if an achievement has been completed.
HasAchievementBeenPassed = function(achievementId) end,

---@return boolean
HasDeatharrestExecuted = function() end,

---@return boolean
HasGamerChangedNetworkModelSettings = function() end,

---@param playerIndex integer
---@return boolean
---Returns TRUE if the player has damaged any peds since the last time that CLEAR_PLAYER_HAS_DAMAGED_AT_LEAST_ONE_PED was called.
HasPlayerDamagedAtLeastOnePed = function(playerIndex) end,

---@param playerIndex integer
---@return boolean
---Returns TRUE if the player has damaged any vehicles since the last time that CLEAR_PLAYER_HAS_DAMAGED_AT_LEAST_ONE_VEHICLE was called.
HasPlayerDamagedAtLeastOneVehicle = function(playerIndex) end,

---@return boolean
HasPlayerRankBeenUpgraded = function() end,

---@param player integer
---@param armour number
IncreasePlayerMaxArmour = function(player, armour) end,

---@param player integer
---@param maxhealth integer
IncreasePlayerMaxHealth = function(player, maxhealth) end,

Is2playerGameGoingOn = function() end,

IsAttachedPlayerHeadingAchieved = function() end,

---@return boolean
IsInLanMode = function() end,

---@return boolean
IsInPlayerSettingsMenu = function() end,

---@param playerIndex integer
---@return boolean
---Checks if the player is climbing.
IsPlayerClimbing = function(playerIndex) end,

---@param playerIndex integer
---@return boolean
---Checks if the players control is on.
IsPlayerControlOn = function(playerIndex) end,

---@param playerIndex integer
---@return boolean
---Returns TRUE if the given player is dead.
IsPlayerDead = function(playerIndex) end,

---@param playerIndex integer
---@param charIndex integer
---@return boolean
---Returns TRUE if the player is pointing his weapon at the specified character.
IsPlayerFreeAimingAtChar = function(playerIndex, charIndex) end,

---@param playerIndex integer
---@return boolean
---Returns TRUE if the player is currently not in combat, climbing, jumping or firing a gun.
IsPlayerFreeForAmbientTask = function(playerIndex) end,

---@param player integer
---@param zoneid integer
---@return boolean
IsPlayerInInfoZone = function(player, zoneid) end,

---@param playerIndex integer
---@return boolean
IsPlayerInRemoteMode = function(playerIndex) end,

IsPlayerInShortcutTaxi = function() end,

---@return boolean
---Returns true if the player is logging in to Sony NP.
IsPlayerLoggingInNp = function() end,

---@return boolean
---Returns true if the player is online - implies he is also signed in locally.
IsPlayerOnline = function() end,

---@return boolean
---Returns true if the player is online wrt Gamespy - implies he is also signed in locally.
IsPlayerOnlineGamespy = function() end,

---@return boolean
---Returns true if the player is online wrt Sony NP - implies he is also signed in locally.
IsPlayerOnlineNp = function() end,

---@param playerIndex integer
---@return boolean
IsPlayerPerformingStoppie = function(playerIndex) end,

---@param playerIndex integer
---@return boolean
IsPlayerPerformingWheelie = function(playerIndex) end,

---@param playerIndex integer
---@return boolean
---Returns TRUE if the player is in control.
IsPlayerPlaying = function(playerIndex) end,

---@param playerIndex integer
---@return boolean
---Returns TRUE if the specified Player is in a car and is pressing the Horn button.
IsPlayerPressingHorn = function(playerIndex) end,

---@param playerIndex integer
---@return boolean
---Returns if the player is in a safe state to trigger a cutscene.
IsPlayerReadyForCutscene = function(playerIndex) end,

---@param playerIndex integer
---@return boolean
---Returns FALSE if the player control has been turned off by a script.
IsPlayerScriptControlOn = function(playerIndex) end,

---@return boolean
IsPlayerSignedInLocally = function() end,

---@param playerIndex integer
---@return boolean
---Returns TRUE if the player is pointing his weapon at any entity.
IsPlayerTargettingAnything = function(playerIndex) end,

---@param playerIndex integer
---@param charIndex integer
---@return boolean
---Returns TRUE if the player is pointing his weapon at the specified character.
IsPlayerTargettingChar = function(playerIndex, charIndex) end,

---@param playerIndex integer
---@param objectIndex integer
---@return boolean
---Returns TRUE if the player is pointing his weapon at the specified object.
IsPlayerTargettingObject = function(playerIndex, objectIndex) end,

---@param player integer
---@return boolean
IsPlayerVehicleEntryDisabled = function(player) end,

---@param playerIndex integer
---@param score integer
---@return boolean
IsScoreGreater = function(playerIndex, score) end,

---@return boolean
---Returns true is a system UI (e.g. the sign-in UI) is showing.
IsSystemUiShowing = function() end,

---@param charIndex integer
---@return boolean
IsThisPedAPlayer = function(charIndex) end,

---@param playerIndex integer
---@param level integer
---@return boolean
IsWantedLevelGreater = function(playerIndex, level) end,

---@param distance number
LimitTwoPlayerDistance = function(distance) end,

---@param player integer
---@param maintain boolean
MaintainFlashingStarAfterOffence = function(player, maintain) end,

---@param playerIndex integer
---@param proof boolean
MakePlayerFireProof = function(playerIndex, proof) end,

MakePlayerGangDisappear = function() end,

MakePlayerGangReappear = function() end,

---@param player integer
MakePlayerSafeForCutscene = function(player) end,

MakeRoomInPlayerGangForMissionPeds = function() end,

---@param playerIndex integer
---@return boolean
---Checks the player has a vaild character.
PlayerHasChar = function(playerIndex) end,

---@param playerIndex integer
---@return boolean
PlayerHasFlashingStarAfterOffence = function(playerIndex) end,

---@param playerIndex integer
---@return boolean
PlayerHasFlashingStarsAboutToDrop = function(playerIndex) end,

---@param playerIndex integer
---@return boolean
PlayerHasGreyedOutStars = function(playerIndex) end,

---@param playerIndex integer
---@return boolean
---Returns true if the player is currently in a bad mood.
PlayerIsPissedOff = function(playerIndex) end,

ReleaseTwoPlayerDistance = function() end,

---@param playerIndex integer
---@param forceRemove boolean
---Will remove the players helmet if they have one.
RemovePlayerHelmet = function(playerIndex, forceRemove) end,

RemoveRcBuggy = function() end,

ResetAchievementsAward = function() end,

---@param wtype integer
---@param wid integer
ResetLocalPlayerWeaponStat = function(wtype, wid) end,

ResetNoLawVehiclesDestroyedByLocalPlayer = function() end,

---@param modelHash integer
ResetNumOfModelsKilledByPlayer = function(modelHash) end,

---@param playerIndex integer
---@param pedsFlee boolean
---Stops all random peds from attacking the player, except cops.
SetAllRandomPedsFlee = function(playerIndex, pedsFlee) end,

---@param componentId integer
---@param enable boolean
---Disable / Enable drawing of the specified player component as required.
SetDrawPlayerComponent = function(componentId, enable) end,

---@param playerIndex integer
---@param ignorePlayer boolean
---Sets all peds (including police) will ignore the player.
SetEveryoneIgnorePlayer = function(playerIndex, ignorePlayer) end,

---@param player integer
---@param set boolean
SetFreeHealthCare = function(player, set) end,

SetHeadingForAttachedPlayer = function() end,

---@param charIndex integer
---@param ignoreEvents boolean
---Peds ignore lower priority shocking events, for use in tightly scripted situations, must be reset to false when finished.
SetIgnoreLowPriorityShockingEvents = function(charIndex, ignoreEvents) end,

---@param maxLevel integer
---Sets the max wanted level the player can get.
SetMaxWantedLevel = function(maxLevel) end,

---@param player integer
---@param set boolean
SetPlayerAsCop = function(player, set) end,

---@param playerIndex integer
---@param canBeHassled boolean
---Sets if the player can be hassled by gangs.
SetPlayerCanBeHassledByGangs = function(playerIndex, canBeHassled) end,

---@param playerIndex integer
---@param canDoDriveBy boolean
---Sets whether the player is able to fire an uzi from a car.
SetPlayerCanDoDriveBy = function(playerIndex, canDoDriveBy) end,

---@param playerIndex integer
---@param canUseCover boolean
---Sets if the player can use cover.
SetPlayerCanUseCover = function(playerIndex, canUseCover) end,

---@param playerIndex integer
---@param color integer
SetPlayerColour = function(playerIndex, color) end,

---@param playerIndex integer
---@param setControlOn boolean
---Sets the players control state.
SetPlayerControl = function(playerIndex, setControlOn) end,

---@param playerIndex integer
---@param unknown1 boolean
---@param unknown2 boolean
---@param unknown3 boolean
SetPlayerControlAdvanced = function(playerIndex, unknown1, unknown2, unknown3) end,

---@param player integer
---@param flag0 boolean
---@param flag1 boolean
SetPlayerControlForAmbientScript = function(player, flag0, flag1) end,

---@param playerIndex integer
---@param setControl boolean
---@param removeFiresAndProjectiles boolean
---Sets the players control for network.
SetPlayerControlForNetwork = function(playerIndex, setControl, removeFiresAndProjectiles) end,

---@param playerIndex integer
---@param setControl boolean
SetPlayerControlForTextChat = function(playerIndex, setControl) end,

---@param player integer
---@param set boolean
SetPlayerDisableCrouch = function(player, set) end,

---@param player integer
---@param set boolean
SetPlayerDisableJump = function(player, set) end,

---@param playerIndex integer
---@param value boolean
SetPlayerFastReload = function(playerIndex, value) end,

---@param playerIndex integer
---@param forcedAim boolean
---Forces the player to always aim.
SetPlayerForcedAim = function(playerIndex, forcedAim) end,

---@param player integer
---@param set boolean
SetPlayerGroupRecruitment = function(player, set) end,

---@param playerIndex integer
---@param value boolean
SetPlayerGroupToFollowAlways = function(playerIndex, value) end,

---@param player integer
---@param set boolean
SetPlayerGroupToFollowNever = function(player, set) end,

---@param playerIndex integer
---@param invincible boolean
---Set the player invincible to all damage types.
SetPlayerInvincible = function(playerIndex, invincible) end,

---@param set boolean
SetPlayerKeepsWeaponsWhenRespawned = function(set) end,

---@param playerIndex integer
---@param carIndex integer
---Set the player can only enter this vehicle, set to null if you want them to enter any vehicle.
SetPlayerMayOnlyEnterThisVehicle = function(playerIndex, carIndex) end,

---@param playerIndex integer
---The players mood is set to normal.
SetPlayerMoodNormal = function(playerIndex) end,

---@param playerIndex integer
---@param secondsDuration integer
---Will piss the player off for duration of seconds.
---
---The player will be rude and push people out of the way when pissed off. The players mood will go back to normal when the timer runs out of when SET_PLAYER_MOOD_NORMAL is called.
SetPlayerMoodPissedOff = function(playerIndex, secondsDuration) end,

---@param player integer
---@param arg2 integer
---@param modifier number
SetPlayerMpModifier = function(player, arg2, modifier) end,

---@param playerIndex integer
---@param value boolean
SetPlayerNeverGetsTired = function(playerIndex, value) end,

---@param set boolean
SetPlayerPlayerTargetting = function(set) end,

---@param canBe boolean
SetPlayersCanBeInSeparateCars = function(canBe) end,

---@param playerIndex integer
SetPlayersettingsModelVariationsChoice = function(playerIndex) end,

---@param playerIndex integer
---@param team integer
---Set the players current team.
SetPlayerTeam = function(playerIndex, team) end,

---@param playerIndex integer
---@param ignorePlayer boolean
---Use this to stop the police arresting the player.
SetPoliceIgnorePlayer = function(playerIndex, ignorePlayer) end,

---@param blips boolean
---Sets if police blips are displayed on the radar.
SetPoliceRadarBlips = function(blips) end,

---@param size integer
SetScriptLimitToGangSize = function(size) end,

---@param player integer
---@param set boolean
SetUseLegIk = function(player, set) end,

---@param multiplier number
SetWantedMultiplier = function(multiplier) end,

---Shows the system sign-in UI.
ShowSigninUi = function() end,

---Any contributions to the wanted level are blocked for 5 seconds or so.
StartFiringAmnesty = function() end,

---@param playerIndex integer
---@return integer score
StoreScore = function(playerIndex) end,

---@param playerIndex integer
---@return integer level
StoreWantedLevel = function(playerIndex) end,

TakeRemoteControlOfCar = function() end,

UseDetonator = function() end,

---@param playerIndex integer
---@return integer
---Returns the ID of the object that the player will pick up if they press PICKUP now.
WhatWillPlayerPickup = function(playerIndex) end,

---@param ScriptHandle integer
DestroyThread = function(ScriptHandle) end,

---@param scriptName string
---@return boolean
---@return integer scriptName
---Returns TRUE if the script file can be found on disc.
DoesScriptExist = function(scriptName) end,

---@return integer
---Returns the ID of this thread.
GetIdOfThisThread = function() end,

---@param scriptName string
---@return integer
---@return integer scriptName
GetNumberOfInstancesOfStreamedScript = function(scriptName) end,

---@param scriptName string
---@return boolean
---@return integer scriptName
---Returns TRUE if the script program is in memory.
HasScriptLoaded = function(scriptName) end,

---@param threadId integer
---@return boolean
---Returns TRUE if the thread is still running.
IsThreadActive = function(threadId) end,

---@param scriptName string
---@return integer scriptName
MarkScriptAsNoLongerNeeded = function(scriptName) end,

---@param scriptName string
---@return integer scriptName
RequestScript = function(scriptName) end,

TerminateThisScript = function() end,

---@param respect number
AwardPlayerMissionRespect = function(respect) end,

---@param stat integer
---@return boolean
CanTheStatHaveString = function(stat) end,

---@param metres number
---@return number
ConvertMetresToFeet = function(metres) end,

---@param metres integer
---@return integer
ConvertMetresToFeetInt = function(metres) end,

---@param stat integer
---@param val number
DecrementFloatStat = function(stat, val) end,

---@param stat integer
---@param amount integer
DecrementIntStat = function(stat, amount) end,

---@return integer
FindMaxNumberOfGroupMembers = function() end,

---@param stat integer
---@return number
GetFloatStat = function(stat) end,

---@param playerIndex integer
---@param arg2 integer
---@param arg3 integer
---@return integer
GetGamerNetworkScore = function(playerIndex, arg2, arg3) end,

---@param stat integer
---@return integer
GetIntStat = function(stat) end,

---@return number
GetProgressPercentage = function() end,

---@param stat integer
---@return integer
GetStatFrontendDisplayType = function(stat) end,

---@param stat integer
---@return boolean
GetStatFrontendVisibility = function(stat) end,

---@return integer
GetTotalNumberOfStats = function() end,

---@param stat integer
---@param val number
IncrementFloatStat = function(stat, val) end,

---@param stat integer
---@param value number
IncrementFloatStatNoMessage = function(stat, value) end,

---@param stat integer
---@param value integer
IncrementIntStat = function(stat, value) end,

---@param stat integer
---@param value integer
IncrementIntStatNoMessage = function(stat, value) end,

---@param stat integer
PlaystatsCheat = function(stat) end,

---@param arg1 integer
---@param arg2 number
PlaystatsFloat = function(arg1, arg2) end,

---@param stat string
---@param value integer
---@return integer stat
PlaystatsInt = function(stat, value) end,

---@param stats string
---@param value integer
---@param value2 number
---@return integer stats
PlaystatsIntFloat = function(stats, value, value2) end,

---@param stat string
---@param value integer
---@param value2 integer
---@return integer stat
PlaystatsIntInt = function(stat, value, value2) end,

---@param arg1 integer
PlaystatsMissionCancelled = function(arg1) end,

---@param arg1 integer
PlaystatsMissionFailed = function(arg1) end,

---@param arg1 string
---@return integer arg1
PlaystatsMissionPassed = function(arg1) end,

---@param arg1 integer
PlaystatsMissionStarted = function(arg1) end,

---@param arg1 integer
---@param position integer
RegisterBestPosition = function(arg1, position) end,

---@param stat integer
---@param val number
RegisterFloatStat = function(stat, val) end,

---@param stat integer
---@param val integer
RegisterIntStat = function(stat, val) end,

---@param arg1 string
---@return integer arg1
RegisterMissionPassed = function(arg1) end,

---@param playerIndex integer
---@param arg2 integer
RegisterMultiplayerGameWin = function(playerIndex, arg2) end,

---@param playerIndex integer
---@param arg2 integer
---@param arg3 integer
RegisterNetworkBestGameScores = function(playerIndex, arg2, arg3) end,

RegisterOddjobMissionPassed = function() end,

---@param stat integer
---@param str string
---@return integer str
RegisterStringForFrontendStat = function(stat, str) end,

---@param number integer
RegisterTrackNumber = function(number) end,

---@param stat integer
---@param value number
SetFloatStat = function(stat, value) end,

---@param stat integer
---@param value integer
SetIntStat = function(stat, value) end,

---@param respect number
SetMissionRespectTotal = function(respect) end,

---@param set boolean
SetPlayerIsInStadium = function(set) end,

---@param set boolean
SetStatFrontendAlwaysVisible = function(set) end,

---@param stat integer
---@param type integer
SetStatFrontendDisplayType = function(stat, type) end,

---@param stat integer
SetStatFrontendNeverVisible = function(stat) end,

---@param stat integer
---@param set boolean
SetStatFrontendVisibility = function(stat, set) end,

---@param stat integer
SetStatFrontendVisibleAfterIncremented = function(stat) end,

---@param floatstatval number
SetTotalNumberOfMissions = function(floatstatval) end,

---@param show boolean
ShowUpdateStats = function(show) end,

---@param playerIndex integer
---@param relativeScore integer
---@param gamerTeam integer
UpdateNetworkRelativeScore = function(playerIndex, relativeScore, gamerTeam) end,

---@param playerIndex integer
---@param fieldId integer
---@param score integer
---@param gamerTeam integer
UpdateNetworkStatistics = function(playerIndex, fieldId, score, gamerTeam) end,

---@param interiorIndex integer
---@param activate boolean
ActivateInterior = function(interiorIndex, activate) end,

---@param x number
---@param y number
---@param z number
AddNeededAtPosn = function(x, y, z) end,

---@param allow boolean
AllowGameToPauseForStreaming = function(allow) end,

AllowNetworkPopulationGroupCycling = function() end,

---@param modelHash integer
---@param anims string
---@return integer anims
AttachAnimsToModel = function(modelHash, anims) end,

---@param enable boolean
EnableSceneStreaming = function(enable) end,

FinishStreamingRequestList = function() end,

---@return integer
---Return how many objects are on the streaming request list.
GetNumStreamingRequests = function() end,

---@param pedModelIndex integer
---@return integer
---Can be used to cycle through all the ped models.
GetPedModelFromIndex = function(pedModelIndex) end,

---@param vehicleModelIndex integer
---@return integer
---Can be used to cycle through all the vehicle models.
GetVehicleModelFromIndex = function(vehicleModelIndex) end,

---@param modelHashKey integer
---@return boolean
---Returns TRUE if the collision for this model is in memory.
HasCollisionForModelLoaded = function(modelHashKey) end,

---@param modelHashKey integer
---@return boolean
---Return if a model is in memory.
HasModelLoaded = function(modelHashKey) end,

---@param animName string
---@return boolean
---@return integer animName
HaveAnimsLoaded = function(animName) end,

---@param model integer
---@return boolean
---Return if model is available in one of the streaming image files.
IsModelInCdimage = function(model) end,

---@return boolean
---Return if the streaming system is prioritising certain objects because it needs them in now.
IsStreamingPriorityRequests = function() end,

---@param modelHashKey integer
---@return boolean
IsThisModelAPed = function(modelHashKey) end,

---@param modelHashKey integer
---@return boolean
IsThisModelAVehicle = function(modelHashKey) end,

---Load all the objects on the streaming request list.
LoadAllObjectsNow = function() end,

---@param x number
---@param y number
---@param z number
---Load scene at position.
LoadScene = function(x, y, z) end,

---@param interiorIndex integer
---@param roomKey integer
---Load scene as if in an interior.
LoadSceneForRoomByKey = function(interiorIndex, roomKey) end,

---@param modelHashKey integer
---Tell streaming that this script no longer needs this model.
MarkModelAsNoLongerNeeded = function(modelHashKey) end,

PrioritizeStreamingRequest = function() end,

---@param animName string
---@return integer animName
RemoveAnims = function(animName) end,

---@param iplName string
---@return integer iplName
---Remove a streamable IPL.
RemoveIpl = function(iplName) end,

---@param iplname string
---@return integer iplname
RemoveIplDiscreetly = function(iplname) end,

RequestAllSlodsInWorld = function() end,

---@param animName string
---@return integer animName
RequestAnims = function(animName) end,

---@param x number
---@param y number
---@param z number
---Tell streaming to request collision about point.
RequestCollisionAtPosn = function(x, y, z) end,

---@param modelHashKey integer
---Tell streaming to request collision for a specific model.
RequestCollisionForModel = function(modelHashKey) end,

---@param modelHashKey integer
---@param roomName string
---@return integer roomName
---Requests the room and all the models within it.
RequestInteriorModels = function(modelHashKey, roomName) end,

---@param iplName string
---@return integer iplName
---Request streaming to load an IPL file.
RequestIpl = function(iplName) end,

---@param modelHashKey integer
---Request streaming to load a model.
RequestModel = function(modelHashKey) end,

---@param ditch boolean
---For certain network game where the players will never get a wanted level (races).
---The police models don't need to be loaded.
SetDitchPoliceModels = function(ditch) end,

---@param reduce boolean
---Can be called to reduce the number of ped models streamed.
SetReducePedModelBudget = function(reduce) end,

---@param reduce boolean
---Can be called to reduce the number of vehicle models streamed.
SetReduceVehicleModelBudget = function(reduce) end,

---@param time integer
SetStreamingRequestListTime = function(time) end,

SimulateUpdateLoadScene = function() end,

---@param x number
---@param y number
---@param z number
---Start a non blocking load scene at position.
StartLoadScene = function(x, y, z) end,

---@param name string
---@return integer name
---Set the start point for a streaming request list.
StartStreamingRequestList = function(name) end,

---@param on boolean
SwitchStreaming = function(on) end,

---@return boolean
---Continue a load scene that was started with START_LOAD_SCENE. Return TRUE if the load scene has finished.
UpdateLoadScene = function() end,

Breakpoint = function() end,

---@param value number
---@return integer
---Returns input number rounded up toward positive infinity.
Ceil = function(value) end,

---@param textLabel string
---@return integer textLabel
---Resets the input text label to the empty string.
ClearTextLabel = function(textLabel) end,

---@param value number
---@return number
---Cosine (input is in degrees).
Cos = function(value) end,

---@param arg1 number
---@return number
Exp = function(arg1) end,

---@param value number
---@return integer
---Returns input number rounded down toward negative infinity.
Floor = function(value) end,

---@return integer
GetConsoleCommandToken = function() end,

---@return integer
GetLatestConsoleCommand = function() end,

GetNumConsoleCommandTokens = function() end,

---@param base number
---@param power number
---@return number
Pow = function(base, power) end,

---@param value number
---Procedure that prints a float to the console (NOT the game screen).
Printfloat = function(value) end,

---@param width integer
---@param precision integer
---@param value number
---Procedure that prints a float to the console (NOT the game screen).
Printfloat2 = function(width, precision, value) end,

---@param value integer
---Procedure that prints an integer to the console (NOT the game screen).
Printint = function(value) end,

---@param width integer
---@param value integer
---Procedure that prints an integer to the console (NOT the game screen).
Printint2 = function(width, value) end,

---Procedure that prints a newline to the console (NOT the game screen).
Printnl = function() end,

---@param value string
---@return integer value
---Procedure that prints a string to the console (NOT the game screen).
Printstring = function(value) end,

---@param value_x number
---@param value_y number
---@param value_z number
---@return integer value
---Procedure that prints a vector to the console (NOT the game screen).
Printvector = function(value_x, value_y, value_z) end,

ResetLatestConsoleCommand = function() end,

---@param value number
---@return integer
---Returns input number rounded to the nearest number.
Round = function(value) end,

---@param value integer
---Sets the value for the timer A (in milliseconds).
Settimera = function(value) end,

---@param value integer
---Sets the value for the timer B (in milliseconds).
Settimerb = function(value) end,

---@param value integer
---Sets the value for the timer C (in milliseconds).
Settimerc = function(value) end,

---@param value integer
---@param count integer
---@return integer
---Implements C++ operator << (shift left).
ShiftLeft = function(value, count) end,

---@param value integer
---@param count integer
---@return integer
---Implements C++ operator >> (shift right).
ShiftRight = function(value, count) end,

---@param value number
---@return number
---Sine (input is in degrees).
Sin = function(value) end,

---@param value number
---@return number
---Square root.
Sqrt = function(value) end,

---@param scriptName string
---@param stackSize integer
---@return integer
---@return integer scriptName
---Function that starts a new script.
StartNewScript = function(scriptName, stackSize) end,

---@param scriptname string
---@param paramcount integer
---@param stacksize integer
---@return integer
---@return integer scriptname
---@return integer params
StartNewScriptWithArgs = function(scriptname, paramcount, stacksize) end,

StartProfileTimer = function() end,

StopProfileTimer = function() end,

---@return integer
---Gets the current value for the timer A.
Timera = function() end,

---@return integer
---Gets the current value for the timer B.
Timerb = function() end,

---@return integer
---Gets the current value for the timer C.
Timerc = function() end,

---@return number
Timestep = function() end,

---@return number
Timestepunwarped = function() end,

---@param value integer
---@return number
---Converts an integer to a floating-point number.
ToFloat = function(value) end,

---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@return number
---Distance between two points.
Vdist = function(x0, y0, z0, x1, y1, z1) end,

---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@return number
---Square of distance between two points (much less costly to compute).
Vdist2 = function(x0, y0, z0, x1, y1, z1) end,

---@param x number
---@param y number
---@param z number
---@return number
---Vector magnitude
Vmag = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
---@return number
---Square of vector magnitude (much less costly to compute)
Vmag2 = function(x, y, z) end,

---@param time integer
---Stops script execution for time in milliseconds.
Wait = function(time) end,

Waitunpaused = function() end,

Waitunwarped = function() end,

---@param startX number
---@param startY number
---@param startZ number
---@param endX number
---@param endY number
---@param endZ number
---@param blockObjects boolean
---@param blockVehicles boolean
---@param blockMap boolean
---Adds an axis aligned area that will block coverpoints from being automatically created.
AddCoverBlockingArea = function(startX, startY, startZ, endX, endY, endZ, blockObjects, blockVehicles, blockMap) end,

---@param x number
---@param y number
---@param z number
---@param arg4 integer
---@param direction number
---@param arg6 integer
---@param isPriorityToPlayer boolean
---@return integer coverpointIndex
---Adds a cover point in the given position to cover from direction (in degrees).
AddCoverPoint = function(x, y, z, arg4, direction, arg6, isPriorityToPlayer) end,

---@param charIndex integer
---@param targetX number
---@param targetY number
---@param targetZ number
---Adds a follow navmesh route to a currently running phone task at specified pace.
AddFollowNavmeshToPhoneTask = function(charIndex, targetX, targetY, targetZ) end,

AddPedQueue = function() end,

---@param ped integer
---@param x number
---@param y number
---@param z number
---@param arg5 number
AttachPedToShimmyEdge = function(ped, x, y, z, arg5) end,

BeginPedQueueMembershipList = function() end,

---@param ped integer
---@param direction integer
---@return boolean
CanPedShimmyInDirection = function(ped, direction) end,

---@param charIndex integer
---@param animGroup string
---@param animName string
---@param arg4 boolean
---@return integer animGroup
---@return integer animName
ChangeCharSitIdleAnim = function(charIndex, animGroup, animName, arg4) end,

---@param ped integer
ClearCharSecondaryTask = function(ped) end,

---@param ped integer
ClearCharTasks = function(ped) end,

---@param ped integer
ClearCharTasksImmediately = function(ped) end,

ClearEventPrecedence = function() end,

---@param taskSequence integer
ClearSequenceTask = function(taskSequence) end,

---@param taskSequence integer
CloseSequenceTask = function(taskSequence) end,

---@param posX number
---@param posY number
---@param posZ number
---@param range number
---@param mustBeFree boolean
---@return boolean
---Returns true if there is a scenario in the area given.
DoesScenarioExistInArea = function(posX, posY, posZ, range, mustBeFree) end,

---@param charIndex integer
---@param drop boolean
DropObject = function(charIndex, drop) end,

EndPedQueueMembershipList = function() end,

---@param x number
---@param y number
---@param z number
---@param arg4 string
---@param arg5 string
---@return integer arg4
---@return integer arg5
ExtendPatrolRoute = function(x, y, z, arg4, arg5) end,

FlushCoverBlockingAreas = function() end,

FlushPatrolRoute = function() end,

---@param ped integer
---@return boolean
---@return integer arg2
GetMobilePhoneTaskSubTask = function(ped) end,

---@param navmesh integer
---@return integer
GetNavmeshRouteResult = function(navmesh) end,

GetPedAtHeadOfQueue = function() end,

---@param charIndex integer
---@return integer
---Gets the peds climb state.
GetPedClimbState = function(charIndex) end,

---@param ped integer
---@return boolean
GetPedPathMayDropFromHeight = function(ped) end,

---@param ped integer
---@return boolean
GetPedPathMayUseClimbovers = function(ped) end,

---@param ped integer
---@return boolean
GetPedPathMayUseLadders = function(ped) end,

---@param ped integer
---@return boolean
GetPedPathWillAvoidDynamicObjects = function(ped) end,

---@param ped integer
---@param task integer
---@return integer status
GetScriptTaskStatus = function(ped, task) end,

---@param seq integer
---@return integer progress
GetSequenceProgress = function(seq) end,

GetSequenceProgressRecursive = function() end,

---@param ped integer
---@param x number
---@param y number
---@param z number
---@return integer level
GetSoundLevelAtCoords = function(ped, x, y, z) end,

---@param ped integer
---@return boolean
HasOverridenSitIdleAnimFinished = function(ped) end,

---@param ped integer
---@return boolean
IsCharGettingUp = function(ped) end,

---@param ped integer
---@return boolean
IsCharSittingIdle = function(ped) end,

---@param ped integer
---@return boolean
IsCharUsingMapAttractor = function(ped) end,

---@param x number
---@param y number
---@param z number
---@param arg4 integer
---@return boolean
IsSittingObjectNear = function(x, y, z, arg4) end,

---@param charIndex integer
---@param moveBlendRatio number
---Sets chars current move blend ratio.
ModifyCharMoveBlendRatio = function(charIndex, moveBlendRatio) end,

---@param charIndex integer
---@param moveState integer
---Modify chars move state.
ModifyCharMoveState = function(charIndex, moveState) end,

---@return integer pTaskSequence
OpenSequenceTask = function() end,

---@param flagid integer
PedQueueConsiderPedsWithFlagFalse = function(flagid) end,

---@param flagid integer
PedQueueConsiderPedsWithFlagTrue = function(flagid) end,

---@param flagid integer
PedQueueRejectPedsWithFlagFalse = function(flagid) end,

---@param flagid integer
PedQueueRejectPedsWithFlagTrue = function(flagid) end,

---@param coverPoint integer
RemoveCoverPoint = function(coverPoint) end,

RemovePedQueue = function() end,

SetAlternativeHeadForPedQueue = function() end,

---@param ped integer
---@param speed number
SetDriveTaskCruiseSpeed = function(ped, speed) end,

SetEventPrecedence = function() end,

---@param range number
SetGunshotSenseRangeForRiot2 = function(range) end,

---@param state integer
SetNextDesiredMoveState = function(state) end,

---@param ped integer
---@param value boolean
SetPedPathMayDropFromHeight = function(ped, value) end,

---@param ped integer
---@param value boolean
SetPedPathMayUseClimbovers = function(ped, value) end,

---@param ped integer
---@param value boolean
SetPedPathMayUseLadders = function(ped, value) end,

---@param ped integer
---@param set boolean
SetPedPathWillAvoidDynamicObjects = function(ped, set) end,

SetPedQueueMembershipList = function() end,

---@param sequenceId integer
---@param repeatMode integer
---Sets a sequence to repeat.
SetSequenceToRepeat = function(sequenceId, repeatMode) end,

---@param ped integer
---@param heading number
TaskAchieveHeading = function(ped, heading) end,

---@param charIndex integer
---@param targetCharIndex integer
---@param duration integer
TaskAimGunAtChar = function(charIndex, targetCharIndex, duration) end,

---@param charIndex integer
---@param x number
---@param y number
---@param z number
---@param duration integer
---Tells the ped to aim a gun at the coord.
TaskAimGunAtCoord = function(charIndex, x, y, z, duration) end,

---@param charIndex integer
---@param carIndex integer
---@param coordsX number
---@param coordsY number
---@param coordsZ number
---@param speed number
---@param drivingStyle integer
---@param carModel integer
---@param drivingMode integer
---@param targetRadius number
---@param straightLineDist number
---Gives a task to drive a car to a coord.
TaskCarDriveToCoord = function(charIndex, carIndex, coordsX, coordsY, coordsZ, speed, drivingStyle, carModel, drivingMode, targetRadius, straightLineDist) end,

---@param charIndex integer
---@param carIndex integer
---@param coordsX number
---@param coordsY number
---@param coordsZ number
---@param speed number
---@param drivingStyle integer
---@param carModel integer
---@param drivingMode integer
---@param targetRadius number
---@param straightLineDist number
---Same as TASK_CAR_DRIVE_TO_COORD, but car won't drive on the opposite side of the road into incoming traffic.
TaskCarDriveToCoordNotAgainstTraffic = function(charIndex, carIndex, coordsX, coordsY, coordsZ, speed, drivingStyle, carModel, drivingMode, targetRadius, straightLineDist) end,

---@param charIndex integer
---@param carIndex integer
---@param cruiseSpeed number
---@param drivingMode integer
---Tells a char to wander about in a car.
TaskCarDriveWander = function(charIndex, carIndex, cruiseSpeed, drivingMode) end,

---@param charIndex integer
---@param carIndex integer
---@param targetCarIndex integer
---@param missionType integer
---@param cruiseSpeed number
---@param drivingMode integer
---@param targetReachedDist number
---@param straightLineDist number
---Tells a character to perform a task when in a car against another car.
TaskCarMission = function(charIndex, carIndex, targetCarIndex, missionType, cruiseSpeed, drivingMode, targetReachedDist, straightLineDist) end,

---@param charIndex integer
---@param carIndex integer
---@param x number
---@param y number
---@param z number
---@param missionType integer
---@param cruiseSpeed number
---@param drivingMode integer
---@param targetReachedDist number
---@param straightLineDist number
---Tells a character in a car to target a coord.
TaskCarMissionCoorsTarget = function(charIndex, carIndex, x, y, z, missionType, cruiseSpeed, drivingMode, targetReachedDist, straightLineDist) end,

---@param charIndex integer
---@param carIndex integer
---@param x number
---@param y number
---@param z number
---@param missionType integer
---@param cruiseSpeed number
---@param drivingMode integer
---@param targetReachedDist number
---@param straightLineDist number
---Tells a character in a car to target a coord without driving on the opposite side of the road into incoming traffic.
TaskCarMissionCoorsTargetNotAgainstTraffic = function(charIndex, carIndex, x, y, z, missionType, cruiseSpeed, drivingMode, targetReachedDist, straightLineDist) end,

---@param charIndex integer
---@param carIndex integer
---@param targetCarIndex integer
---@param missionType integer
---@param cruiseSpeed number
---@param drivingMode integer
---@param targetReachedDist number
---@param straightLineDist number
---Tells a character to perform a task when in a car against another car without driving on the opposite side of the road into incoming traffic.
TaskCarMissionNotAgainstTraffic = function(charIndex, carIndex, targetCarIndex, missionType, cruiseSpeed, drivingMode, targetReachedDist, straightLineDist) end,

---@param charIndex integer
---@param carIndex integer
---@param targetCharIndex integer
---@param carMission integer
---@param speed number
---@param drivingMode integer
---@param targetReachedDist number
---@param straightLineDist number
---Tells a ped in a car to target another ped in a car.
TaskCarMissionPedTarget = function(charIndex, carIndex, targetCharIndex, carMission, speed, drivingMode, targetReachedDist, straightLineDist) end,

---@param charIndex integer
---@param carIndex integer
---@param targetCharIndex integer
---@param carMission integer
---@param speed number
---@param drivingMode integer
---@param targetReachedDist number
---@param straightLineDist number
---Same as TASK_CAR_MISSION_PED_TARGET, but car won't drive on the opposite side of the road into incoming traffic.
TaskCarMissionPedTargetNotAgainstTraffic = function(charIndex, carIndex, targetCharIndex, carMission, speed, drivingMode, targetReachedDist, straightLineDist) end,

---@param charIndex integer
---@param carIndex integer
---@param action integer
---@param time integer
---Gives the vehicle a temporary action.
TaskCarTempAction = function(charIndex, carIndex, action, time) end,

---@param charIndex integer
---@param coordsX number
---@param coordsY number
---@param coordsZ number
---@param headingDegrees number
---@param speed number
---Slides a char to the given coord.
TaskCharSlideToCoord = function(charIndex, coordsX, coordsY, coordsZ, headingDegrees, speed) end,

---@param charIndex integer
---@param coordsX number
---@param coordsY number
---@param coordsZ number
---@param headingDegrees number
---@param speed number
---@param animName string
---@param animDictName string
---@param blendDelta number
---@param isLooped boolean
---@param extractForwardVelocity boolean
---@param extractSidewaysVelocity boolean
---@param holdLastFrame boolean
---@param time integer
---@return integer animName
---@return integer animDictName
---Slides a char to a specific coord and plays an anim.
TaskCharSlideToCoordAndPlayAnim = function(charIndex, coordsX, coordsY, coordsZ, headingDegrees, speed, animName, animDictName, blendDelta, isLooped, extractForwardVelocity, extractSidewaysVelocity, holdLastFrame, time) end,

TaskCharSlideToCoordAndPlayAnimHdgRate = function() end,

---@param charIndex integer
---@param coordsX number
---@param coordsY number
---@param coordsZ number
---@param headingDegrees number
---@param speed number
---@param headingChangeRate number
---Slide a char to a coord and set the heading change rate.
TaskCharSlideToCoordHdgRate = function(charIndex, coordsX, coordsY, coordsZ, headingDegrees, speed, headingChangeRate) end,

---@param ped integer
---@param pednext integer
---@param arg3 boolean
---@param arg4 boolean
TaskChatWithChar = function(ped, pednext, arg3, arg4) end,

---@param ped integer
TaskClearLookAt = function(ped) end,

---@param charIndex integer
---@param usePlayerLaunchForce boolean
---Tells a char to perform the climb task.
TaskClimb = function(charIndex, usePlayerLaunchForce) end,

---@param charIndex integer
---@param fast boolean
---Tells a char to perform a climb ladder task.
TaskClimbLadder = function(charIndex, fast) end,

---@param ped integer
---@param target integer
TaskCombat = function(ped, target) end,

---@param ped integer
---@param radius number
TaskCombatHatedTargetsAroundChar = function(ped, radius) end,

---@param charIndex integer
---@param range number
---@param time integer
---Tells the char to combat all hated targets in the radius about the char for a time period.
TaskCombatHatedTargetsAroundCharTimed = function(charIndex, range, time) end,

---@param charIndex integer
---@param posX number
---@param posY number
---@param posZ number
---@param range number
---Tells the char to combat all hated targets in the area.
TaskCombatHatedTargetsInArea = function(charIndex, posX, posY, posZ, range) end,

---@param charIndex integer
---@param rollDir integer
---Makes the char peform a combat roll in the direction specified.
TaskCombatRoll = function(charIndex, rollDir) end,

---@param charIndex integer
---@param targetCharIndex integer
---@param time integer
---Tells a char to combat another char for a timed period.
TaskCombatTimed = function(charIndex, targetCharIndex, time) end,

---@param ped integer
TaskCower = function(ped) end,

---@param ped integer
TaskDead = function(ped) end,

---@param ped integer
---@param car integer
TaskDestroyCar = function(ped, car) end,

---@param ped integer
TaskDie = function(ped) end,

---@param ped integer
---@param pednext integer
---@param arg3 integer
---@param x number
---@param y number
---@param z number
---@param angle number
---@param arg8 integer
---@param arg9 boolean
---@param arg10 integer
TaskDriveBy = function(ped, pednext, arg3, x, y, z, angle, arg8, arg9, arg10) end,

---@param ped integer
---@param point integer
---@param radius number
TaskDrivePointRoute = function(ped, point, radius) end,

---@param charIndex integer
---@param carIndex integer
---@param cruiseSpeed number
---@param drivingStyle integer
---@param carModel integer
---@param drivingMode integer
---Tells a char to drive a point route.
TaskDrivePointRouteAdvanced = function(charIndex, carIndex, cruiseSpeed, drivingStyle, carModel, drivingMode) end,

---@param charIndex integer
---@param time integer
---Gives the char a ducking task.
TaskDuck = function(charIndex, time) end,

---@param charIndex integer
---@param carIndex integer
---@param time integer
---Tells a char to enter a car as driver.
TaskEnterCarAsDriver = function(charIndex, carIndex, time) end,

---@param charIndex integer
---@param carIndex integer
---@param time integer
---@param seat integer
---Tells a char to enter a car as passenger.
TaskEnterCarAsPassenger = function(charIndex, carIndex, time, seat) end,

---@param vehicle integer
TaskEveryoneLeaveCar = function(vehicle) end,

---@param coordsX number
---@param coordsY number
---@param coordsZ number
---Adds a point to a route.
TaskExtendRoute = function(coordsX, coordsY, coordsZ) end,

---@param charIndex integer
---@param direction integer
---@param downTime integer
TaskFallAndGetUp = function(charIndex, direction, downTime) end,

---@param charIndex integer
---@param charIndex2 integer
---@param arg3 number
---@param arg4 integer
---@param arg5 integer
---@param arg6 integer
---@param arg7 integer
---@param arg8 number
TaskFleeCharAnyMeans = function(charIndex, charIndex2, arg3, arg4, arg5, arg6, arg7, arg8) end,

TaskFlushRoute = function() end,

---@param charIndex integer
---@param charIndex2 integer
TaskFollowFootsteps = function(charIndex, charIndex2) end,

---@param ped integer
---@param x number
---@param y number
---@param z number
---@param arg5 integer
---@param arg6 integer
---@param arg7 number
---@param angle number
TaskFollowNavMeshAndSlideToCoord = function(ped, x, y, z, arg5, arg6, arg7, angle) end,

---@param ped integer
---@param x number
---@param y number
---@param z number
---@param arg5 integer
---@param arg6 integer
---@param arg7 number
---@param angle number
---@param rate number
TaskFollowNavMeshAndSlideToCoordHdgRate = function(ped, x, y, z, arg5, arg6, arg7, angle, rate) end,

---@param charIndex integer
---@param x number
---@param y number
---@param z number
---@param moveState integer
---@param time integer
---@param radius number
---Tells a character to follow the navmesh to the given coord.
TaskFollowNavMeshToCoord = function(charIndex, x, y, z, moveState, time, radius) end,

---@param charIndex integer
---@param x number
---@param y number
---@param z number
---@param moveState integer
---@param time integer
---@param radius number
TaskFollowNavMeshToCoordNoStop = function(charIndex, x, y, z, moveState, time, radius) end,

TaskFollowPatrolRoute = function() end,

---@param charIndex integer
---@param moveState integer
---@param mode integer
---Tells a char to follow a point route.
TaskFollowPointRoute = function(charIndex, moveState, mode) end,

---@param ped integer
---@param timeout integer
TaskGetOffBoat = function(ped, timeout) end,

---@param charIndex integer
---@param coordsX number
---@param coordsY number
---@param coordsZ number
---@param moveState integer
---@param time integer
---Tells the char to go to a coord, without using the navemesh.
TaskGoStraightToCoord = function(charIndex, coordsX, coordsY, coordsZ, moveState, time) end,

---@param charIndex integer
---@param carIndex integer
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param moveState integer
---@param time integer
---Tells the char to go to an offset coord from an car, without using the navmesh.
TaskGoStraightToCoordRelativeToCar = function(charIndex, carIndex, offsetX, offsetY, offsetZ, moveState, time) end,

---@param charIndex integer
---@param carIndex integer
---@param time integer
---@param seekRadius number
---Tells a char to go to a car.
TaskGotoCar = function(charIndex, carIndex, time, seekRadius) end,

---@param charIndex integer
---@param targetCharIndex integer
---@param time integer
---@param seekRadius number
---Tells a char to go to another char.
TaskGoToChar = function(charIndex, targetCharIndex, time, seekRadius) end,

---@param charIndex integer
---@param targetCharIndex integer
---@param seekRadius number
---@param aimRadius number
---Sends a char to an char aiming a gun.
TaskGotoCharAiming = function(charIndex, targetCharIndex, seekRadius, aimRadius) end,

---@param charIndex integer
---@param targetCharIndex integer
---@param time integer
---@param seekRadius number
---@param seekAngle number
---Tells the char to go to an offset from the target char.
TaskGotoCharOffset = function(charIndex, targetCharIndex, time, seekRadius, seekAngle) end,

---@param charIndex integer
---@param coordsX number
---@param coordsY number
---@param coordsZ number
---@param moveState integer
---@param carIndex integer
---Tells a char to go to a coord by any means.
TaskGoToCoordAnyMeans = function(charIndex, coordsX, coordsY, coordsZ, moveState, carIndex) end,

---@param charIndex integer
---@param goToX number
---@param goToY number
---@param goToZ number
---@param moveState integer
---@param targetDistance number
---@param slowDistance number
---@param aimAtCharIndex integer
---@param aimAtCoordX number
---@param aimAtCoordY number
---@param aimAtCoordZ number
---@param useNavmesh boolean
---The char will move to the coords while aiming at coord/char.
TaskGoToCoordWhileAiming = function(charIndex, goToX, goToY, goToZ, moveState, targetDistance, slowDistance, aimAtCharIndex, aimAtCoordX, aimAtCoordY, aimAtCoordZ, useNavmesh) end,

---@param charIndex integer
---@param goToX number
---@param goToY number
---@param goToZ number
---@param moveState integer
---@param targetDistance number
---@param slowDistance number
---@param shootAtCharIndex integer
---@param useNavmesh boolean
---The char will move to the coords while shooting at target char.
TaskGoToCoordWhileShooting = function(charIndex, goToX, goToY, goToZ, moveState, targetDistance, slowDistance, shootAtCharIndex, useNavmesh) end,

---@param charIndex integer
---@param objectIndex integer
---@param time integer
---@param seekRadius number
---Tells a char to go to a object.
TaskGoToObject = function(charIndex, objectIndex, time, seekRadius) end,

---@param charIndex integer
---@param defendPositionX number
---@param defendPositionY number
---@param defendPositionZ number
---@param heading number
---@param maxPatrolProximity number
---@param timer integer
---@param areaStartX number
---@param areaStartY number
---@param areaStartZ number
---@param areaEndX number
---@param areaEndY number
---@param areaEndZ number
---@param areaWidth number
---Sets the defensive area of the char and tells the char to guard the area passed.
TaskGuardAngledDefensiveArea = function(charIndex, defendPositionX, defendPositionY, defendPositionZ, heading, maxPatrolProximity, timer, areaStartX, areaStartY, areaStartZ, areaEndX, areaEndY, areaEndZ, areaWidth) end,

---@param charIndex integer
---@param defendPositionX number
---@param defendPositionY number
---@param defendPositionZ number
---@param heading number
---@param maxPatrolProximity number
---@param timer integer
---Tells the char to guard its assigned area, will assert if no defensive area is assigned.
TaskGuardAssignedDefensiveArea = function(charIndex, defendPositionX, defendPositionY, defendPositionZ, heading, maxPatrolProximity, timer) end,

---@param charIndex integer
---@param maxPatrolProximity number
---@param guardAreaRadius number
---@param setDefensiveArea boolean
---Tells the character to guard their current position with the area passed.
TaskGuardCurrentPosition = function(charIndex, maxPatrolProximity, guardAreaRadius, setDefensiveArea) end,

---@param charIndex integer
---@param defendPositionX number
---@param defendPositionY number
---@param defendPositionZ number
---@param heading number
---@param maxPatrolProximity number
---@param timer integer
---@param areaStartX number
---@param areaStartY number
---@param areaStartZ number
---@param areaRadius number
---Sets the defensive area of the char and tells the char to guard the area passed.
TaskGuardSphereDefensiveArea = function(charIndex, defendPositionX, defendPositionY, defendPositionZ, heading, maxPatrolProximity, timer, areaStartX, areaStartY, areaStartZ, areaRadius) end,

---@param charIndex integer
---@param time integer
---Gives the char a put hands up task.
TaskHandsUp = function(charIndex, time) end,

---@param charIndex integer
---@param carIndex integer
---@param targetCarIndex integer
---@param targetCharIndex integer
---@param x number
---@param y number
---@param z number
---@param mission integer
---@param cruiseSpeed number
---@param targetReachedDist integer
---@param heliOrientation number
---@param flightHeight integer
---@param minHeightAboveTerrain integer
---Gives the heli a mission.
TaskHeliMission = function(charIndex, carIndex, targetCarIndex, targetCharIndex, x, y, z, mission, cruiseSpeed, targetReachedDist, heliOrientation, flightHeight, minHeightAboveTerrain) end,

TaskJetpack = function() end,

---@param ped integer
---@param flag boolean
TaskJump = function(ped, flag) end,

---@param ped integer
TaskLeaveAnyCar = function(ped) end,

---@param ped integer
---@param vehicle integer
TaskLeaveCar = function(ped, vehicle) end,

---@param charIndex integer
---@param carIndex integer
---@param coordsX number
---@param coordsY number
---@param coordsZ number
---Tells a char to leave a car and flee the given coord.
TaskLeaveCarAndFlee = function(charIndex, carIndex, coordsX, coordsY, coordsZ) end,

---@param ped integer
---@param vehicle integer
TaskLeaveCarDontCloseDoor = function(ped, vehicle) end,

---@param ped integer
---@param vehicle integer
TaskLeaveCarImmediately = function(ped, vehicle) end,

---@param ped integer
---@param car integer
---@param direction boolean
TaskLeaveCarInDirection = function(ped, car, direction) end,

---@param ped integer
TaskLeaveGroup = function(ped) end,

---@param charIndex integer
---@param otherCharIndex integer
---@param time integer
---@param lookFlags integer
---Tells a character to look at an other character.
TaskLookAtChar = function(charIndex, otherCharIndex, time, lookFlags) end,

---@param charIndex integer
---@param x number
---@param y number
---@param z number
---@param time integer
---@param lookFlags integer
---Tells a character to look at an coord.
TaskLookAtCoord = function(charIndex, x, y, z, time, lookFlags) end,

---@param charIndex integer
---@param objectIndex integer
---@param time integer
---@param lookFlags integer
---Tells a character to look at an object.
TaskLookAtObject = function(charIndex, objectIndex, time, lookFlags) end,

---@param charIndex integer
---@param carIndex integer
---@param time integer
---@param lookFlags integer
---Tells a character to look at an car.
TaskLookAtVehicle = function(charIndex, carIndex, time, lookFlags) end,

---@param charIndex integer
---@param wander boolean
---Tells the char to have a mobile conversation.
TaskMobileConversation = function(charIndex, wander) end,

---@param charIndex integer
---@param carIndex integer
---@param arg3 integer
TaskOpenDriverDoor = function(charIndex, carIndex, arg3) end,

---@param charIndex integer
---@param carIndex integer
---@param arg3 integer
---@param arg4 integer
TaskOpenPassengerDoor = function(charIndex, carIndex, arg3, arg4) end,

---@param charIndex integer
---@param time integer
TaskPause = function(charIndex, time) end,

---@param ped integer
---@param taskSequence integer
TaskPerformSequence = function(ped, taskSequence) end,

---@param charIndex integer
---@param sequenceIndex integer
---@param progress1 integer
---@param progress2 integer
---Performs a sequence except that the char will skip the elements of the sequence in the range (0 to progress1).
TaskPerformSequenceFromProgress = function(charIndex, sequenceIndex, progress1, progress2) end,

---@param charIndex integer
---@param sequenceIndex integer
---Tells a char to perform a given sequence which is not synced over the network.
TaskPerformSequenceLocally = function(charIndex, sequenceIndex) end,

---@param charIndex integer
---@param objectIndex integer
---@param x number
---@param y number
---@param z number
---@param arg6 boolean
TaskPickupAndCarryObject = function(charIndex, objectIndex, x, y, z, arg6) end,

---@param charIndex integer
---@param animName string
---@param animDictName string
---@param speed number
---@param flag1 boolean
---@param flag2 boolean
---@param flag3 boolean
---@param flag4 boolean
---@param timeToPlay integer
---@return integer animName
---@return integer animDictName
---Plays an anim on the specified char.
TaskPlayAnim = function(charIndex, animName, animDictName, speed, flag1, flag2, flag3, flag4, timeToPlay) end,

---@param charIndex integer
---@param animName string
---@param animDictName string
---@param speed number
---@param flag1 boolean
---@param flag2 boolean
---@param timeToPlay integer
---@return integer animName
---@return integer animDictName
TaskPlayAnimFacial = function(charIndex, animName, animDictName, speed, flag1, flag2, timeToPlay) end,

---@param charIndex integer
---@param animName string
---@param animDictName string
---@param speed number
---@param flag1 boolean
---@param flag2 boolean
---@param flag3 boolean
---@param flag4 boolean
---@param timeToPlay integer
---@return integer animName
---@return integer animDictName
TaskPlayAnimNonInterruptable = function(charIndex, animName, animDictName, speed, flag1, flag2, flag3, flag4, timeToPlay) end,

---@param charIndex integer
---@param animName string
---@param animDictName string
---@param speed number
---@param flag1 boolean
---@param flag2 boolean
---@param flag3 boolean
---@param flag4 boolean
---@param timeToPlay integer
---@return integer animName
---@return integer animDictName
TaskPlayAnimOnClone = function(charIndex, animName, animDictName, speed, flag1, flag2, flag3, flag4, timeToPlay) end,

---@param charIndex integer
---@param animName string
---@param animDictName string
---@param speed number
---@return integer animName
---@return integer animDictName
TaskPlayAnimReadyToBeExecuted = function(charIndex, animName, animDictName, speed) end,

---@param charIndex integer
---@param animName string
---@param animDictName string
---@param speed number
---@param flag1 boolean
---@param flag2 boolean
---@param flag3 boolean
---@param flag4 boolean
---@param timeToPlay integer
---@return integer animName
---@return integer animDictName
TaskPlayAnimSecondary = function(charIndex, animName, animDictName, speed, flag1, flag2, flag3, flag4, timeToPlay) end,

---@param charIndex integer
---@param animName string
---@param animDictName string
---@param speed number
---@param flag1 boolean
---@param flag2 boolean
---@param flag3 boolean
---@param flag4 boolean
---@param timeToPlay integer
---@return integer animName
---@return integer animDictName
TaskPlayAnimSecondaryInCar = function(charIndex, animName, animDictName, speed, flag1, flag2, flag3, flag4, timeToPlay) end,

---@param charIndex integer
---@param animName string
---@param animDictName string
---@param speed number
---@param flag1 boolean
---@param flag2 boolean
---@param flag3 boolean
---@param flag4 boolean
---@param timeToPlay integer
---@return integer animName
---@return integer animDictName
TaskPlayAnimSecondaryNoInterrupt = function(charIndex, animName, animDictName, speed, flag1, flag2, flag3, flag4, timeToPlay) end,

---@param charIndex integer
---@param animName string
---@param animDictName string
---@param speed number
---@param flag1 boolean
---@param flag2 boolean
---@param flag3 boolean
---@param flag4 boolean
---@param timeToPlay integer
---@return integer animName
---@return integer animDictName
TaskPlayAnimSecondaryUpperBody = function(charIndex, animName, animDictName, speed, flag1, flag2, flag3, flag4, timeToPlay) end,

---@param charIndex integer
---@param animName string
---@param animDictName string
---@param speed number
---@param flag1 boolean
---@param flag2 boolean
---@param flag3 boolean
---@param flag4 boolean
---@param timeToPlay integer
---@return integer animName
---@return integer animDictName
TaskPlayAnimUpperBody = function(charIndex, animName, animDictName, speed, flag1, flag2, flag3, flag4, timeToPlay) end,

---@param charIndex integer
---@param animName string
---@param animDictName string
---@param speed number
---@param flag1 boolean
---@param flag2 boolean
---@param flag3 boolean
---@param flag4 boolean
---@param flag5 boolean
---@param flag6 boolean
---@param flag7 boolean
---@param timeToPlay integer
---@return integer animName
---@return integer animDictName
TaskPlayAnimWithAdvancedFlags = function(charIndex, animName, animDictName, speed, flag1, flag2, flag3, flag4, flag5, flag6, flag7, timeToPlay) end,

---@param charIndex integer
---@param animName string
---@param animDictName string
---@param speed number
---@param timeToPlay integer
---@param flags integer
---@return integer animName
---@return integer animDictName
TaskPlayAnimWithFlags = function(charIndex, animName, animDictName, speed, timeToPlay, flags) end,

---@param charIndex integer
---@param animName string
---@param animDictName string
---@param speed number
---@param timeToPlay integer
---@param flags integer
---@param startPhase number
---@return integer animName
---@return integer animDictName
TaskPlayAnimWithFlagsAndStartPhase = function(charIndex, animName, animDictName, speed, timeToPlay, flags, startPhase) end,

---@param charIndex integer
---@param coverPosX number
---@param coverPosY number
---@param coverPosZ number
---@param time integer
---Puts the char directly into cover at the nearest point to the position specified.
TaskPutCharDirectlyIntoCover = function(charIndex, coverPosX, coverPosY, coverPosZ, time) end,

TaskSay = function() end,

---@param charIndex integer
---@param otherCharIndex integer
---@param time integer
---The char will seek cover from the given chars location.
TaskSeekCoverFromPed = function(charIndex, otherCharIndex, time) end,

---@param charIndex integer
---@param fromCoordsX number
---@param fromCoordsY number
---@param fromCoordsZ number
---@param time integer
---The char will seek cover from the given coordinates.
TaskSeekCoverFromPos = function(charIndex, fromCoordsX, fromCoordsY, fromCoordsZ, time) end,

---@param charIndex integer
---@param coverCoordsX number
---@param coverCoordsY number
---@param coverCoordsZ number
---@param fromCoordsX number
---@param fromCoordsY number
---@param fromCoordsZ number
---@param time integer
---Tells a char to seek cover to given coords coverCoords in such a way as to hide from fromCoords.
TaskSeekCoverToCoords = function(charIndex, coverCoordsX, coverCoordsY, coverCoordsZ, fromCoordsX, fromCoordsY, fromCoordsZ, time) end,

---@param charIndex integer
---@param coverpointIndex integer
---@param fromCoordsX number
---@param fromCoordsY number
---@param fromCoordsZ number
---@param time integer
---Task making the char seek cover at the scripted cover point specified in coverpointIndex.
TaskSeekCoverToCoverPoint = function(charIndex, coverpointIndex, fromCoordsX, fromCoordsY, fromCoordsZ, time) end,

---@param charIndex integer
---@param objectIndex integer
---@param fromCoordsX number
---@param fromCoordsY number
---@param fromCoordsZ number
---@param time integer
---Task making the char seek cover at the object.
TaskSeekCoverToObject = function(charIndex, objectIndex, fromCoordsX, fromCoordsY, fromCoordsZ, time) end,

---@param ped integer
---@param dm integer
TaskSetCharDecisionMaker = function(ped, dm) end,

---@param ped integer
---@param dm integer
TaskSetCombatDecisionMaker = function(ped, dm) end,

---@param ped integer
---@param ignore boolean
TaskSetIgnoreWeaponRangeFlag = function(ped, ignore) end,

---@param ped integer
TaskShakeFist = function(ped) end,

---@param charIndex integer
---@param arg2 boolean
TaskShimmy = function(charIndex, arg2) end,

---@param charIndex integer
TaskShimmyClimbUp = function(charIndex) end,

---@param charIndex integer
---@param direction integer
TaskShimmyInDirection = function(charIndex, direction) end,

---@param charIndex integer
TaskShimmyLetGo = function(charIndex) end,

---@param shooter integer
---@param victim integer
---@param time integer
---@param firingType integer
---Gives a shoot at char task.
TaskShootAtChar = function(shooter, victim, time, firingType) end,

---@param charIndex integer
---@param x number
---@param y number
---@param z number
---@param duration integer
---@param firingType integer
---Tells the char to shoot at given coord.
TaskShootAtCoord = function(charIndex, x, y, z, duration, firingType) end,

---@param charIndex integer
---@param carIndex integer
---Tells the char to move across to the next seat in the car.
TaskShuffleToNextCarSeat = function(charIndex, carIndex) end,

---@param charIndex integer
---@param arg2 integer
---@param arg3 integer
---@param time integer
TaskSitDown = function(charIndex, arg2, arg3, time) end,

---@param charIndex integer
---@param arg2 integer
---@param arg3 integer
---@param time integer
TaskSitDownInstantly = function(charIndex, arg2, arg3, time) end,

---@param charIndex integer
---@param arg2 integer
---@param arg3 integer
---@param x number
---@param y number
---@param z number
---@param objectHash integer
---@param arg8 number
---@param time integer
---@param arg10 boolean
TaskSitDownOnNearestObject = function(charIndex, arg2, arg3, x, y, z, objectHash, arg8, time, arg10) end,

---@param charIndex integer
---@param arg2 integer
---@param arg3 integer
---@param objectIndex integer
---@param arg5 number
---@param arg6 number
---@param arg7 number
---@param arg8 number
---@param time integer
---@param arg10 boolean
TaskSitDownOnObject = function(charIndex, arg2, arg3, objectIndex, arg5, arg6, arg7, arg8, time, arg10) end,

---@param charIndex integer
---@param arg2 integer
---@param arg3 integer
---@param x number
---@param y number
---@param z number
---@param heading number
---@param time integer
TaskSitDownOnSeat = function(charIndex, arg2, arg3, x, y, z, heading, time) end,

TaskSitDownPlayAnim = function() end,

---@param charIndex integer
---@param fleeFromCharIndex integer
---@param safeDistance number
---@param fleeTime integer
---Tells a character to flee from the given character.
TaskSmartFleeChar = function(charIndex, fleeFromCharIndex, safeDistance, fleeTime) end,

---@param charIndex integer
---@param fleeFromCharIndex integer
---@param safeDistance number
---@param fleeTime integer
TaskSmartFleeCharPreferringPavements = function(charIndex, fleeFromCharIndex, safeDistance, fleeTime) end,

---@param charIndex integer
---@param x number
---@param y number
---@param z number
---@param safeDistance number
---@param fleeTime integer
---Tells a character to flee the given coord.
TaskSmartFleePoint = function(charIndex, x, y, z, safeDistance, fleeTime) end,

---@param ped integer
---@param x number
---@param y number
---@param z number
---@param radius number
---@param time_prob integer
TaskSmartFleePointPreferringPavements = function(ped, x, y, z, radius, time_prob) end,

TaskSpaceShipGoToCoord = function() end,

---@param ped integer
---@param x number
---@param y number
---@param z number
---@param arg5 number
---@param arg6 number
---@param arg7 boolean
---@param arg8 integer
TaskStandGuard = function(ped, x, y, z, arg5, arg6, arg7, arg8) end,

---@param ped integer
---@param duration integer
TaskStandStill = function(ped, duration) end,

---@param charIndex integer
---@param scenarioName string
---@param x number
---@param y number
---@param z number
---@param heading number
---@return integer scenarioName
---The char will move or warp to the position and heading given, then start the scenario passed.
TaskStartScenarioAtPosition = function(charIndex, scenarioName, x, y, z, heading) end,

---@param charIndex integer
---@param scenarioName string
---@param timeToLeave integer
---@return integer scenarioName
---Puts the char into the given scenario immediately.
TaskStartScenarioInPlace = function(charIndex, scenarioName, timeToLeave) end,

---@param charIndex integer
---@param drawWeapon boolean
---Tells the char to swap their weapon.
TaskSwapWeapon = function(charIndex, drawWeapon) end,

---@param ped integer
---@param x number
---@param y number
---@param z number
TaskSwimToCoord = function(ped, x, y, z) end,

---@param ped integer
---@param arg2 integer
TaskTired = function(ped, arg2) end,

---@param ped integer
---@param arg2 integer
TaskToggleDuck = function(ped, arg2) end,

---@param ped integer
---@param arg2 boolean
---@param arg3 boolean
---@param arg4 boolean
TaskTogglePedThreatScanner = function(ped, arg2, arg3, arg4) end,

---@param ped integer
---@param targetPed integer
TaskTurnCharToFaceChar = function(ped, targetPed) end,

---@param ped integer
---@param x number
---@param y number
---@param z number
TaskTurnCharToFaceCoord = function(ped, x, y, z) end,

---@param ped integer
---@param use boolean
TaskUseMobilePhone = function(ped, use) end,

---@param charIndex integer
---@param time integer
---Tells the ped to use a mobile phone for a time period.
TaskUseMobilePhoneTimed = function(charIndex, time) end,

---@param charIndex integer
---@param positionX number
---@param positionY number
---@param positionZ number
---@param range number
---Puts the char into the closest scenario to the pos.
TaskUseNearestScenarioToPos = function(charIndex, positionX, positionY, positionZ, range) end,

---@param charIndex integer
---@param positionX number
---@param positionY number
---@param positionZ number
---@param range number
---Warps the char into the closest scenario to the pos.
TaskUseNearestScenarioToPosWarp = function(charIndex, positionX, positionY, positionZ, range) end,

---@param ped integer
TaskWanderStandard = function(ped) end,

---@param ped integer
---@param vehicle integer
TaskWarpCharIntoCarAsDriver = function(ped, vehicle) end,

---@param charIndex integer
---@param carIndex integer
---@param seat integer
TaskWarpCharIntoCarAsPassenger = function(charIndex, carIndex, seat) end,

AbortAllGarageActivity = function() end,

---@param heli integer
---@param cheat integer
ActivateHeliSpeedCheat = function(heli, cheat) end,

---@param car integer
AddCarToMissionDeletionList = function(car) end,

---@param car integer
---@param stuckdif number
---@param timeout integer
AddStuckCarCheck = function(car, stuckdif, timeout) end,

---@param car integer
---@param stuckdif number
---@param time integer
---@param flag0 boolean
---@param flag1 boolean
---@param flag2 boolean
---@param flag3 boolean
AddStuckCarCheckWithWarp = function(car, stuckdif, time, flag0, flag1, flag2, flag3) end,

---@param vehicle integer
AddUpsidedownCarCheck = function(vehicle) end,

---@param boat integer
---@param anchor boolean
AnchorBoat = function(boat, anchor) end,

---@param carIndex integer
---@param type integer
---@param forceX number
---@param forceY number
---@param forceZ number
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param component integer
---@param localForce boolean
---@param localOffset boolean
---@param scaleByMass boolean
---Apply a force to an car.
ApplyForceToCar = function(carIndex, type, forceX, forceY, forceZ, offsetX, offsetY, offsetZ, component, localForce, localOffset, scaleByMass) end,

---@param vehicle integer
---@return boolean
AreTaxiLightsOn = function(vehicle) end,

---@param car0 integer
---@param car1 integer
---@param arg3 integer
---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
AttachCarToCar = function(car0, car1, arg3, x0, y0, z0, x1, y1, z1) end,

AttachCarToCarPhysically = function() end,

---@param car integer
---@param obj integer
---@param arg3 number
---@param arg4 number
---@param arg5 number
---@param arg6 number
---@param arg7 number
---@param arg8 number
---@param arg9 number
AttachCarToObject = function(car, obj, arg3, arg4, arg5, arg6, arg7, arg8, arg9) end,

AttachCarToObjectPhysically = function() end,

---@param carIndex integer
---@param door integer
---@param visibility boolean
BreakCarDoor = function(carIndex, door, visibility) end,

---@param carIndex integer
---@param wheelNumber integer
---Bursts a cars tyre.
BurstCarTyre = function(carIndex, wheelNumber) end,

---@param vehicle integer
---@param colour1 integer
---@param colour2 integer
ChangeCarColour = function(vehicle, colour1, colour2) end,

---@param garageName string
---@param newGarageType integer
---@return integer garageName
---Changes the garage type.
ChangeGarageType = function(garageName, newGarageType) end,

---@param car integer
ChangePlaybackToUseAi = function(car) end,

---@param car integer
---@param timernum integer
---@param timeout integer
---@return boolean
CheckStuckTimer = function(car, timernum, timeout) end,

---@param vehicle integer
ClearCarLastDamageEntity = function(vehicle) end,

---@param vehicleIndex integer
ClearRoomForCar = function(vehicleIndex) end,

---@param vehicle integer
CloseAllCarDoors = function(vehicle) end,

---@param garageName string
---@return integer garageName
CloseGarage = function(garageName) end,

---@param carIndex integer
---@param doorIndex integer
---@param latch integer
---@param angle number
ControlCarDoor = function(carIndex, doorIndex, latch, angle) end,

---@param modelHashKey integer
---@param x number
---@param y number
---@param z number
---@param registerAsNetworkObject boolean
---@return integer vehicleIndex
---Creates a car at the specified coords.
CreateCar = function(modelHashKey, x, y, z, registerAsNetworkObject) end,

---@param x number
---@param y number
---@param z number
---@param heading number
---@param maxLength number
---@param maxWidth number
---@param modelHashKey integer
---@param remap1 integer
---@param remap2 integer
---@param remap3 integer
---@param remap4 integer
---@param highPriorityFlag boolean
---@param chanceOfVehicleAlarm integer
---@param chanceOfLocked integer
---@return integer carGeneratorIndex
---Creates a car generator.
CreateCarGenerator = function(x, y, z, heading, maxLength, maxWidth, modelHashKey, remap1, remap2, remap3, remap4, highPriorityFlag, chanceOfVehicleAlarm, chanceOfLocked) end,

---This native function doesn't work (nullsub).
CreateCarGeneratorWithPlate = function() end,

---@param minX number
---@param minY number
---@param minZ number
---@param maxX number
---@param maxY number
---@param maxZ number
---For all car generators in this area a vehicle is created (if the space is clear).
CreateCarsOnGeneratorsInArea = function(minX, minY, minZ, maxX, maxY, maxZ) end,

---@param variation integer
---@param x number
---@param y number
---@param z number
---@param directionFlag boolean
---@return integer carIndex
---Create a mission train.
CreateMissionTrain = function(variation, x, y, z, directionFlag) end,

---@param x number
---@param y number
---@param z number
---@param radius number
CreateRandomCarForCarPark = function(x, y, z, radius) end,

---@param car integer
---@param x number
---@param y number
---@param z number
---@param unkforce0 number
---@param unkforce1 number
---@param flag boolean
DamageCar = function(car, x, y, z, unkforce0, unkforce1, flag) end,

DeleteAllTrains = function() end,

---@param pVehicle integer
---@return integer pVehicle
DeleteCar = function(pVehicle) end,

---@param handle integer
DeleteCarGenerator = function(handle) end,

---@param pTrain integer
---@return integer pTrain
DeleteMissionTrain = function(pTrain) end,

DeleteMissionTrains = function() end,

---@param carIndex integer
DetachCar = function(carIndex) end,

---@param flag0 boolean
---@param flag1 boolean
DisableCarGenerators = function(flag0, flag1) end,

---@param disable boolean
DisableCarGeneratorsWithHeli = function(disable) end,

---This native function doesn't work (nullsub).
DisplayPlaybackRecordedCar = function() end,

---@param car integer
---@return boolean
DoesCarHaveHydraulics = function(car) end,

---@param vehicle integer
---@return boolean
DoesCarHaveRoof = function(vehicle) end,

---@param vehicle integer
---@return boolean
DoesCarHaveStuckCarCheck = function(vehicle) end,

---@param vehicleIndex integer
---@return boolean
---Check that vehicle exists in the world.
DoesVehicleExist = function(vehicleIndex) end,

DontSuppressAnyCarModels = function() end,

---@param modelHash integer
DontSuppressCarModel = function(modelHash) end,

---@param carIndex integer
---@param addExplosion boolean
---@param keepDamage boolean
---Explodes the specified car with an explosion or not.
ExplodeCar = function(carIndex, addExplosion, keepDamage) end,

---@param car integer
---@param explode boolean
ExplodeCarInCutscene = function(car, explode) end,

---@param car integer
---@param flag0 boolean
---@param flag1 boolean
---@param flag2 boolean
ExplodeCarInCutsceneShakeAndBit = function(car, flag0, flag1, flag2) end,

---@param vehicle integer
ExtinguishCarFire = function(vehicle) end,

---@param car integer
---@return number
FindPositionInRecording = function(car) end,

---@param car integer
---@return number
FindTimePositionInRecording = function(car) end,

---@param train integer
---@return integer
FindTrainDirection = function(train) end,

---@param vehicle integer
FixCar = function(vehicle) end,

---@param carIndex integer
---@param wheelNumber integer
---Fixes a cars burts tyre.
FixCarTyre = function(carIndex, wheelNumber) end,

---@param off boolean
ForceAllVehicleLightsOff = function(off) end,

---@param car integer
---@param lights integer
ForceCarLights = function(car, lights) end,

---@param set boolean
ForceGenerateParkedCarsTooCloseToOthers = function(set) end,

---@param force boolean
ForceHighLod = function(force) end,

---@param modelHash integer
ForceRandomCarModel = function(modelHash) end,

---@param vehicle integer
---@param frozen boolean
FreezeCarPosition = function(vehicle, frozen) end,

---@param vehicle integer
---@param frozen boolean
FreezeCarPositionAndDontLoadCollision = function(vehicle, frozen) end,

---@param car integer
---@param animname0 string
---@param animname1 string
---@return integer animname0
---@return integer animname1
---@return number time
GetCarAnimCurrentTime = function(car, animname0, animname1) end,

---@param car integer
---@param animname0 string
---@param animname1 string
---@return integer animname0
---@return integer animname1
---@return number time
GetCarAnimTotalTime = function(car, animname0, animname1) end,

---@param car0 integer
---@return integer car1
GetCarBlockingCar = function(car0) end,

---@param vehicle integer
---@return integer pColour1
---@return integer pColour2
GetCarColours = function(vehicle) end,

---@param vehicle integer
---@return number pX
---@return number pY
---@return number pZ
GetCarCoordinates = function(vehicle) end,

---@param vehicle integer
---@param x number
---@param y number
---@param z number
---@return number pDeformation_x
---@return number pDeformation_y
---@return number pDeformation_z
GetCarDeformationAtPos = function(vehicle, x, y, z) end,

---@param carIndex integer
---@return integer lockState
---Gets the car lock status.
GetCarDoorLockStatus = function(carIndex) end,

---@param car integer
---@return number vec_x
---@return number vec_y
---@return number vec_z
GetCarForwardVector = function(car) end,

---@param vehicle integer
---@return number pValue
GetCarForwardX = function(vehicle) end,

---@param vehicle integer
---@return number pValue
GetCarForwardY = function(vehicle) end,

---@param vehicle integer
---@return number pValue
GetCarHeading = function(vehicle) end,

---@param carIndex integer
---@return integer health
GetCarHealth = function(carIndex) end,

---@param car integer
---@return integer livery
GetCarLivery = function(car) end,

---@param car integer
---@return number mass
GetCarMass = function(car) end,

---@param vehicleIndex integer
---@return integer modelHashKey
---Get the model hash for the car.
GetCarModel = function(vehicleIndex) end,

---@param modelHashKey integer
---@return integer value
---Gets the monetary value of a car's model.
GetCarModelValue = function(modelHashKey) end,

---@param vehicle integer
---@return number pValue
GetCarPitch = function(vehicle) end,

---@param vehicle integer
---@return number pValue
GetCarRoll = function(vehicle) end,

---@param car integer
---@return integer
GetCarSirenHealth = function(car) end,

---@param carIndex integer
---@return number pValue
---Gets the speed an car is travelling in a forward direction (m/sec).
GetCarSpeed = function(carIndex) end,

---@param carIndex integer
---@param localResult boolean
---@return number pVector_x
---@return number pVector_y
---@return number pVector_z
---Get velocity vector of an car.
GetCarSpeedVector = function(carIndex, localResult) end,

---@param vehicle integer
---@return number pValue
GetCarUprightValue = function(vehicle) end,

---@param carIndex integer
---@param seat integer
---@return integer charIndex
---Gets the char in a car seat.
GetCharInCarPassengerSeat = function(carIndex, seat) end,

---@param centreX number
---@param centreY number
---@param centreZ number
---@param radius number
---@param modelHashKey integer
---@param searchFlags integer
---@return integer
---Get the closet random vehicle to a coord.
GetClosestCar = function(centreX, centreY, centreZ, radius, modelHashKey, searchFlags) end,

---@return integer modelHash
---Gets the basic police car model irrespective of wanted level.
GetCurrentBasicPoliceCarModel = function() end,

---@param car integer
---@return integer
GetCurrentPlaybackNumberForCar = function(car) end,

---@return integer modelHash
---Gets the basic police car model.
GetCurrentPoliceCarModel = function() end,

---@param trainIndex integer
---@return integer
GetCurrentStationForTrain = function(trainIndex) end,

---@return integer modelHash
---Gets the current taxi model loaded.
GetCurrentTaxiCarModel = function() end,

---@param vehicle integer
---@return number pX
---@return number pY
---@return number pZ
GetDeadCarCoordinates = function(vehicle) end,

---@param modelHashKey integer
---@return string
---Gets the the model name of the vehicle.
GetDisplayNameFromVehicleModel = function(modelHashKey) end,

---@param carIndex integer
---@param doorNumber integer
---@return number angleRatio
---Gets the door angle of a car door between 0.0 and 1.0.
GetDoorAngleRatio = function(carIndex, doorNumber) end,

---@param vehicle integer
---@return integer pPed
GetDriverOfCar = function(vehicle) end,

---@param vehicle integer
---@return number
GetEngineHealth = function(vehicle) end,

---@param vehicle integer
---@return integer pColour1
---@return integer pColour2
GetExtraCarColours = function(vehicle) end,

---@param carIndex integer
---@param posX number
---@param posY number
---@param posZ number
---@param isWorldPos boolean
---@param wantWorldResult boolean
---@return number
---Gets the height of the car.
GetHeightOfVehicle = function(carIndex, posX, posY, posZ, isWorldPos, wantWorldResult) end,

---@param vehicle integer
---@return integer pInterior
GetInteriorFromCar = function(vehicle) end,

---@param vehicleIndex integer
---@return integer roomKey
GetKeyForCarInRoom = function(vehicleIndex) end,

---@param carIndex integer
---@return integer maxNumber
---Get the max number of pasengers a car can have.
GetMaximumNumberOfPassengers = function(carIndex) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@return integer pVehicle
GetNearestCableCar = function(x, y, z, radius) end,

---@param trainIndex integer
---@return integer
GetNextStationForTrain = function(trainIndex) end,

---@param carIndex integer
---@return integer numPassengers
---Get the number of passengers in a car.
GetNumberOfPassengers = function(carIndex) end,

---@param carIndex integer
---@return integer numColours
---Gets the number of car colours.
GetNumCarColours = function(carIndex) end,

---@param car integer
---@return integer num
GetNumCarLiveries = function(car) end,

---@param vehicle integer
---@param x number
---@param y number
---@param z number
---@return number pOffX
---@return number pOffY
---@return number pOffZ
GetOffsetFromCarGivenWorldCoords = function(vehicle, x, y, z) end,

---@param vehicle integer
---@param x number
---@param y number
---@param z number
---@return number pOffX
---@return number pOffY
---@return number pOffZ
GetOffsetFromCarInWorldCoords = function(vehicle, x, y, z) end,

---@param car0 integer
---@param car1 integer
---@return number arg3_x
---@return number arg3_y
---@return number arg3_z
---@return number arg4_x
---@return number arg4_y
---@return number arg4_z
GetOffsetsForAttachCarToCar = function(car0, car1) end,

---@param vehicle integer
---@return number
GetPetrolTankHealth = function(vehicle) end,

---@param plane integer
---@return number pos
GetPlaneUndercarriagePosition = function(plane) end,

---@param CarRec integer
---@param time number
---@return number pos
GetPositionOfCarRecordingAtTime = function(CarRec, time) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param arg5 integer
---@param arg6 integer
---@return integer veh
GetRandomCarBackBumperInSphere = function(x, y, z, radius, arg5, arg6) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param flag0 boolean
---@param flag1 boolean
---@param flag2 boolean
---@return integer handle
GetRandomCarFrontBumperInSphereNoSave = function(x, y, z, radius, flag0, flag1, flag2) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param modelHash integer
---@param searchFlags integer
---@return integer carIndex
---Gets a random car in sphere area.
GetRandomCarInSphere = function(x, y, z, radius, modelHash, searchFlags) end,

---@param x number
---@param y number
---@param z number
---@param radius number
---@param modelHash integer
---@param flag boolean
---@return integer carIndex
GetRandomCarInSphereNoSave = function(x, y, z, radius, modelHash, flag) end,

---@param onlyPickNormalCarsFlag boolean
---@return integer modelHash
---@return integer vehicleClass
---Gets a random car model from memory.
GetRandomCarModelInMemory = function(onlyPickNormalCarsFlag) end,

---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param range number
---@param modelHash integer
---@return integer carIndex
GetRandomCarOfTypeInAngledAreaNoSave = function(x0, y0, x1, y1, range, modelHash) end,

---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param modelHash integer
---@return integer carIndex
GetRandomCarOfTypeInAreaNoSave = function(x0, y0, x1, y1, modelHash) end,

---@param trainIndex integer
---@param stationId integer
---@return string
GetStationName = function(trainIndex, stationId) end,

---@param train integer
---@return number
GetTimeTilNextStation = function(train) end,

---@param CarRec integer
---@return number
GetTotalDurationOfCarRecording = function(CarRec) end,

---@param train integer
---@return integer caboose
GetTrainCaboose = function(train) end,

---@param train integer
---@param num integer
---@return integer carriage
GetTrainCarriage = function(train, num) end,

GetVehicleClass = function() end,

---@param veh integer
---@param component_id integer
---@param flag boolean
---@return boolean
---@return number arg3_x
---@return number arg3_y
---@return number arg3_z
---@return number arg4_x
---@return number arg4_y
---@return number arg4_z
---@return integer arg5
GetVehicleComponentInfo = function(veh, component_id, flag) end,

---@param vehicle integer
---@return number pIntensity
GetVehicleDirtLevel = function(vehicle) end,

---@param veh integer
---@return number
GetVehicleEngineRevs = function(veh) end,

---@param veh integer
---@return integer
GetVehicleGear = function(veh) end,

---@param veh integer
---@return number arg2
---@return number arg3
---@return number arg4
---@return number arg5
GetVehicleQuaternion = function(veh) end,

---@param veh integer
HandVehicleControlBackToPlayer = function(veh) end,

---@param vehicle integer
---@param otherCar integer
---@return boolean
HasCarBeenDamagedByCar = function(vehicle, otherCar) end,

---@param vehicle integer
---@param ped integer
---@return boolean
HasCarBeenDamagedByChar = function(vehicle, ped) end,

---@param car integer
---@return boolean
HasCarBeenDroppedOff = function(car) end,

---@param vehicle integer
---@return boolean
HasCarBeenResprayed = function(vehicle) end,

---@param CarRec integer
---@return boolean
HasCarRecordingBeenLoaded = function(CarRec) end,

---@param car integer
---@return boolean
HasCarStoppedBecauseOfLight = function(car) end,

---@return boolean
HasResprayHappened = function() end,

---@param vehicle integer
---@return boolean
IsBigVehicle = function(vehicle) end,

---@param vehicle integer
---@return boolean
IsCarAMissionCar = function(vehicle) end,

---@param vehicle integer
---@return boolean
IsCarAttached = function(vehicle) end,

---@param vehicle integer
---@return boolean
IsCarDead = function(vehicle) end,

---@param carIndex integer
---@param doorNumber integer
---@return boolean
---Checks if the car door is intact.
IsCarDoorDamaged = function(carIndex, doorNumber) end,

---@param carIndex integer
---@param doorNumber integer
---@return boolean
---Checks if a car door is open.
IsCarDoorFullyOpen = function(carIndex, doorNumber) end,

---@param car integer
---@param health number
---@return boolean
IsCarHealthGreater = function(car, health) end,

---@param vehicle integer
---@return boolean
IsCarInAirProper = function(vehicle) end,

IsCarInAngledArea2d = function() end,

IsCarInAngledArea3d = function() end,

---@param carIndex integer
---@param minX number
---@param minY number
---@param maxX number
---@param maxY number
---@param highlightArea boolean
---@return boolean
---Returns true if the car is located within the specified 2D area.
IsCarInArea2d = function(carIndex, minX, minY, maxX, maxY, highlightArea) end,

---@param carIndex integer
---@param minX number
---@param minY number
---@param minZ number
---@param maxX number
---@param maxY number
---@param maxZ number
---@param highlightArea boolean
---@return boolean
---Returns true if the car is located within the specified 3D area.
IsCarInArea3d = function(carIndex, minX, minY, minZ, maxX, maxY, maxZ, highlightArea) end,

---@param garageName string
---@param vehicle integer
---@return boolean
---@return integer garageName
IsCarInGarageArea = function(garageName, vehicle) end,

---@param vehicle integer
---@return boolean
IsCarInWater = function(vehicle) end,

---@param car integer
---@return boolean
IsCarLowRider = function(car) end,

---@param vehicleIndex integer
---@param modelHashKey integer
---@return boolean
---Checks that the car is a specific model.
IsCarModel = function(vehicleIndex, modelHashKey) end,

---@param vehicle integer
---@return boolean
IsCarOnFire = function(vehicle) end,

---@param vehicle integer
---@return boolean
IsCarOnScreen = function(vehicle) end,

---@param carIndex integer
---@param seat integer
---@return boolean
---Checks if the car seat is free.
IsCarPassengerSeatFree = function(carIndex, seat) end,

---@param car integer
---@param animname0 string
---@param animname1 string
---@return boolean
---@return integer animname0
---@return integer animname1
IsCarPlayingAnim = function(car, animname0, animname1) end,

---@param vehicle integer
---@return boolean
IsCarSirenOn = function(vehicle) end,

---@param vehicle integer
---@return boolean
IsCarStopped = function(vehicle) end,

---@param vehicle integer
---@return boolean
IsCarStoppedAtTrafficLights = function(vehicle) end,

IsCarStoppedInArea2d = function() end,

---@param car integer
---@return boolean
IsCarStreetRacer = function(car) end,

---@param car integer
---@return boolean
IsCarStuck = function(car) end,

---@param vehicle integer
---@return boolean
IsCarStuckOnRoof = function(vehicle) end,

---@param vehicle integer
---@param otherCar integer
---@return boolean
IsCarTouchingCar = function(vehicle, otherCar) end,

---@param carIndex integer
---@param wheelNumber integer
---@return boolean
---Checks if a cars tyre is burst.
IsCarTyreBurst = function(carIndex, wheelNumber) end,

---@param vehicle integer
---@return boolean
IsCarUpright = function(vehicle) end,

---@param vehicle integer
---@return boolean
IsCarUpsidedown = function(vehicle) end,

---@param vehicle integer
---@return boolean
IsCarWaitingForWorldCollision = function(vehicle) end,

---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@return boolean
IsCopVehicleInArea3dNoSave = function(x0, y0, z0, x1, y1, z1) end,

---@param veh integer
---@return boolean
IsEmergencyServicesVehicle = function(veh) end,

---@param garageName string
---@return boolean
---@return integer garageName
IsGarageClosed = function(garageName) end,

---@param garageName string
---@return boolean
---@return integer garageName
IsGarageOpen = function(garageName) end,

---@param heli integer
---@param flag0 boolean
---@param flag1 boolean
---@param flag2 boolean
---@return boolean
IsHeliPartBroken = function(heli, flag0, flag1, flag2) end,

---@param veh integer
---@return boolean
IsNextStationAllowed = function(veh) end,

---@return boolean
IsPayNSprayActive = function() end,

---@param car integer
---@return boolean
IsPlaybackGoingOnForCar = function(car) end,

---@return boolean
IsRecordingGoingOnForCar = function() end,

---@param modelHashKey integer
---@return boolean
---Checks that vehicle model is a bike model.
IsThisModelABike = function(modelHashKey) end,

---@param modelHashKey integer
---@return boolean
---Checks that vehicle model is a boat model.
IsThisModelABoat = function(modelHashKey) end,

---@param modelHashKey integer
---@return boolean
---Checks that vehicle model is a car model.
IsThisModelACar = function(modelHashKey) end,

---@param modelHashKey integer
---@return boolean
---Checks that vehicle model is a heli model.
IsThisModelAHeli = function(modelHashKey) end,

---@param modelHashKey integer
---@return boolean
---Checks that vehicle model is a plane model.
IsThisModelAPlane = function(modelHashKey) end,

---@param modelHashKey integer
---@return boolean
---Checks that vehicle model is a train model.
IsThisModelATrain = function(modelHashKey) end,

---@param vehicle integer
---@return boolean
IsVehDriveable = function(vehicle) end,

---@param carIndex integer
---@param extra integer
---@return boolean
---Checks if a vehicle extra is turned on.
IsVehicleExtraTurnedOn = function(carIndex, extra) end,

---@param vehicle integer
---@return boolean
IsVehicleOnAllWheels = function(vehicle) end,

---@param veh integer
---@param obj integer
---@return boolean
IsVehicleTouchingObject = function(veh, obj) end,

---@param veh integer
---@param time integer
---@param flag0 boolean
---@param flag1 boolean
---@param flag2 boolean
---@return boolean
IsVehStuck = function(veh, time, flag0, flag1, flag2) end,

---@param carIndex integer
---@param windowNumber integer
---@return boolean
---Returns true if a window exists and is not smashed, false otherwise.
IsVehWindowIntact = function(carIndex, windowNumber) end,

---@param car integer
---@param x0 number
---@param y0 number
---@param xUnk number
---@param yUnk number
---@param flag boolean
---@return boolean
LocateCar2d = function(car, x0, y0, xUnk, yUnk, flag) end,

---@param car integer
---@param x number
---@param y number
---@param z number
---@param xa number
---@param ya number
---@param za number
---@param flag boolean
---@return boolean
LocateCar3d = function(car, x, y, z, xa, ya, za, flag) end,

---@param car integer
---@param x number
---@param y number
---@param z number
---@param xa number
---@param ya number
---@param za number
---@param flag boolean
---@return boolean
LocateDeadCar3d = function(car, x, y, z, xa, ya, za, flag) end,

---@param carIndex integer
---@param newLockState integer
---Set the car doors to a certain locked state.
LockCarDoors = function(carIndex, newLockState) end,

---@param vehicle integer
---@param convoyCar boolean
MarkCarAsConvoyCar = function(vehicle, convoyCar) end,

---@param pVehicle integer
---@return integer pVehicle
MarkCarAsNoLongerNeeded = function(pVehicle) end,

---@param train integer
MarkMissionTrainAsNoLongerNeeded = function(train) end,

MarkMissionTrainsAsNoLongerNeeded = function() end,

---@param carIndex integer
---@param doorNumber integer
---Opens a car door.
OpenCarDoor = function(carIndex, doorNumber) end,

---@param name string
---@return integer name
OpenGarage = function(name) end,

---@param num integer
OverrideNumberOfParkedCars = function(num) end,

---@param car integer
PausePlaybackRecordedCar = function(car) end,

---@param plain integer
PlaneStartsInAir = function(plain) end,

---@param car integer
---@param animname0 string
---@param animname1 string
---@param arg4 number
---@param flag0 boolean
---@param flag1 boolean
---@return boolean
---@return integer animname0
---@return integer animname1
PlayCarAnim = function(car, animname0, animname1, arg4, flag0, flag1) end,

---@return boolean
PlayerIsInteractingWithGarage = function() end,

---@param vehicle integer
PopCarBoot = function(vehicle) end,

---@param CarRec integer
RemoveCarRecording = function(CarRec) end,

---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
RemoveCarsFromGeneratorsInArea = function(x0, y0, z0, x1, y1, z1) end,

---@param car integer
---@param windnum integer
RemoveCarWindow = function(car, windnum) end,

---@param vehicle integer
RemoveStuckCarCheck = function(vehicle) end,

---@param vehicle integer
RemoveUpsidedownCarCheck = function(vehicle) end,

---@param CarRecId integer
RequestCarRecording = function(CarRecId) end,

---@param car integer
---@param reset boolean
ResetCarWheels = function(car, reset) end,

---@param car integer
---@param timer_num integer
ResetStuckTimer = function(car, timer_num) end,

SetAllCarGeneratorsBackToActive = function() end,

---@param set boolean
SetAllCarsCanBeDamaged = function(set) end,

---@param multiplier number
SetAmbientPlanesSpeedMultiplier = function(multiplier) end,

---@param bike integer
---@param set boolean
SetBikeRiderWillPutFootDownWhenStopped = function(bike, set) end,

---@param veh integer
---@param set boolean
SetBlipThrottleRandomly = function(veh, set) end,

---@param car integer
---@param set boolean
SetCanBurstCarTyres = function(car, set) end,

---@param car integer
---@param can boolean
SetCanResprayCar = function(car, can) end,

---@param car integer
---@param allowed boolean
SetCarAllowedToDrown = function(car, allowed) end,

---@param car integer
---@param set boolean
SetCarAlwaysCreateSkids = function(car, set) end,

---@param car integer
---@param animname0 string
---@param animname1 string
---@param time number
---@return integer animname0
---@return integer animname1
SetCarAnimCurrentTime = function(car, animname0, animname1, time) end,

---@param car integer
---@param animname0 string
---@param animname1 string
---@param speed number
---@return integer animname0
---@return integer animname1
SetCarAnimSpeed = function(car, animname0, animname1, speed) end,

---@param car integer
SetCarAsMissionCar = function(car) end,

---@param vehicle integer
---@param value boolean
SetCarCanBeDamaged = function(vehicle, value) end,

---@param vehicle integer
---@param value boolean
SetCarCanBeVisiblyDamaged = function(vehicle, value) end,

---@param car integer
---@param set boolean
SetCarCollision = function(car, set) end,

---@param car integer
---@param combination integer
SetCarColourCombination = function(car, combination) end,

---@param vehicle integer
---@param pX number
---@param pY number
---@param pZ number
SetCarCoordinates = function(vehicle, pX, pY, pZ) end,

---@param car integer
---@param x number
---@param y number
---@param z number
SetCarCoordinatesNoOffset = function(car, x, y, z) end,

---@param density number
SetCarDensityMultiplier = function(density) end,

---@param car integer
---@param multiplier number
SetCarDistanceAheadMultiplier = function(car, multiplier) end,

---@param car integer
---@param door integer
---@param flag0 boolean
---@param flag1 boolean
SetCarDoorLatched = function(car, door, flag0, flag1) end,

---@param car integer
---@param flag0 boolean
---@param flag1 boolean
SetCarEngineOn = function(car, flag0, flag1) end,

---@param vehicle integer
---@param speed number
SetCarForwardSpeed = function(vehicle, speed) end,

---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@param set boolean
SetCarGeneratorsActiveInArea = function(x0, y0, z0, x1, y1, z1, set) end,

---This native function doesn't work (nullsub).
SetCarHasBeenCreatedInInterior = function() end,

---@param vehicleIndex integer
---@param newHeading number
---Sets the car's heading in degrees.
SetCarHeading = function(vehicleIndex, newHeading) end,

---@param vehicleIndex integer
---@param newHealth integer
---Sets the car's current health.
SetCarHealth = function(vehicleIndex, newHealth) end,

---@param car integer
---@param set boolean
SetCarInCutscene = function(car, set) end,

---@param car integer
---@param shift number
SetCarLaneShift = function(car, shift) end,

---@param car integer
---@param multiplier number
SetCarLightMultiplier = function(car, multiplier) end,

---@param car integer
---@param livery integer
SetCarLivery = function(car, livery) end,

---@param car integer
---@param set boolean
---@param group integer
SetCarNotDamagedByRelationshipGroup = function(car, set, group) end,

---@param carIndex integer
---@return boolean
---Sets the car on the ground taking into account the angle of the ground.
SetCarOnGroundProperly = function(carIndex) end,

---@param car integer
---@param set boolean
SetCarOnlyDamagedByPlayer = function(car, set) end,

---@param car integer
---@param set boolean
---@param group integer
SetCarOnlyDamagedByRelationshipGroup = function(car, set, group) end,

---@param vehicle integer
---@param bulletProof boolean
---@param fireProof boolean
---@param explosionProof boolean
---@param collisionProof boolean
---@param meleeProof boolean
SetCarProofs = function(vehicle, bulletProof, fireProof, explosionProof, collisionProof, meleeProof) end,

---@param car integer
---@param seed integer
SetCarRandomRouteSeed = function(car, seed) end,

---@param car integer
---@param set boolean
SetCarStayInFastLane = function(car, set) end,

---@param car integer
---@param set boolean
SetCarStayInSlowLane = function(car, set) end,

---@param vehicle integer
---@param strong boolean
SetCarStrong = function(vehicle, strong) end,

---@param car integer
---@param traction number
SetCarTraction = function(car, traction) end,

---@param vehicle integer
---@param value boolean
SetCarVisible = function(vehicle, value) end,

---@param car integer
---@param set boolean
SetCarWatertight = function(car, set) end,

---@param car integer
---@param set boolean
SetConvertibleRoof = function(car, set) end,

---@param set boolean
SetEnableRcDetonate = function(set) end,

---@param set boolean
SetEnableRcDetonateOnContact = function(set) end,

---@param vehicle integer
---@param health number
SetEngineHealth = function(vehicle, health) end,

---@param vehicle integer
---@param colour1 integer
---@param colour2 integer
SetExtraCarColours = function(vehicle, colour1, colour2) end,

---@param veh integer
---@param set boolean
SetFreebiesInVehicle = function(veh, set) end,

---@param set boolean
SetFreeResprays = function(set) end,

---@param car integer
---@param set boolean
SetGangCar = function(car, set) end,

---@param garage integer
---@param set boolean
SetGarageLeaveCameraAlone = function(garage, set) end,

---@param car integer
---@param set boolean
SetHasBeenOwnedByPlayer = function(car, set) end,

---@param CarGen integer
---@param set boolean
SetHasBeenOwnedForCarGenerator = function(CarGen, set) end,

---@param heli integer
SetHeliBladesFullSpeed = function(heli) end,

---@param heli integer
---@param set boolean
---@return integer
SetHeliForceEngineOn = function(heli, set) end,

---@param heli integer
---@param set boolean
SetHeliStabiliser = function(heli, set) end,

---@param car integer
---@param set boolean
SetLoadCollisionForCarFlag = function(car, set) end,

---@param train integer
---@param x number
---@param y number
---@param z number
SetMissionTrainCoordinates = function(train, x, y, z) end,

---@param veh integer
---@param set boolean
SetNeedsToBeHotwired = function(veh, set) end,

---@param set boolean
SetNoResprays = function(set) end,

---@param multiplier number
SetParkedCarDensityMultiplier = function(multiplier) end,

---@param vehicle integer
---@param value number
SetPetrolTankHealth = function(vehicle, value) end,

---@param car integer
---@param set boolean
SetPetrolTankWeakpoint = function(car, set) end,

---@param plane integer
---@param throttle number
SetPlaneThrottle = function(plane, throttle) end,

---@param plain integer
---@param set boolean
SetPlaneUndercarriageUp = function(plain, set) end,

---@param car integer
---@param speed number
SetPlaybackSpeed = function(car, speed) end,

---@param car integer
---@param set boolean
SetPoliceFocusWillTrackCar = function(car, set) end,

---@param resistance number
SetRailtrackResistanceMult = function(resistance) end,

---@param density number
SetRandomCarDensityMultiplier = function(density) end,

---@param cat integer
---@param x number
---@param y number
---@param z number
SetRecordingToPointNearestToCoors = function(cat, x, y, z) end,

---@param train integer
---@param set boolean
SetRenderTrainAsDerailed = function(train, set) end,

---@param set boolean
SetRocketLauncherFreebieInHeli = function(set) end,

---@param vehicleIndex integer
---@param roomKey integer
SetRoomForCarByKey = function(vehicleIndex, roomKey) end,

---@param vehicleIndex integer
---@param roomName string
---@return integer roomName
SetRoomForCarByName = function(vehicleIndex, roomName) end,

---@param garage integer
---@param car integer
SetTargetCarForMissionGarage = function(garage, car) end,

---@param car integer
---@param set boolean
SetTaxiLights = function(car, set) end,

---@param train integer
---@param speed number
SetTrainCruiseSpeed = function(train, speed) end,

---@param train integer
---@param set boolean
SetTrainForcedToSlowDown = function(train, set) end,

---@param train integer
SetTrainIsStoppedAtStation = function(train) end,

---@param train integer
---@param speed number
SetTrainSpeed = function(train, speed) end,

---@param train integer
---@param set boolean
SetTrainStopsForStations = function(train, set) end,

---@param car integer
---@param set boolean
SetUpsidedownCarNotDamaged = function(car, set) end,

---@param veh integer
---@param set boolean
SetVehAlarm = function(veh, set) end,

---@param veh integer
---@param duration integer
SetVehAlarmDuration = function(veh, duration) end,

---@param veh integer
---@param set boolean
SetVehHasStrongAxles = function(veh, set) end,

---@param vehicle integer
---@param on boolean
SetVehHazardlights = function(vehicle, on) end,

---@param veh integer
---@param alpha integer
SetVehicleAlpha = function(veh, alpha) end,

---@param veh integer
SetVehicleAlwaysRender = function(veh) end,

---@param veh integer
---@param set boolean
SetVehicleCanBeTargetted = function(veh, set) end,

---@param veh integer
---@param multiplier number
SetVehicleDeformationMult = function(veh, multiplier) end,

---@param vehicle integer
---@param intensity number
SetVehicleDirtLevel = function(vehicle, intensity) end,

---@param veh integer
---@param set boolean
SetVehicleExplodesOnHighExplosionDamage = function(veh, set) end,

---@param veh integer
---@param set boolean
SetVehicleIsConsideredByPlayer = function(veh, set) end,

---@param veh integer
---@param arg2 number
---@param arg3 number
---@param arg4 number
---@param arg5 number
SetVehicleQuaternion = function(veh, arg2, arg3, arg4, arg5) end,

---@param veh integer
---@param set boolean
SetVehicleRenderScorched = function(veh, set) end,

---@param veh integer
---@param val number
SetVehicleSteerBias = function(veh, val) end,

---@param veh integer
---@param set boolean
SetVehIndicatorlights = function(veh, set) end,

---@param veh integer
---@param set boolean
SetVehInteriorlight = function(veh, set) end,

---@param carIndex integer
---@param doorNumber integer
---Shuts a car door.
ShutCarDoor = function(carIndex, doorNumber) end,

---@param car integer
---@param time number
SkipInPlaybackRecordedCar = function(car, time) end,

---@param CarRec integer
---@param time number
SkipTimeInPlaybackRecordedCar = function(CarRec, time) end,

---@param car integer
SkipToEndAndStopPlaybackRecordedCar = function(car) end,

---@param train integer
SkipToNextAllowedStation = function(train) end,

---@param car integer
---@param windownum integer
SmashCarWindow = function(car, windownum) end,

---@param carIndex integer
---@param time integer
---Sounds a car horn for the given time.
SoundCarHorn = function(carIndex, time) end,

---@param car integer
---@param CarRec integer
StartPlaybackRecordedCar = function(car, CarRec) end,

---@param car integer
---@param arg2 integer
StartPlaybackRecordedCarLooped = function(car, arg2) end,

---@param car integer
---@param CarRec integer
StartPlaybackRecordedCarUsingAi = function(car, CarRec) end,

---@param car integer
---@param CarRec integer
---@param x number
---@param y number
---@param z number
StartPlaybackRecordedCarWithOffset = function(car, CarRec, x, y, z) end,

---@param car integer
---@param stop boolean
StopCarBreaking = function(car, stop) end,

---@param car integer
StopPlaybackRecordedCar = function(car) end,

---This native function doesn't work (nullsub).
StopRecordingCar = function() end,

---@param veh integer
StopVehicleAlwaysRender = function(veh) end,

---@param modelHash integer
SuppressCarModel = function(modelHash) end,

---@param on boolean
SwitchAmbientPlanes = function(on) end,

---@param handle integer
---@param type integer
SwitchCarGenerator = function(handle, type) end,

---@param car integer
---@param siren boolean
SwitchCarSiren = function(car, siren) end,

---@param on boolean
SwitchGarbageTrucks = function(on) end,

---@param on boolean
SwitchMadDrivers = function(on) end,

---@param set boolean
SwitchPoliceHelis = function(set) end,

---@param on boolean
SwitchRandomBoats = function(on) end,

---@param on boolean
SwitchRandomTrains = function(on) end,

---@param arg1 integer
---@param arg2 integer
SynchAmbientPlanes = function(arg1, arg2) end,

---@param car integer
---@param out boolean
TakeCarOutOfParkedCarsBudget = function(car, out) end,

---@param train integer
TrainLeaveStation = function(train) end,

---@param car integer
TriggerVehAlarm = function(car) end,

---@param car integer
---@param x number
---@param y number
TurnCarToFaceCoord = function(car, x, y) end,

---@param veh integer
---@param extra integer
---@param turnoff boolean
TurnOffVehicleExtra = function(veh, extra, turnoff) end,

---@param car integer
UnpausePlaybackRecordedCar = function(car) end,

---@param car integer
---@param set boolean
VehicleCanBeTargettedByHsMissile = function(car, set) end,

---@param veh integer
---@param cover boolean
VehicleDoesProvideCover = function(veh, cover) end,

---@param x number
---@param y number
---@param z number
---@return boolean
---@return number height
---Gets the height of the water below the position including the waves.
GetWaterHeight = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
---@return boolean
---@return number height
---Gets the height of the water below the position excluding the waves.
GetWaterHeightNoWaves = function(x, y, z) end,

---@return boolean
---Syncs the recording with the waves.
SynchRecordingWithWater = function() end,

---@param charIndex integer
---@param weaponType integer
---@param amount integer
---Give ammo for a weapon type to a character.
AddAmmoToChar = function(charIndex, weaponType, amount) end,

---@param vehicle integer
ClearCarLastWeaponDamage = function(vehicle) end,

---@param ped integer
ClearCharLastWeaponDamage = function(ped) end,

---@param obj integer
ClearObjectLastWeaponDamage = function(obj) end,

---@param ped integer
---@param disable boolean
DisableStickyBombActiveSound = function(ped, disable) end,

---@param enable boolean
EnableMaxAmmoCap = function(enable) end,

---@param ped integer
ForceCharToDropWeapon = function(ped) end,

---@param charIndex integer
---@param weaponType integer
---@return integer ammo
---Return the amount of ammo a character has for a weapon.
GetAmmoInCharWeapon = function(charIndex, weaponType) end,

---@param charIndex integer
---@param weaponType integer
---@return boolean
---@return integer ammoInClip
---Gets the current amount of ammo in a clip.
GetAmmoInClip = function(charIndex, weaponType) end,

---@param charIndex integer
---@param weaponSlot integer
---@return integer pWeapon
---@return integer pAmmo0
---@return integer pAmmo1
GetCharWeaponInSlot = function(charIndex, weaponSlot) end,

---@param charIndex integer
---@return boolean
---@return integer weaponType
---Get the current weapon a character is using - returns if it is usable (i.e. in their hand).
GetCurrentCharWeapon = function(charIndex) end,

---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@param type integer
---@return boolean
GetIsProjectileTypeInArea = function(x0, y0, z0, x1, y1, z1, type) end,

---@param obj integer
---@return boolean
GetIsStickyBombStuckToObject = function(obj) end,

---@param veh integer
---@return boolean
GetIsStickyBombStuckToVehicle = function(veh) end,

---@param charIndex integer
---@param weaponType integer
---@return boolean
---@return integer maxAmmo
GetMaxAmmo = function(charIndex, weaponType) end,

---@param charIndex integer
---@param weaponType integer
---@return integer maxAmmoInClip
---Returns the maximum number of bullets allowed in one clip.
GetMaxAmmoInClip = function(charIndex, weaponType) end,

---@param ped integer
---@return integer
GetNumberOfActiveStickyBombsOwnedByPed = function(ped) end,

---@param obj integer
---@return integer
GetNumberOfStickyBombsStuckToObject = function(obj) end,

---@param veh integer
---@return integer
GetNumberOfStickyBombsStuckToVehicle = function(veh) end,

---@param weaponType integer
---@return integer modelHashKey
---Returns the hash key of the weapon model.
GetWeapontypeModel = function(weaponType) end,

---@param weapon integer
---@return integer slot
GetWeapontypeSlot = function(weapon) end,

---@param ped integer
---@param weapon integer
---@param delaytime integer
---@param flag boolean
GiveDelayedWeaponToChar = function(ped, weapon, delaytime, flag) end,

---@param charIndex integer
---@param weaponType integer
---@param amountOfAmmo integer
---@param forceIntoHand boolean
---Give a weapon to a character with ammo.
GiveWeaponToChar = function(charIndex, weaponType, amountOfAmmo, forceIntoHand) end,

---@param carIndex integer
---@param weaponType integer
---@return boolean
HasCarBeenDamagedByWeapon = function(carIndex, weaponType) end,

---@param charIndex integer
---@param weaponType integer
---@return boolean
---Return if a character has been damaged by a certain weapon.
HasCharBeenDamagedByWeapon = function(charIndex, weaponType) end,

---@param charIndex integer
---@param weaponType integer
---@return boolean
---Return if character has a weapon.
HasCharGotWeapon = function(charIndex, weaponType) end,

---@param obj integer
---@param unk integer
---@return boolean
HasObjectBeenDamagedByWeapon = function(obj, unk) end,

---@param ped integer
---@param hide boolean
HideCharWeaponForScriptedCutscene = function(ped, hide) end,

---@param charIndex integer
---@param weaponCheckFlags integer
---@return boolean
---Queries the characters armament using the flags passed.
IsCharArmed = function(charIndex, weaponCheckFlags) end,

---@param ped integer
RemoveAllCharWeapons = function(ped) end,

---@param charIndex integer
---@param weaponType integer
---Remove a weapon a character has.
RemoveWeaponFromChar = function(charIndex, weaponType) end,

---@param veh integer
---@param weapon integer
SelectWeaponsForVehicle = function(veh, weapon) end,

---@param charIndex integer
---@param weaponType integer
---@param ammoInClip integer
---@return boolean
---Sets the amount of ammo in a clip.
SetAmmoInClip = function(charIndex, weaponType, ammoInClip) end,

---@param charIndex integer
---@param weaponType integer
---@param ammo integer
---Set the ammo a character has for a certain weapon type.
SetCharAmmo = function(charIndex, weaponType, ammo) end,

---@param ped integer
---@param visble boolean
SetCharCurrentWeaponVisible = function(ped, visble) end,

---@param ped integer
---@param value boolean
SetCharDropsWeaponsWhenDead = function(ped, value) end,

---@param ped integer
---@param skill integer
---This native function doesn't work (nullsub).
SetCharWeaponSkill = function(ped, skill) end,

---@param charIndex integer
---@param weaponType integer
---@param forceInHand boolean
---Set the weapon a character is currently using.
SetCurrentCharWeapon = function(charIndex, weaponType, forceInHand) end,

---@param ped integer
---@param set boolean
SetDeathWeaponsPersist = function(ped, set) end,

---@param ped integer
---@param min number
---@param max number
SetMinMaxPedAccuracy = function(ped, min, max) end,

ActivateScriptPopulationZone = function() end,

DeactivateScriptPopulationZone = function() end,

---@return integer group
---@return integer percentage
FindPrimaryPopulationZoneGroup = function() end,

---@return integer
GetCurrentPopulationZoneType = function() end,

---@return integer
GetCurrentZoneScumminess = function() end,

---@param x number
---@param y number
---@param z number
---@return integer
GetMapAreaFromCoords = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
---@return string
GetNameOfInfoZone = function(x, y, z) end,

---@param x number
---@param y number
---@param z number
---@return string
GetNameOfZone = function(x, y, z) end,

---@param zoneLabel string
---@param noCops boolean
---@return integer zoneLabel
SetZoneNoCops = function(zoneLabel, noCops) end,

---@param zoneLabel string
---@param populationType integer
---@return integer zoneLabel
SetZonePopulationType = function(zoneLabel, populationType) end,

---@param zoneLabel string
---@param scumminess integer
---@return integer zoneLabel
SetZoneScumminess = function(zoneLabel, scumminess) end,

---@param arg1 integer
---@param arg2 integer
---@param arg3 integer
---@param arg4 integer
---@param arg5 integer
---@param arg6 integer
SpecifyScriptPopulationZoneArea = function(arg1, arg2, arg3, arg4, arg5, arg6) end,

---@param arg1 integer
---@param arg2 integer
---@param arg3 integer
---@param arg4 integer
---@param arg5 integer
SpecifyScriptPopulationZoneGroups = function(arg1, arg2, arg3, arg4, arg5) end,

---@param num integer
SpecifyScriptPopulationZoneNumCars = function(num) end,

---@param num integer
SpecifyScriptPopulationZoneNumParkedCars = function(num) end,

---@param num integer
SpecifyScriptPopulationZoneNumPeds = function(num) end,

---@param num integer
SpecifyScriptPopulationZoneNumScenarioPeds = function(num) end,

---@param percentage integer
SpecifyScriptPopulationZonePercentageCops = function(percentage) end,

---@param disable boolean
---Prevents player from automatically starting the engine after entering a car.
DisablePlayerStartEngine = function(disable) end,

---@param disable boolean
---@param keepSprint boolean
---Disable player network walk mode.
DisableNetworkWalkMode = function(disable, keepSprint) end,

---@param carIndex integer
---@param left boolean
---@param on boolean
---Sets the vehicle indicator on/off for left or right side.
SetVehTurnIndicatorlights = function(carIndex, left, on) end,

}
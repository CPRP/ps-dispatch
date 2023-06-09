local QBCore = exports['qb-core']:GetCoreObject()
local inpaintballmatch = false  -- ADDED FOR PUG BATTLEROYAL SCRIPT (NEXT 6 LINES)
PlayerData = {}
PlayerJob = {}

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PlayerData = QBCore.Functions.GetPlayerData()
        PlayerJob = QBCore.Functions.GetPlayerData().job
    end
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
    currentCallSign = ""
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate", function(JobInfo)
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = JobInfo
end)

RegisterNetEvent("Pug:client:InPaintBallMatchWL")  -- ADDED FOR PUG BATTLEROYAL SCRIPT (NEXT 6 LINES)
AddEventHandler("Pug:client:InPaintBallMatchWL", function() -- put this in you police calls for not recieving shots fired while playing paintball
    inpaintballmatch = true
end)

RegisterNetEvent("Pug:client:InPaintBallMatchWLFalse")  -- ADDED FOR PUG BATTLEROYAL SCRIPT (NEXT 6 LINES)
AddEventHandler("Pug:client:InPaintBallMatchWLFalse", function() -- put this in you police calls for recieving shots fired again after exiting paintball
    inpaintballmatch = false
end)

----ADDED ABOVE FOR REMOVING POLICE SHOOTING CALLS----

CreateThread(function()
	local sleep = 1000
	while true do
        if LocalPlayer.state.isLoggedIn then
            if (not isPlayerWhitelisted or Config.Debug) then
                for k, v in pairs(Config.Timer) do
                    if v > 0 then Config.Timer[k] = v - 1 end
                end
            end
        end
		Wait(sleep)
	end
end)

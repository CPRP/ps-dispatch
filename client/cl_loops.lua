local QBCore = exports['qb-core']:GetCoreObject()
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

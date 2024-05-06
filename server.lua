Citizen.CreateThread(function()
    while true do
        if Config.Enabled then
        for i in pairs(Config.Messages) do
        SendNotification(-1, Config.Messages[i], 'success') 
        Citizen.Wait(Config.Time * 60000) 
            end
        end
    end
end)

AddEventHandler('playerJoining', function()
    local playerid = source
    local name = GetPlayerName(source) .. " " .. Config.JoinMessage
    if Config.JoinEnabled then
    SendNotification(playerid, name, 'success') 
    else
        return
    end
end)
Citizen.CreateThread(function()
    while true do
        if Config.Enabled then
        for i in pairs(Config.Messages) do
        SendNoti(-1, Config.Messages[i], 'success') 
        Citizen.Wait(Config.Time * 60000) 
            end
        end
    end
end)

AddEventHandler('playerJoining', function()
    local playerid = source
    local name = GetPlayerName(source)
    if Config.JoinEnabled then
    SendNoti(playerid, name .. Config.JoinMessage, 'success') 
    else
        return
    end
end)
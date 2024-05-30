Citizen.CreateThread(function()
    while true do
        if Config.Enabled then
            for _, message in pairs(Config.Messages) do
                SendNoti(-1, message, 'success')
                Citizen.Wait(Config.Time * 60000)
            end
        end
        Citizen.Wait(1000) 
    end
end)

AddEventHandler('playerJoining', function()
    local playerid = source
    local name = GetPlayerName(playerid)
    if Config.JoinEnabled then
        SendNoti(playerid, name .. " " .. Config.JoinMessage, 'success')
    end
end)

function SendNoti(recipient, message, type)
    local messageType, color
    if type == "success" then 
        messageType = "SYSTEM"
        color = "~g~"
    elseif type == "error" then 
        messageType = "SYSTEM"
        color = "~r~"
    end
    message = color .. "[" .. messageType .. "] ~w~" .. message
    if Config.Notify == 0 then
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="chat-message ooc"><b><span style="color: #7d7d7d">{1}: </span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;"></div></div>',
            args = { recipient, message }
        })
    elseif Config.Notify == 1 then
        TriggerClientEvent('okokNotify:Alert', recipient, string.upper(type), message, Config.NotifyDuration, type, true)
    elseif Config.Notify == 2 then
        TriggerClientEvent('codem-notification', recipient, message, 8000, type == 'success' and 'check' or 'error', options)
    elseif Config.Notify == 3 then
        TriggerClientEvent('mythic_notify:client:SendAlert', recipient, { type = type, text = message, style = { ['background-color'] = '#000000', ['color'] = '#ffff' } })
    elseif Config.Notify == 4 then
        TriggerClientEvent('ox_lib:notify', -1, {
            title = 'Atlas DevLabs System',
            description = message,
            type = type,
            position = 'center-right'
        })
    end
end

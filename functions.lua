function SendNotification(recipient, message, type)
    if Config.Notify == 0 then 
        if type == "success" then 
            local type = "SUCCESS"
            local message = "~g~[" .. type .. "] ~w~" .. message
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message ooc"><b><span style="color: #7d7d7d">{1} </span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;"></div></div>',
                args = { recipient, message }
            })
        elseif type == "error" then 
            local type = "ERROR"
            local message = "~r~[" .. type .. "] ~w~" .. message
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="chat-message ooc"><b><span style="color: #7d7d7d">{1}: </span>&nbsp;<span style="font-size: 14px; color: #e1e1e1;"></span></b><div style="margin-top: 5px; font-weight: 300;"></div></div>',
                args = { recipient, message }
            })
        end
    elseif Config.Notify == 1 then 
        if type == "success" then 
            TriggerClientEvent('okokNotify:Alert', recipient, 'SUCCESS', message, Config.NotifyDuration, 'success', true)
        elseif type == "error" then 
            TriggerClientEvent('okokNotify:Alert', recipient, 'ERROR', message, Config.NotifyDuration, 'error', true)
        end
    elseif Config.Notify == 2 then 
        if type == "success" then 
            TriggerClientEvent('codem-notification', recipient, message, 8000, 'check', options)
        elseif type == "error" then 
            TriggerClientEvent('codem-notification', recipient, message, 8000, 'error', options)
        end
    elseif Config.Notify == 3 then 
        if type == "success" then 
            TriggerClientEvent('mythic_notify:client:SendAlert', recipient, { type = 'success', text = message, style = { ['background-color'] = '#000000', ['color'] = '#ffff' } })
        elseif type == "error" then 
            TriggerClientEvent('mythic_notify:client:SendAlert', recipient, { type = 'error', text = message, style = { ['background-color'] = '#000000', ['color'] = '#ffff' } })
        end
    end
end
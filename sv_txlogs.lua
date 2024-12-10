-- Server/Resource Start Event
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    local embed = {
        {
            title = "__Server Resource Started__",
            description = "The txAdmin logging system has been initialized",
            color = 3066993, -- Green color
            fields = {
                { name = "Resource", value = resourceName, inline = true },
                { name = "Time", value = os.date("%Y-%m-%d %H:%M:%S"), inline = true }
            },
            author = { name = "txAdmin Logging System" }
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers)
        if err ~= 204 then
            print("Failed to send webhook for Server Start: " .. tostring(err))
        end
    end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end)

-- Player Kicked Event
AddEventHandler('txAdmin:events:playerKicked', function(eventData)
    local idName = GetPlayerName(eventData.target) or "Unknown Player"
    local reason = eventData.reason or "No reason provided"
    local author = eventData.author or "Unknown Moderator"

    local embed = {
        {
            title = "__Player Kicked__",
            color = 15445283,
            fields = {
                { name = "Player", value = idName, inline = true },
                { name = "Player ID", value = tostring(eventData.target), inline = true },
                { name = "Reason", value = reason, inline = true },
                { name = "Moderator", value = author, inline = true }
            },
            author = { name = "txAdmin Logging System" }
        }
    }

    PerformHttpRequest(modWebhook, function(err, text, headers)
        if err ~= 204 then
            print("Failed to send webhook for Player Kicked: " .. tostring(err))
        end
    end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end)

-- Player Warned Event
AddEventHandler('txAdmin:events:playerWarned', function(eventData)
    local idName = GetPlayerName(eventData.targetName) or "Unknown Player"
    local reason = eventData.reason or "No reason provided"
    local author = eventData.author or "Unknown Moderator"
    local actionId = eventData.actionId or "N/A"

    local embed = {
        {
            title = "__Player Warned__",
            color = 15445283,
            fields = {
                { name = "Player", value = idName, inline = true },
                { name = "Player ID", value = tostring(eventData.targetName), inline = true },
                { name = "Reason", value = reason, inline = true },
                { name = "Moderator", value = author, inline = true },
                { name = "Action ID", value = actionId, inline = true }
            },
            author = { name = "txAdmin Logging System" }
        }
    }

    PerformHttpRequest(modWebhook, function(err, text, headers)
        if err ~= 204 then
            print("Failed to send webhook for Player Warned: " .. tostring(err))
        end
    end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end)

-- Player Banned Event
AddEventHandler('txAdmin:events:playerBanned', function(eventData)
    local idName = eventData.targetName or "Unknown Player"
    local actionId = eventData.actionId or "Unknown Identifier"
    local reason = eventData.reason or "No reason provided"
    local author = eventData.author or "Unknown Moderator"
    local durationInput = eventData.duration or "Permanent"
    local expiration = eventData.expiration or "Never"

    local embed = {
        {
            title = "Player Banned",
            color = 16711680,
            fields = {
                { name = "Player", value = idName, inline = true },
                { name = "Action ID", value = actionId, inline = true },
                { name = "Reason", value = reason, inline = true },
                { name = "Ban Length/Expiry", value = durationInput .. " / " .. expiration, inline = true },
                { name = "Moderator", value = author, inline = true }
            },
            author = { name = "txAdmin Logging System" }
        }
    }

    PerformHttpRequest(modWebhook, function(err, text, headers)
        if err ~= 204 then
            print("Failed to send webhook for Player Banned: " .. tostring(err))
        end
    end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end)

-- Player Messaged Event
AddEventHandler('txAdmin:events:playerDirectMessage', function(eventData)
    local idName = GetPlayerName(eventData.target) or "Unknown Player"
    local author = eventData.author or "Unknown Moderator"
    local message = eventData.message or "No message provided"

    local embed = {
        {
            title = "Player Messaged",
            color = 1900288,
            fields = {
                { name = "Player", value = idName, inline = true },
                { name = "Player ID", value = tostring(eventData.target), inline = true },
                { name = "Message", value = message, inline = true },
                { name = "Moderator", value = author, inline = true }
            },
            author = { name = "txAdmin Logging System" }
        }
    }

    PerformHttpRequest(modWebhook, function(err, text, headers)
        if err ~= 204 then
            print("Failed to send webhook for Player DMed: " .. tostring(err))
        end
    end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end)

-- Action Revoked Event
AddEventHandler('txAdmin:events:actionRevoked', function(eventData)
    local playerName = eventData.playerName or "Unknown Player"
    local actionType = eventData.actionType or "Unknown Action"
    local actionReason = eventData.actionReason or "No reason provided"
    local actionAuthor = eventData.actionAuthor or "Unknown Moderator"
    local revokedBy = eventData.revokedBy or "Unknown Revoker"

    local embed = {
        {
            title = "Action Revoked",
            color = 1900288,
            fields = {
                { name = "Player", value = playerName, inline = true },
                { name = "Action Revoked", value = actionType, inline = true },
                { name = "Original Reason", value = actionReason, inline = true },
                { name = "Original Moderator", value = actionAuthor, inline = true },
                { name = "Revoked By", value = revokedBy, inline = true }
            },
            author = { name = "txAdmin Logging System" }
        }
    }

    PerformHttpRequest(modWebhook, function(err, text, headers)
        if err ~= 204 then
            print("Failed to send webhook for Action Revoked: " .. tostring(err))
        end
    end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end)

-- Player Healed Event
AddEventHandler('txAdmin:events:healedPlayer', function(eventData)
    local idName = GetPlayerName(eventData.id) or "Unknown Player"

    local embed = {
        {
            title = "Player Healed",
            color = 1900288,
            fields = {
                { name = "Player", value = idName, inline = false },
            },
            author = { name = "txAdmin Logging System" }
        }
    }

    PerformHttpRequest(modWebhook, function(err, text, headers)
        if err ~= 204 then
            print("Failed to send webhook for Player Healed: " .. tostring(err))
        end
    end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end)

-- Server Announcement Event
AddEventHandler('txAdmin:events:announcement', function(eventData)
    local author = eventData.author or "Unknown Author"
    local message = eventData.message or "Unknown Message"

    local embed = {
        {
            title = "Server Announcement",
            color = 5087487,
            fields = {
                { name = "Author", value = author, inline = true },
                { name = "Message", value = message, inline = true },
            },
            author = { name = "txAdmin Logging System" }
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers)
        if err ~= 204 then
            print("Failed to send webhook for Announcement: " .. tostring(err))
        end
    end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end)

-- Server Scheduled Restart Event
AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    local embed = {
        {
            title = "Scheduled Restart",
            color = 5087487,
            fields = {
                { name = "", value = eventData.translatedMessage, inline = true },
            },
            author = { name = "txAdmin Logging System" }
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers)
        if err ~= 204 then
            print("Failed to send webhook for Scheduled Restart: " .. tostring(err))
        end
    end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end)

-- Server Stopped Event
AddEventHandler('txAdmin:events:serverShuttingDown', function(eventData)
    local embed = {
        {
            title = "Server Stopped",
            color = 5087487,
            fields = {
                { name = "", value = eventData.author, inline = true },
            },
            author = { name = "txAdmin Logging System" }
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers)
        if err ~= 204 then
            print("Failed to send webhook for Server Stopped: " .. tostring(err))
        end
    end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end)

-- Admin Authenticated or Revoked Event 
AddEventHandler('txAdmin:events:adminAuth', function(eventData)
    local netid = eventData.netid or -1
    local isAdmin = eventData.isAdmin and "Granted" or "Revoked"
    local username = eventData.username or "Unknown Admin"

    local embed = {
        {
            title = "Admin Authentication Update",
            color = isAdmin == "Granted" and 65280 or 16711680, -- It will be green if the admin has been authed, and red if not.
            fields = {
                { name = "Admin Username", value = username, inline = true },
                { name = "Player Net ID", value = tostring(netid), inline = true },
                { name = "Admin Status", value = isAdmin, inline = true },
            },
            author = { name = "txAdmin Logging System" }
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers)
        if err ~= 204 then
            print("Failed to send webhook for Admin Authentication Update: " .. tostring(err))
        end
    end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end)

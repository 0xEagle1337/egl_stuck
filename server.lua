local language = config.Locales
local locale = Locales[language]

local time = 5000
local lastPos = {}
local lastTime = {}

RegisterCommand("stuck", function(source, args, rawCommand)
    local playerPed = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(playerPed)
    
    if isStuck(source, playerCoords) then
        TriggerClientEvent('findGoodPos', source, playerCoords)
    else
        TriggerClientEvent('message', source, locale['no_stuck'])
    end
end, false)

function isStuck(playerId, actualPos)
    if lastPos[playerId] then
        local dx = actualPos.x - lastPos[playerId].x
        local dy = actualPos.y - lastPos[playerId].y
        local dz = actualPos.z - lastPos[playerId].z

        if (dx*dx + dy*dy + dz*dz) < 1.0 and (GetGameTimer() - lastTime[playerId]) > time then
            return true
        end
    end

    lastPos[playerId] = actualPos
    lastTime[playerId] = GetGameTimer()
    return false
end

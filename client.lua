local language = config.Locales
local locale = Locales[language]

RegisterNetEvent('findGoodPos')
AddEventHandler('findGoodPos', function(actualPos)
    local x, y, z = actualPos.x, actualPos.y, actualPos.z
    local newPos = findGoodPos(x, y, z)
    if newPos then
        SetEntityCoords(PlayerPedId(), newPos.x, newPos.y, newPos.z, false, false, false, true)
    else
        TriggerEvent('message', locale['no_safe_position_found'])
    end
end)

function findGoodPos(x, y, z)
    local distance = 1.0
    local ray = 0.5
    local raycastFlags = 1

    for i = 0, 359, 45 do
        local rad = math.rad(i)
        local posXTest = x + distance * math.cos(rad)
        local posYTest = y + distance * math.sin(rad)

        local hit, hitPos, surfaceNormal, materialHash, entityHit = StartShapeTestCapsule(x, y, z, posXTest, posYTest, z, ray, raycastFlags, PlayerPedId(), 7)
        local _, _, _, _, _ = GetShapeTestResultIncludingMaterial(hit)

        if not entityHit then
            return vector3(posXTest, posYTest, z)
        end
    end

    return nil
end

RegisterNetEvent('message')
AddEventHandler('message', function(message)
    TriggerEvent('chatMessage', loale['system'], {255, 0, 0}, message)
end)

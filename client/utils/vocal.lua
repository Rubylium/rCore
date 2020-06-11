local deltas = {
    vector2(-1, -1),
    vector2(-1, 0),
    vector2(-1, 1),
    vector2(0, -1),
    vector2(1, -1),
    vector2(1, 0),
    vector2(1, 1),
    vector2(0, 1),
}
 
 
local targetList = {}
local lastTargetList = {}
 
 
local function getGridChunk(x)
    return math.floor((x + 8192) / 256)
end
 
local function getGridBase(x)
    return (x * 256) - 8192
end
 
local function toChannel(v)
    return (v.x << 8) | v.y
end
 
local function DoVoiceSystem()
    local coords = GetEntityCoords(PlayerPedId())
 
    local gz = vector2(getGridChunk(coords.x), getGridChunk(coords.y))
 
    local gridZone = toChannel(gz)
 
    NetworkSetVoiceChannel(gridZone)
 
    targetList = {}
 
    for _, d in ipairs(deltas) do
        local v = coords.xy + (d * 20) -- edge size
   
        targetList[toChannel(vector2(getGridChunk(v.x), getGridChunk(v.y)))] = true
    end
 
    MumbleClearVoiceTarget(2)
    for k, _ in pairs(targetList) do
        MumbleAddVoiceTargetChannel(2, k)
    end
    MumbleSetVoiceTarget(2)
 
    lastTargetList = targetList
end
 
-- Loop

local talking = false
function InitVoiceChat()
    Citizen.CreateThread(function()
        Citizen.Wait(500)
    
        while true do
            DoVoiceSystem()
            if NetworkIsPlayerTalking(GetPlayerIndex()) then
                if not talking then
                    SendNUIMessage({ 
                        mic = true
                    })
                    talking = true
                end
            else
                if talking then
                    SendNUIMessage({ 
                        mic = false
                    })
                    talking = false
                end
            end
            Citizen.Wait(250)
        end
    end)
    rUtils.ImportantNotif("Vocal: ~g~Connecté avec succès")
end



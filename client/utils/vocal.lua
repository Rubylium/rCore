

function InitVoiceChat()
    rUtils.ImportantNotif("Vocal: ~g~Connecté avec succès")
    
    function round(num, numDecimalPlaces)
        local mult = 10^(numDecimalPlaces or 0)
        return math.floor(num * mult + 0.5) / mult
    end
    
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
    
    local function getGridChunk(x)
        return math.floor((x + 8192) / 128)
    end
    
    local function getGridBase(x)
        return (x * 128) - 8192
    end
    
    local function toChannel(v)
        return (v.x << 8) | v.y
    end
    
    local targetList = {}
    local lastTargetList = {}
    
    -- loop
    
    
    NetworkSetVoiceChannel(gridZone)
    
    targetList = {}
    
    local channelActuel = 0
    Citizen.CreateThread(function()
        NetworkSetVoiceActive(true)
        NetworkClearVoiceChannel()
        NetworkSetVoiceChannel(1)
        while true do
            Wait(250)
            local pPed = GetPlayerPed(-1)
            local pCoords = GetEntityCoords(pPed)
            local GlobalChannel = 0
    
            local coords = GetEntityCoords(PlayerPedId())
            local gz = vector2(getGridChunk(coords.x), getGridChunk(coords.y))
            local GlobalChannel = toChannel(gz)
    
            channelActuel = GlobalChannel
            NetworkClearVoiceChannel()
            NetworkSetVoiceActive(true)
            NetworkSetVoiceChannel(GlobalChannel)
        end
    end)
    
end



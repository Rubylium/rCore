-- ############################################
-- --------------------------------------------
-- 3dme : /me command but its 3D printed
-- Author : Elio
-- Client side
-- --------------------------------------------
-- ############################################

-- --------------------------------------------
-- Settings
-- --------------------------------------------

local defaultScale = 0.5 -- Text scale
local color = {250, 200, 135, 200 } -- Text color
local font = 0 -- Text font
local displayTime = 5000 -- Duration to display the text (in ms)
local distToDraw = 250 -- Min. distance to draw 

-- --------------------------------------------
-- Variable
-- --------------------------------------------

local pedDisplaying = {}

-- --------------------------------------------
-- Functions
-- --------------------------------------------

-- OBJ : draw text in 3d
-- PARAMETERS :
--      - coords : world coordinates to where you want to draw the text
--      - text : the text to display
function DrawText3D(coords, text)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    
    -- Experimental math to scale the text down
    local scale = 200 / (GetGameplayCamFov() * dist)

    --if onScreen then

        -- Format the text
        SetTextColour(color[1], color[2], color[3], color[4])
        SetTextScale(0.0, defaultScale * scale)
        SetTextDropshadow(0, 0, 0, 0, 55)
        SetTextDropShadow()
        SetTextCentre(true)

        -- Diplay the text
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName(text)
        SetDrawOrigin(coords, 0)
        EndTextCommandDisplayText(0.0, 0.0)
        ClearDrawOrigin()

    --end
end

-- OBJ : handle the drawing of text above a ped head
-- PARAMETERS :
--      - coords : world coordinates to where you want to draw the text
--      - text : the text to display
local function Display(ped, text)

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local pedCoords = GetEntityCoords(ped)
    local dist = #(playerCoords - pedCoords)

    if dist <= distToDraw then

        pedDisplaying[ped] = (pedDisplaying[ped] or 1) + 1

        -- Timer
        local display = true

        Citizen.CreateThread(function()
            Wait(displayTime)
            display = false
        end)

        -- Display
        local offset = 0.8 + pedDisplaying[ped] * 0.1
        while display do
            if HasEntityClearLosToEntity(playerPed, ped, 17 ) then
                local x, y, z = table.unpack(GetEntityCoords(ped))
                z = z + offset
                DrawText3D(vector3(x, y, z), text)
            end
            Wait(0)
        end

        pedDisplaying[ped] = pedDisplaying[ped] - 1

    end
end

-- --------------------------------------------
-- Event
-- --------------------------------------------
local function TableToString(tab)
	local str = ""
	for i = 1, #tab do
		str = str .. " " .. tab[i]
	end
	return str
end


-- --------------------------------------------
-- Commands
-- --------------------------------------------
local allowed = true
RegisterCommand('me', function(source, args)
    if allowed then
        local pPedSID = GetPlayerServerId(GetPlayerIndex())
        local players = GetActivePlayers()
        local idsToSend = {}
        for k,v in pairs(players) do
            table.insert(idsToSend, GetPlayerServerId(v))
        end
        local text = "* la personne" .. TableToString(args) .. " *"
        TriggerServerEvent(events.actionText, token, idsToSend, text, pPedSID)
        ActionMeCoolDown()
    end
end)


function SendActionTxt(text)
    if allowed then
        local pPedSID = GetPlayerServerId(GetPlayerIndex())
        local players = GetActivePlayers()
        local idsToSend = {}
        local pCoords = GetEntityCoords(pPed)
        for k,v in pairs(players) do
            local dst = GetDistanceBetweenCoords(pCoords, GetEntityCoords(GetPlayerPed(v)), true)
            if dst < 100 then
                table.insert(idsToSend, GetPlayerServerId(v))
            end
        end
        local text = "* la personne" .. text .. " *"
        TriggerServerEvent(events.actionText, token, idsToSend, text, pPedSID)
        ActionMeCoolDown()
    end
end

RegisterNetEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(text, serverId)
    local ped = GetPlayerPed(GetPlayerFromServerId(serverId))
    Display(ped, text)
end)


function ActionMeCoolDown()
    allowed = false
    Citizen.CreateThread(function()
        Wait(6*1000)
        allowed = true
    end)
end
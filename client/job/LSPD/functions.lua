

IsCuffed = false

local dict = "mp_arresting"
local anim = "idle"

local flags = 49 -- Let the player move

local femaleHash = GetHashKey("mp_f_freemode_01")
local maleHash = GetHashKey("mp_m_freemode_01")

local prevMaleVariation = 0
local prevFemaleVariation = 0

RegisterNetEvent("core:CuffPlayer")
AddEventHandler("core:CuffPlayer", function(status, freeze)
    if not status then
        if GetEntityModel(pPed) == femaleHash then -- mp female
            SetPedComponentVariation(pPed, 7, prevFemaleVariation, 0, 0)
        elseif GetEntityModel(pPed) == maleHash then -- mp male
            SetPedComponentVariation(pPed, 7, prevMaleVariation, 0, 0)
        end

        ClearPedTasks(pPed)
        FreezeEntityPosition(pPed, false)
        SetEnableHandcuffs(pPed, false)
        IsCuffed = false
    else 
        IsCuffed = true
        if GetEntityModel(pPed) == femaleHash then -- mp female
            prevFemaleVariation = GetPedDrawableVariation(pPed, 7)
            SetPedComponentVariation(pPed, 7, 25, 0, 0)
        
        elseif GetEntityModel(pPed) == maleHash then -- mp male
            prevMaleVariation = GetPedDrawableVariation(pPed, 7)
            SetPedComponentVariation(pPed, 7, 41, 0, 0)
        end

        if freeze then
            FreezeEntityPosition(pPed, true)
        end

        SetEnableHandcuffs(pPed, true)
        rUtils.PlayAnim(dict, anim, flags, 8.0, -8, nil, -1)
        StartCuffLoop()
    end
end)



local LockedControls = {166,167,168,288,289,38,311,182, 21}
function StartCuffLoop()
    Citizen.CreateThread(function()
        while IsCuffed do
            if not IsEntityPlayingAnim(pPed, dict, anim, flags) then
                rUtils.PlayAnim(dict, anim, flags, 8.0, -8, nil, -1)
            end
            for k,v in pairs(LockedControls) do
                DisableControlAction(1, v, true)
            end
            Wait(1)
        end
    end)
end
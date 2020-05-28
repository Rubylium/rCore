

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
        rUtils.PlayAnim("mp_arresting", "b_uncuff", 1, 100.0, nil, nil, 5800)
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



local LockedControls = {166,167,168,288,289,38,311,182,21,24,25,82}
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


local EnTrainEscorter = false
local PolicierEscorte = nil
RegisterNetEvent("core:EscortPlayer")
AddEventHandler("core:EscortPlayer", function(player)
	EnTrainEscorter = not EnTrainEscorter
    PolicierEscorte = policier
    if EnTrainEscorter then
        escort()
    end
end)


function escort()
	while EnTrainEscorter do
		Citizen.Wait(1)
		local targetPed = GetPlayerPed(GetPlayerFromServerId(PolicierEscorte))

		if not IsPedSittingInAnyVehicle(targetPed) then
			AttachEntityToEntity(pPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
		else
			EnTrainEscorter = false
			DetachEntity(pPed, true, false)
		end

		if IsPedDeadOrDying(targetPed, true) then
			EnTrainEscorter = false
			DetachEntity(pPed, true, false)
		end
    end
    DetachEntity(pPed, true, false)
end
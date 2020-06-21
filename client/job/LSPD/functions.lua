

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
    RemoveAllPedWeapons_(pPed, 0)
    if IsCuffed and status then
        if not freeze then
            FreezeEntityPosition(pPed, false)
        else
            FreezeEntityPosition(pPed, true)
        end
    else
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
    end
end)



local LockedControls = {166,167,168,288,289,38,311,182,21,24,25,82,75,38,45,80,140,22, 142}
function StartCuffLoop()
    Citizen.CreateThread(function()
        while IsCuffed do
            RemoveAllPedWeapons_(pPed, 0)
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
    PolicierEscorte = player
    if EnTrainEscorter then
        escort()
    end
end)


function escort()
	while EnTrainEscorter do
		Wait(1)
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


Citizen.CreateThread(function()
	while true do
        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
            Wait(0)
			if GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), 0) == GetPlayerPed(-1) then
				if GetIsTaskActive(GetPlayerPed(-1), 165) then
					SetPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), false), 0)
				end
            end
        else
            Wait(500)
		end
	end
end)


RegisterNetEvent("core:PutInVeh")
AddEventHandler("core:PutInVeh", function()
    if EnTrainEscorter then EnTrainEscorter = false FreezeEntityPosition(pPed, false) end
    local veh, dst = rUtils.GetClosestVehicle(GetEntityCoords(pPed))
    if dst > 5.0 then return end
    local place = GetVehicleMaxNumberOfPassengers(veh)

    for i = 1, place do
        if IsVehicleSeatFree(veh, i) then
            TaskEnterVehicle(pPed, veh, 5000, i, 1.0, 1, 0)
            Wait(5000)
            if not IsPedInAnyVehicle(pPed, false) then
                TaskWarpPedIntoVehicle(pPed, veh, i)
            end
            return
        end
    end

end)

RegisterNetEvent("core:PutOutVeh")
AddEventHandler("core:PutOutVeh", function()
    if EnTrainEscorter then EnTrainEscorter = false end
    if IsPedInAnyVehicle(pPed, false) then
        TaskLeaveAnyVehicle(pPed, 0, 0)
    end
end)


RegisterNetEvent("core:SendRadioCall")
AddEventHandler("core:SendRadioCall", function(source, code, label, pos, prenom, nom)
    if pos == false then
        rUtils.ShowAdvancedNotification("CENTRAL LSPD", "Code: ~b~"..code, "~o~"..label.."\n~w~Agents: ~o~"..prenom.." "..nom, "CHAR_CALL911", 2)
    else
        rUtils.ShowAdvancedNotification("CENTRAL LSPD", "Code: ~b~"..code, "~o~"..label.."\n~w~Agents: ~o~"..prenom.." "..nom, "CHAR_CALL911", 2)
        local blip = AddBlipForCoord(pos)
        SetBlipSprite(blip, 4)
        SetBlipScale(blip, 0.40)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(prenom.." "..nom.." - ~b~"..code)
        EndTextCommandSetBlipName(blip)
        Wait(30*1000)
        RemoveBlip(blip)
    end
end)



local shieldActive = false
local shieldEntity = nil
local hadPistol = false

-- ANIM
local animDict = "combat@gestures@gang@pistol_1h@beckon"
local animName = "0"

local prop = "prop_ballistic_shield"
local pistol = GetHashKey("WEAPON_COMBATPISTOL")

function EnableShield()
    if pInventory["Arme de poing force de l'ordre"] == nil then 
        rUtils.Notif("Tu doit avoir une ~b~Arme de poing force de l'ordre~s~ pour faire ça.")
        return
    end
    shieldActive = true
    local pedPos = GetEntityCoords(ped, false)
    
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(100)
    end

    TaskPlayAnim(pPed, animDict, animName, 8.0, -8.0, -1, (2 + 16 + 32), 0.0, 0, 0, 0)

    RequestModel(GetHashKey(prop))
    while not HasModelLoaded(GetHashKey(prop)) do
        Citizen.Wait(100)
    end

    local shield = CreateObject_(GetHashKey(prop), pedPos.x, pedPos.y, pedPos.z, 1, 1, 1)
    shieldEntity = ObjToNet(shield)
    AttachEntityToEntity(shield, pPed, GetEntityBoneIndexByName(pPed, "IK_L_Hand"), 0.0, -0.05, -0.10, -30.0, 180.0, 40.0, 0, 0, 1, 0, 0, 1)
    SetWeaponAnimationOverride(pPed, GetHashKey("Gang1H"))
    GiveWeaponToPed_(pPed, pistol, 300, 0, 1)
    SetCurrentPedWeapon(pPed, pistol, 1)

    Citizen.CreateThread(function()
        while shieldActive do
            if not IsEntityPlayingAnim(pPed, animDict, animName, 1) then
                RequestAnimDict(animDict)
                while not HasAnimDictLoaded(animDict) do
                    Citizen.Wait(100)
                end
            
                TaskPlayAnim(pPed, animDict, animName, 8.0, -8.0, -1, (2 + 16 + 32), 0.0, 0, 0, 0)
            end

            if IsPedInAnyVehicle(pPed, true) then
                DisableShield()
            end
            Citizen.Wait(100)
        end
    end)
end

function DisableShield()
    TriggerServerEvent(events.DelEntity, token, shieldEntity)
    ClearPedTasksImmediately(pPed)
    SetWeaponAnimationOverride(pPed, GetHashKey("Default"))

    shieldActive = false
end


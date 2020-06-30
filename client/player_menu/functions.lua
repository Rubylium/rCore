
local object = {}
Citizen.CreateThread(function()
    while true do
        object = {}
        for v in EnumerateObjects() do
            table.insert(object, v)
        end
        Wait(3000)
    end
end)


local Nearest = nil
local NearProp = false
Citizen.CreateThread(function()
    DecorRegister("CivilProps", 3)
    Wait(5000)
    while true do
        local pPed = GetPlayerPed(-1)
        local pCoords = GetEntityCoords(pPed)
        local NearLocal = false
        for k,v in pairs(object) do
            local oCoords = GetEntityCoords(v)
            local dst = GetDistanceBetweenCoords(pCoords, oCoords, true)
            if dst <= 2.0 then
                if DecorExistOn(v, "CivilProps") then
                    Nearest = v
                    NearProp = true
                    NearLocal = true
                    break
                end
            end
        end
        if not NearLocal then
            NearProp = false
        end
        if NearProp then
            Wait(150)
        else
            Wait(1500)
        end
        
    end
end)

Citizen.CreateThread(function()
    while true do
        if NearProp then
            Wait(1)
            local oCoords = GetEntityCoords(Nearest)
            FreezeEntityPosition(v, true)
            DrawTxt(vector3(oCoords.x, oCoords.y, oCoords.z+1.0), "Appuyer sur E pour enlever l'objets.")
            if IsControlJustReleased(1, 38) then
                TriggerServerEvent(events.DelEntity, token, NetworkGetNetworkIdFromEntity(Nearest))
            end
        else
            Wait(500)
        end   
    end
end)

function DrawTxt(coords, text)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)

    local scale = 200 / (GetGameplayCamFov() * dist)
    SetTextColour(189, 189, 189, 255)
    SetTextScale(0.0, 0.2 * scale)
    SetTextDropshadow(0, 0, 0, 0, 55)
    SetTextDropShadow()
    SetTextCentre(true)

    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

function SpawnObj(obj)
	local coords, forward = GetEntityCoords(pPed), GetEntityForwardVector(pPed)
    local objectCoords = (coords + forward * 2.5)
    local Ent = nil

    SpawnObject(obj, objectCoords, function(obj)
        SetEntityCoords(obj, objectCoords, 0.0, 0.0, 0.0, 0)
        SetEntityHeading(obj, GetEntityHeading(pPed))
        PlaceObjectOnGroundProperly(obj)
        Ent = obj
        Wait(1)
    end)
    Wait(1)
    while Ent == nil do Wait(1) end
    SetEntityHeading(Ent, GetEntityHeading(pPed))
    PlaceObjectOnGroundProperly(Ent)
    local placed = false
    while not placed do
        Wait(1)
        local coords, forward = GetEntityCoords(pPed), GetEntityForwardVector(pPed)
        local objectCoords = (coords + forward * 2.5)
        SetEntityCoords(Ent, objectCoords, 0.0, 0.0, 0.0, 0)
        SetEntityHeading(Ent, GetEntityHeading(pPed))
        PlaceObjectOnGroundProperly(Ent)
		SetEntityAlpha(Ent, 170, 170)
        SetEntityNoCollisionEntity(pPed, Ent, false)
        DisableControlAction(1, 21, true)
        
		RageUI.Text({
			message = string.format("Appuyer sur CLIQUE MOLETTE pour poser l'objets")
		})

        if IsControlJustReleased(1, 348) then
            placed = true
        end
    end
    SetEntityNoCollisionEntity(pPed, Ent, true)
	SetEntityCollision(Ent, 1, 1)
    FreezeEntityPosition(Ent, true)
    SetEntityInvincible(Ent, true)
    ResetEntityAlpha(Ent)
    local NetId = NetworkGetNetworkIdFromEntity(Ent)
    if NetId == 0 then
        DeleteEntity(Ent)
    end
	SetNetworkIdCanMigrate(NetId, true)
    DecorSetInt(NetworkGetEntityFromNetworkId(NetId), "CivilProps", 1)
end

function SpawnObject(model, coords, cb)
	local model = GetHashKey(model)

	Citizen.CreateThread(function()
		RequestModels(model)
        Wait(1)
		local obj = CreateObject_(model, coords.x, coords.y, coords.z, true, false, true)

		if cb then
			cb(obj)
		end
	end)
end

function RequestModels(modelHash)
	if not HasModelLoaded(modelHash) and IsModelInCdimage(modelHash) then
		RequestModel(modelHash)

        while not HasModelLoaded(modelHash) do
			Citizen.Wait(1)
		end
	end
end



function GoToBlip()
    local waypointHandle = GetFirstBlipInfoId(8)

    if DoesBlipExist(waypointHandle) then
        Citizen.CreateThread(function()
            local waypointCoords = GetBlipInfoIdCoord(waypointHandle)
            local foundGround, zCoords, zPos = false, -500.0, 0.0

            while not foundGround do
                zCoords = zCoords + 10.0
                RequestCollisionAtCoord(waypointCoords.x, waypointCoords.y, zCoords)
                Citizen.Wait(0)
                foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords.x, waypointCoords.y, zCoords)

                if not foundGround and zCoords >= 2000.0 then
                    foundGround = true
                end
            end

            SetPedCoordsKeepVehicle(pPed, waypointCoords.x, waypointCoords.y, zPos)
        end)
    else
        rUtils.Notif("Aucun point GPS.")
    end
end

local gamerTags = {}
local showNames = false

local staffColor = {
    [0] = {color = "0", tag = ""},
    [1] = {color = "50", tag = ""},
    [2] = {color = "200", tag = ""},
    [3] = {color = "255", tag = ""},
    [4] = {color = "170", tag = "🛠️"},
}

function ShowNames(status)
    if status ~= nil then
        showNames = false
        return
    end
    showNames = not showNames
    if showNames then
        Citizen.CreateThread(function()
            while showNames do
                local pCoords = GetEntityCoords(pPed, false)
                for _, v in pairs(GetActivePlayers()) do
                    local otherPed = GetPlayerPed(v)
                    local staff = DecorGetInt(otherPed, "group")
                    if staff == nil then 
                        staff = 0
                    end
                    local color = staffColor[staff].color
                    local tag = staffColor[staff].tag
                    
                
                    if otherPed ~= pPed then
                        if #(pCoords - GetEntityCoords(otherPed, false)) < 250.0 then
                            gamerTags[v] = CreateFakeMpGamerTag(otherPed, tag.." ["..GetPlayerServerId(v).."] "..GetPlayerName(v).."("..GetEntityHealth(otherPed)..")", false, false, "", 0)
                            if staff ~= 0 then
                                SetMpGamerTagColour(gamerTags[v], 0, color)
                            end
                            SetMpGamerTagVisibility(gamerTags[v], 2, true)
                            SetMpGamerTagHealthBarColour(gamerTags[v], 0)
                            SetMpGamerTagName(gamerTags[v], tag.." ["..GetPlayerServerId(v).."] "..GetPlayerName(v).."("..GetEntityHealth(otherPed)..")")
                            if NetworkIsPlayerTalking(v) then
                                SetMpGamerTagVisibility(gamerTags[v], 16, 1)
                            else
                                SetMpGamerTagVisibility(gamerTags[v], 16, 0)
                            end
                        else
                            RemoveMpGamerTag(gamerTags[v])
                            gamerTags[v] = nil
                        end
                    end
                end
                Wait(500)
            end

            for _, v in pairs(gamerTags) do
                RemoveMpGamerTag(v)
                gamerTags[v] = nil
            end
        end)
    end
end

local noClip = false
local NoClipSpeed = 0.5
function NoClip()
    NoClipSpeed = 0.5
    noClip = not noClip
    if noClip then    
        Citizen.CreateThread(function()
            while noClip do 
                Wait(1)
                local pCoords = GetEntityCoords(pPed, false)
                local camCoords = getCamDirection()
                SetEntityVelocity(pPed, 0.01, 0.01, 0.01)
                SetEntityCollision(pPed, 0, 1)
                FreezeEntityPosition(pPed, true)

                if IsControlPressed(0, 32) then
                    pCoords = pCoords + (NoClipSpeed * camCoords)
                end
            
                if IsControlPressed(0, 269) then
                    pCoords = pCoords - (NoClipSpeed * camCoords)
                end
            
                if IsDisabledControlJustPressed(1, 15) then
                    NoClipSpeed = NoClipSpeed + 0.3
                end
                if IsDisabledControlJustPressed(1, 14) then
                    NoClipSpeed = NoClipSpeed - 0.3
                    if NoClipSpeed < 0 then
                        NoClipSpeed = 0
                    end
                end
                SetEntityCoordsNoOffset(pPed, pCoords, true, true, true)
                SetEntityVisible(pPed, 0, 0)
                
            end
            FreezeEntityPosition(pPed, false)
            SetEntityVisible(pPed, 1, 0)
            SetEntityCollision(pPed, 1, 1)
        end)
        
    end
end

function getCamDirection()
    local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(pPed)
	local pitch = GetGameplayCamRelativePitch()
	local coords = vector3(-math.sin(heading * math.pi / 180.0), math.cos(heading * math.pi / 180.0), math.sin(pitch * math.pi / 180.0))
	local len = math.sqrt((coords.x * coords.x) + (coords.y * coords.y) + (coords.z * coords.z))

	if len ~= 0 then
		coords = coords / len
	end

	return coords
end

RegisterNetEvent("core:ClearAreaFromObjects")
AddEventHandler("core:ClearAreaFromObjects", function(coords)
    ClearAreaOfObjects(coords, 50.0, 0)
end)


RegisterNetEvent("core:ChangepCoords")
AddEventHandler("core:ChangepCoords", function(coords)
    SetEntityCoordsNoOffset(pPed, coords, 0.0, 0.0, 0.0)
end)




carryingBackInProgress = false
local carryAnimNamePlaying = ""
local carryAnimDictPlaying = ""
local carryControlFlagPlaying = 0


function CarryNearest()
	if not carryingBackInProgress then
		local player = PlayerPedId()	
		local lib = 'missfinale_c2mcs_1'
		local anim1 = 'fin_c2_mcs_1_camman'
		local lib2 = 'nm'
		local anim2 = 'firemans_carry'
		local distans = 0.15
		local distans2 = 0.27
		local height = 0.63
		local spin = 0.0		
		local length = 100000
		local controlFlagMe = 49
		local controlFlagTarget = 33
		local animFlagTarget = 1
		local closestPlayer, dst = rUtils.GetClosestPlayer()
        if closestPlayer ~= nil and dst < 2.5 then
            local target = GetPlayerServerId(closestPlayer)
            carryingBackInProgress = true
            StartCarryLoop()
			TriggerServerEvent(events.CarrySync, token, closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget)
		else
			rUtils.ImportantNotif("Aucun joueur proche à porter!")
		end
	else
		carryingBackInProgress = false
		ClearPedSecondaryTask(pPed)
		DetachEntity(pPed, true, false)
		local closestPlayer = rUtils.GetClosestPlayer()
		target = GetPlayerServerId(closestPlayer)
		if target ~= 0 then 
			TriggerServerEvent(events.CarryStop, token, target)
		end
	end
end


RegisterNetEvent('CarryPeople:syncTarget')
AddEventHandler('CarryPeople:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
	local playerPed = pPed
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
    carryingBackInProgress = true
    StartCarryLoop()
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	if spin == nil then spin = 180.0 end
	AttachEntityToEntity(pPed, targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	carryAnimNamePlaying = animation2
	carryAnimDictPlaying = animationLib
	carryControlFlagPlaying = controlFlag
end)

RegisterNetEvent('CarryPeople:syncMe')
AddEventHandler('CarryPeople:syncMe', function(animationLib, animation,length,controlFlag,animFlag)
	local playerPed = pPed
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	Wait(500)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)
	carryAnimNamePlaying = animation
	carryAnimDictPlaying = animationLib
	carryControlFlagPlaying = controlFlag
end)

RegisterNetEvent('CarryPeople:cl_stop')
AddEventHandler('CarryPeople:cl_stop', function()
	carryingBackInProgress = false
	ClearPedSecondaryTask(pPed)
	DetachEntity(pPed, true, false)
end)


function StartCarryLoop()
    Citizen.CreateThread(function()
    	while carryingBackInProgress do
    		while not IsEntityPlayingAnim(pPed, carryAnimDictPlaying, carryAnimNamePlaying, 3) do
    			TaskPlayAnim(pPed, carryAnimDictPlaying, carryAnimNamePlaying, 8.0, -8.0, 100000, carryControlFlagPlaying, 0, false, false, false)
    			Citizen.Wait(0)
    		end
    		Wait(0)
    	end
    end)
end



Citizen.CreateThread(function()
    while true do
        local TooMuch = false
        if pWeight > 40.0 then
            rUtils.Notif("~r~ATTENTION\n~w~Tu porte trop de chose.")
        end

        if pWeight > 45 then
            DisableControlAction(1, 21, true)
            DisableControlAction(1, 22, true)
            TooMuch = true
        end


        if not IsPedInAnyVehicle(pPed, 0) then
            if pWeight > 48 then
                local i = math.random(1,1200)
                if i == 1200 then
                    print("Fall")
                    SetPedToRagdoll(pPed, 1000, 1000, 3, 1, 1, 1)
                    RageUI.Text({message = "Tu as trébuché à cause de tout ce que tu portes", time_display = 3000})
                end
            end
        end

        if not TooMuch then
            Wait(3000)
        else
            Wait(1)
        end
    end
end)

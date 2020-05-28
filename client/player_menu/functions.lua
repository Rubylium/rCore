
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
                TriggerServerEvent("DeleteEntity", token, NetworkGetNetworkIdFromEntity(Nearest))
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
		local obj = CreateObject(model, coords.x, coords.y, coords.z, true, false, true)

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
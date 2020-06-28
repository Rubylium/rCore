rUtils = {}


function SetWeaponDrops()
	local handle, ped = FindFirstPed()
	local finished = false

	repeat
		if not IsEntityDead(ped) then
			SetPedDropsWeaponsWhenDead(ped, false)
		end
		finished, ped = FindNextPed(handle)
	until not finished

	EndFindPed(handle)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		SetWeaponDrops()
	end
end)

Citizen.CreateThread(function()
	NetworkSetFriendlyFireOption(true)
	SetCanAttackFriendly(PlayerPedId(), true, true)
	DecorRegister("veh_allowed", 2)
	DecorRegister("OWNED_VEH", 2)
	while true do
		ClearPlayerWantedLevel(GetPlayerIndex())
		RestorePlayerStamina(PlayerId(), 1.0)
		for v in EnumeratePeds() do
			if not IsPedAPlayer(v) then
				SetPedAccuracy(v, 0.0)
				SetPedCombatAbility(v, 0)
				SetPedCombatAttributes(v, 1424, false)
				SetPedCombatAttributes(v, 5, false)
				SetPedCombatRange(v, 0)
			end
		end
		Wait(5000)
	end
end)

--Citizen.CreateThread(function()
--	while true do
--		if pVeh == 0 then
--			if GetInteriorAtCoords(GetEntityCoords(pPed)) == 0 then
--				SetRadarZoomToDistance(50.0)
--			else
--				SetRadarZoomToDistance(25.0)
--			end
--		else
--			SetRadarZoomToDistance(145.0)
--		end
--
--		Wait(1)
--	end
--end)

rUtils.GetClosestPlayer = function()
	local players = GetActivePlayers()
	local coords = GetEntityCoords(pPed)
	local pCloset = nil
	local pClosetPos = nil
	local pClosetDst = nil
	for k,v in pairs(players) do
		if GetPlayerPed(v) ~= pPed then
			local oPed = GetPlayerPed(v)
			local oCoords = GetEntityCoords(oPed)
			local dst = GetDistanceBetweenCoords(oCoords, coords, true)
			if pCloset == nil then
				pCloset = v
				pClosetPos = oCoords
				pClosetDst = dst
			else
				if dst < pClosetDst then
					pCloset = v
					pClosetPos = oCoords
					pClosetDst = dst
				end
			end
		end
	end

	return pCloset, pClosetDst
end


rUtils.DisplayClosetPlayer = function()
	local pCoords = GetEntityCoords(pPed)
	local pCloset = rUtils.GetClosestPlayer(pCoords)
	if pCloset ~= -1 then
		local cCoords = GetEntityCoords(GetPlayerPed(pCloset))
		DrawMarker(20, cCoords.x, cCoords.y, cCoords.z+1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 255, 170, 0, 1, 2, 0, nil, nil, 0)
	end
end


rUtils.GetPlayersInArea = function(coords, area)
	local players       = GetActivePlayers()
	local playersInArea = {}

	for i=1, #players, 1 do
		local target       = GetPlayerPed(players[i])
		local targetCoords = GetEntityCoords(target)
		local distance     = GetDistanceBetweenCoords(targetCoords, coords.x, coords.y, coords.z, true)

		if distance <= area then
			table.insert(playersInArea, players[i])
		end
	end

	return playersInArea
end

rUtils.GetVehicles = function()
	local vehicles = {}

	for vehicle in EnumerateVehicles() do
		table.insert(vehicles, vehicle)
	end

	return vehicles
end

rUtils.GetClosestVehicle = function(coords)
	local vehicles        = rUtils.GetVehicles()
	local closestDistance = -1
	local closestVehicle  = -1
	local coords          = coords

	if coords == nil then
		local playerPed = PlayerPedId()
		coords          = GetEntityCoords(playerPed)
	end

	for i=1, #vehicles, 1 do
		local vehicleCoords = GetEntityCoords(vehicles[i])
		local distance      = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)

		if closestDistance == -1 or closestDistance > distance then
			closestVehicle  = vehicles[i]
			closestDistance = distance
		end
	end

	return closestVehicle, closestDistance
end

rUtils.GetVehiclesInArea = function(coords, area)
	local vehicles       = rUtils.GetVehicles()
	local vehiclesInArea = {}

	for i=1, #vehicles, 1 do
		local vehicleCoords = GetEntityCoords(vehicles[i])
		local distance      = GetDistanceBetweenCoords(vehicleCoords, coords.x, coords.y, coords.z, true)

		if distance <= area then
			table.insert(vehiclesInArea, vehicles[i])
		end
	end

	return vehiclesInArea
end

rUtils.IsSpawnPointClear = function(coords, radius)
	local vehicles = rUtils.GetVehiclesInArea(coords, radius)

	return #vehicles == 0
end

function rUtils.GetZoneFromTable(table)
	local found = false
	local try = 0
	while not found do
		try = try + 1
		local i = math.random(1,#table)
		if rUtils.IsSpawnPointClear(table[i].pos, 3.0) then
			found = true
			return table[i].pos, table[i].heading
		end
		if try > #table then
			return false
		end
		Wait(1)
	end
end

function rUtils.SpawnVehicle(model, coords, heading, props, cb)
	rUtils.LoadModel(model)
	local vehicle = CreateVehicle_(model, coords, heading, 1, 0)
	SetVehicleDirtLevel(vehicle, 0.0)
	SetEntityCoordsNoOffset(vehicle, coords.x, coords.y, coords.z+0.5, 0.0, 0.0, 0.0)
	SetVehicleOnGroundProperly(vehicle)
	SetEntityHeading(vehicle, heading)
	DecorSetBool(vehicle, "veh_allowed", true)
	SetEntityAsMissionEntity(vehicle, 1, 1)
	if props ~= nil then
		rUtils.SetVehicleProperties(vehicle, props)
	end
	if cb ~= nil then 
		cb(vehicle)
	end 
	--SetModelAsNoLongerNeeded(model)
end

function rUtils.GetClosestObject(vector, radius, modelHash, testFunction)
	if not vector or not radius then return end
	local handle, veh = FindFirstObject()
	local success, theVeh
	repeat
		local firstDist = GetDistanceBetweenCoords(GetEntityCoords(veh), vector.x, vector.y, vector.z, true)
		if firstDist < radius and (not modelHash or modelHash == GetEntityModel(veh)) and (not theVeh or firstDist < GetDistanceBetweenCoords(GetEntityCoords(theVeh), GetEntityCoords(veh), true)) and (not testFunction or testFunction(veh)) then
			theVeh = veh
		end
		success, veh = FindNextObject(handle)
	until not success
		EndFindObject(handle)
	return theVeh
end

function rUtils.Notif(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function rUtils.ImportantNotif(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(true, false)
end

function rUtils.ShowHelpNotification(msg)
	AddTextEntry('HelpNotif', msg)
	BeginTextCommandDisplayHelp('HelpNotif')
	EndTextCommandDisplayHelp(0, false, false, 10)
end

function rUtils.ShowAdvancedNotification(sender, subject, msg, textureDict, iconType, flash, saveToBrief, hudColorIndex)
	if saveToBrief == nil then saveToBrief = true end
	AddTextEntry('AdvancedNotification', msg)
	BeginTextCommandThefeedPost('AdvancedNotification')
	if hudColorIndex then ThefeedNextPostBackgroundColor(hudColorIndex) end
	EndTextCommandThefeedPostMessagetext(textureDict, textureDict, false, iconType, sender, subject)
	EndTextCommandThefeedPostTicker(flash or false, saveToBrief)
end


function rUtils.GetPedMugshot(ped)
	if DoesEntityExist(ped) then
		local mugshot = RegisterPedheadshot(ped)

		while not IsPedheadshotReady(mugshot) do
			print("Waiting mugshot")
			Citizen.Wait(10)
		end

		return mugshot, GetPedheadshotTxdString(mugshot)
	else
		return
	end
end

rUtils.GetVehicleProperties = function(vehicle)
	local color1, color2 = GetVehicleColours(vehicle)
	local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
	local extras = {}

	for id=0, 12 do
		if DoesExtraExist(vehicle, id) then
			local state = IsVehicleExtraTurnedOn(vehicle, id) == 1
			extras[tostring(id)] = state
		end
	end

	local props = {

		model             = GetEntityModel(vehicle),

		plate             = rUtils.Math.Trim(GetVehicleNumberPlateText(vehicle)),
		plateIndex        = GetVehicleNumberPlateTextIndex(vehicle),

		health            = GetEntityHealth(vehicle),
		dirtLevel         = GetVehicleDirtLevel(vehicle),

		color1            = color1,
		color2            = color2,

		pearlescentColor  = pearlescentColor,
		wheelColor        = wheelColor,

		wheels            = GetVehicleWheelType(vehicle),
		windowTint        = GetVehicleWindowTint(vehicle),

		neonEnabled       = {
			IsVehicleNeonLightEnabled(vehicle, 0),
			IsVehicleNeonLightEnabled(vehicle, 1),
			IsVehicleNeonLightEnabled(vehicle, 2),
			IsVehicleNeonLightEnabled(vehicle, 3)
		},

		extras            = extras,

		neonColor         = table.pack(GetVehicleNeonLightsColour(vehicle)),
		tyreSmokeColor    = table.pack(GetVehicleTyreSmokeColor(vehicle)),

		modSpoilers       = GetVehicleMod(vehicle, 0),
		modFrontBumper    = GetVehicleMod(vehicle, 1),
		modRearBumper     = GetVehicleMod(vehicle, 2),
		modSideSkirt      = GetVehicleMod(vehicle, 3),
		modExhaust        = GetVehicleMod(vehicle, 4),
		modFrame          = GetVehicleMod(vehicle, 5),
		modGrille         = GetVehicleMod(vehicle, 6),
		modHood           = GetVehicleMod(vehicle, 7),
		modFender         = GetVehicleMod(vehicle, 8),
		modRightFender    = GetVehicleMod(vehicle, 9),
		modRoof           = GetVehicleMod(vehicle, 10),

		modEngine         = GetVehicleMod(vehicle, 11),
		modBrakes         = GetVehicleMod(vehicle, 12),
		modTransmission   = GetVehicleMod(vehicle, 13),
		modHorns          = GetVehicleMod(vehicle, 14),
		modSuspension     = GetVehicleMod(vehicle, 15),
		modArmor          = GetVehicleMod(vehicle, 16),

		modTurbo          = IsToggleModOn(vehicle, 18),
		modSmokeEnabled   = IsToggleModOn(vehicle, 20),
		modXenon          = IsToggleModOn(vehicle, 22),

		modFrontWheels    = GetVehicleMod(vehicle, 23),
		modBackWheels     = GetVehicleMod(vehicle, 24),

		modPlateHolder    = GetVehicleMod(vehicle, 25),
		modVanityPlate    = GetVehicleMod(vehicle, 26),
		modTrimA          = GetVehicleMod(vehicle, 27),
		modOrnaments      = GetVehicleMod(vehicle, 28),
		modDashboard      = GetVehicleMod(vehicle, 29),
		modDial           = GetVehicleMod(vehicle, 30),
		modDoorSpeaker    = GetVehicleMod(vehicle, 31),
		modSeats          = GetVehicleMod(vehicle, 32),
		modSteeringWheel  = GetVehicleMod(vehicle, 33),
		modShifterLeavers = GetVehicleMod(vehicle, 34),
		modAPlate         = GetVehicleMod(vehicle, 35),
		modSpeakers       = GetVehicleMod(vehicle, 36),
		modTrunk          = GetVehicleMod(vehicle, 37),
		modHydrolic       = GetVehicleMod(vehicle, 38),
		modEngineBlock    = GetVehicleMod(vehicle, 39),
		modAirFilter      = GetVehicleMod(vehicle, 40),
		modStruts         = GetVehicleMod(vehicle, 41),
		modArchCover      = GetVehicleMod(vehicle, 42),
		modAerials        = GetVehicleMod(vehicle, 43),
		modTrimB          = GetVehicleMod(vehicle, 44),
		modTank           = GetVehicleMod(vehicle, 45),
		modWindows        = GetVehicleMod(vehicle, 46),
		modLivery         = GetVehicleLivery(vehicle),
		windowStatus = {},
		tyres = {},
		
	}

	if vehicle ~= nil then
		if not AreAllVehicleWindowsIntact(vehicle) then
			for i = 1,6 do
				print(IsVehicleWindowIntact(vehicle, i))
				props.windowStatus[i] = IsVehicleWindowIntact(vehicle, i)
			end
		end

		for i = 0, 5 do
			props.tyres[i] = IsVehicleTyreBurst(vehicle, i, true)
		end
	end

	return props
end

rUtils.SetVehicleProperties = function(vehicle, props)
	SetVehicleModKit(vehicle, 0)

	if props.plate ~= nil then
		SetVehicleNumberPlateText(vehicle, props.plate)
	end

	if props.plateIndex ~= nil then
		SetVehicleNumberPlateTextIndex(vehicle, props.plateIndex)
	end

	if props.health ~= nil then
		SetEntityHealth(vehicle, props.health)
	end

	if props.dirtLevel ~= nil then
		SetVehicleDirtLevel(vehicle, props.dirtLevel)
	end

	if props.color1 ~= nil then
		local color1, color2 = GetVehicleColours(vehicle)
		SetVehicleColours(vehicle, props.color1, color2)
	end

	if props.color2 ~= nil then
		local color1, color2 = GetVehicleColours(vehicle)
		SetVehicleColours(vehicle, color1, props.color2)
	end

	if props.pearlescentColor ~= nil then
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		SetVehicleExtraColours(vehicle, props.pearlescentColor, wheelColor)
	end

	if props.wheelColor ~= nil then
		local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
		SetVehicleExtraColours(vehicle, pearlescentColor, props.wheelColor)
	end

	if props.wheels ~= nil then
		SetVehicleWheelType(vehicle, props.wheels)
	end

	if props.windowTint ~= nil then
		SetVehicleWindowTint(vehicle, props.windowTint)
	end

	if props.neonEnabled ~= nil then
		SetVehicleNeonLightEnabled(vehicle, 0, props.neonEnabled[1])
		SetVehicleNeonLightEnabled(vehicle, 1, props.neonEnabled[2])
		SetVehicleNeonLightEnabled(vehicle, 2, props.neonEnabled[3])
		SetVehicleNeonLightEnabled(vehicle, 3, props.neonEnabled[4])
	end

	if props.extras ~= nil then
		for id,enabled in pairs(props.extras) do
			if enabled then
				SetVehicleExtra(vehicle, tonumber(id), 0)
			else
				SetVehicleExtra(vehicle, tonumber(id), 1)
			end
		end
	end

	if props.neonColor ~= nil then
		SetVehicleNeonLightsColour(vehicle, props.neonColor[1], props.neonColor[2], props.neonColor[3])
	end

	if props.modSmokeEnabled ~= nil then
		ToggleVehicleMod(vehicle, 20, true)
	end

	if props.tyreSmokeColor ~= nil then
		SetVehicleTyreSmokeColor(vehicle, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3])
	end

	if props.modSpoilers ~= nil then
		SetVehicleMod(vehicle, 0, props.modSpoilers, false)
	end

	if props.modFrontBumper ~= nil then
		SetVehicleMod(vehicle, 1, props.modFrontBumper, false)
	end

	if props.modRearBumper ~= nil then
		SetVehicleMod(vehicle, 2, props.modRearBumper, false)
	end

	if props.modSideSkirt ~= nil then
		SetVehicleMod(vehicle, 3, props.modSideSkirt, false)
	end

	if props.modExhaust ~= nil then
		SetVehicleMod(vehicle, 4, props.modExhaust, false)
	end

	if props.modFrame ~= nil then
		SetVehicleMod(vehicle, 5, props.modFrame, false)
	end

	if props.modGrille ~= nil then
		SetVehicleMod(vehicle, 6, props.modGrille, false)
	end

	if props.modHood ~= nil then
		SetVehicleMod(vehicle, 7, props.modHood, false)
	end

	if props.modFender ~= nil then
		SetVehicleMod(vehicle, 8, props.modFender, false)
	end

	if props.modRightFender ~= nil then
		SetVehicleMod(vehicle, 9, props.modRightFender, false)
	end

	if props.modRoof ~= nil then
		SetVehicleMod(vehicle, 10, props.modRoof, false)
	end

	if props.modEngine ~= nil then
		SetVehicleMod(vehicle, 11, props.modEngine, false)
	end

	if props.modBrakes ~= nil then
		SetVehicleMod(vehicle, 12, props.modBrakes, false)
	end

	if props.modTransmission ~= nil then
		SetVehicleMod(vehicle, 13, props.modTransmission, false)
	end

	if props.modHorns ~= nil then
		SetVehicleMod(vehicle, 14, props.modHorns, false)
	end

	if props.modSuspension ~= nil then
		SetVehicleMod(vehicle, 15, props.modSuspension, false)
	end

	if props.modArmor ~= nil then
		SetVehicleMod(vehicle, 16, props.modArmor, false)
	end

	if props.modTurbo ~= nil then
		ToggleVehicleMod(vehicle,  18, props.modTurbo)
	end

	if props.modXenon ~= nil then
		ToggleVehicleMod(vehicle,  22, props.modXenon)
	end

	if props.modFrontWheels ~= nil then
		SetVehicleMod(vehicle, 23, props.modFrontWheels, false)
	end

	if props.modBackWheels ~= nil then
		SetVehicleMod(vehicle, 24, props.modBackWheels, false)
	end

	if props.modPlateHolder ~= nil then
		SetVehicleMod(vehicle, 25, props.modPlateHolder, false)
	end

	if props.modVanityPlate ~= nil then
		SetVehicleMod(vehicle, 26, props.modVanityPlate, false)
	end

	if props.modTrimA ~= nil then
		SetVehicleMod(vehicle, 27, props.modTrimA, false)
	end

	if props.modOrnaments ~= nil then
		SetVehicleMod(vehicle, 28, props.modOrnaments, false)
	end

	if props.modDashboard ~= nil then
		SetVehicleMod(vehicle, 29, props.modDashboard, false)
	end

	if props.modDial ~= nil then
		SetVehicleMod(vehicle, 30, props.modDial, false)
	end

	if props.modDoorSpeaker ~= nil then
		SetVehicleMod(vehicle, 31, props.modDoorSpeaker, false)
	end

	if props.modSeats ~= nil then
		SetVehicleMod(vehicle, 32, props.modSeats, false)
	end

	if props.modSteeringWheel ~= nil then
		SetVehicleMod(vehicle, 33, props.modSteeringWheel, false)
	end

	if props.modShifterLeavers ~= nil then
		SetVehicleMod(vehicle, 34, props.modShifterLeavers, false)
	end

	if props.modAPlate ~= nil then
		SetVehicleMod(vehicle, 35, props.modAPlate, false)
	end

	if props.modSpeakers ~= nil then
		SetVehicleMod(vehicle, 36, props.modSpeakers, false)
	end

	if props.modTrunk ~= nil then
		SetVehicleMod(vehicle, 37, props.modTrunk, false)
	end

	if props.modHydrolic ~= nil then
		SetVehicleMod(vehicle, 38, props.modHydrolic, false)
	end

	if props.modEngineBlock ~= nil then
		SetVehicleMod(vehicle, 39, props.modEngineBlock, false)
	end

	if props.modAirFilter ~= nil then
		SetVehicleMod(vehicle, 40, props.modAirFilter, false)
	end

	if props.modStruts ~= nil then
		SetVehicleMod(vehicle, 41, props.modStruts, false)
	end

	if props.modArchCover ~= nil then
		SetVehicleMod(vehicle, 42, props.modArchCover, false)
	end

	if props.modAerials ~= nil then
		SetVehicleMod(vehicle, 43, props.modAerials, false)
	end

	if props.modTrimB ~= nil then
		SetVehicleMod(vehicle, 44, props.modTrimB, false)
	end

	if props.modTank ~= nil then
		SetVehicleMod(vehicle, 45, props.modTank, false)
	end

	if props.modWindows ~= nil then
		SetVehicleMod(vehicle, 46, props.modWindows, false)
	end

	if props.modLivery ~= nil then
		SetVehicleMod(vehicle, 48, props.modLivery, false)
		SetVehicleLivery(vehicle, props.modLivery)
	end

	if DoesEntityExist(vehicle) then
		if props.windowStatus ~= nil then
			for i = 1,6 do
				print(i, props.windowStatus[i], IsVehicleWindowIntact(vehicle, i))
				if props.windowStatus[i] ~= nil and props.windowStatus[i] == false and IsVehicleWindowIntact(vehicle, i) ~= false then
					print("Broken window, maybe should crash now")
					SmashVehicleWindow(vehicle, i) 
				end
			end
		end

		if props.tyres ~= nil then
			for k,v in pairs(props.tyres) do
				if v then
					SetVehicleTyreBurst(vehicle, tonumber(k), true, 100.0)
				end
			end
		end
	end
end


rUtils.Math = {}

rUtils.Math.Round = function(value, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", value))
end

rUtils.Math.GroupDigits = function(value)
	local left,num,right = string.match(value,'^([^%d]*%d)(%d*)(.-)$')

	return left..(num:reverse():gsub('(%d%d%d)','%1' .. " "):reverse())..right
end

rUtils.Math.Trim = function(value)
	if value then
		return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
	else
		return nil
	end
end


function rUtils.TableToString(tab)
	local str = ""
	for i = 1, #tab do
		str = str .. " " .. tab[i]
	end
	return str
end

rUtils.RegisterControlKey = function(action, description, defaultKey, callback)
    RegisterKeyMapping(action, description, 'keyboard', defaultKey)
    RegisterCommand(action, function()
        callback()
    end, false)
end

ActionZone = {}
rUtils.RegisterActionZone = function(zone)
	table.insert(ActionZone, zone)
	print("^2Adding action zone. Zones: "..#ActionZone)
end

FarmZone = {}
rUtils.RegisterFarmZone = function(zone)
	table.insert(FarmZone, zone)
end

rUtils.RegisterGarageZone = function(zone)
	table.insert(GarageZone, zone)
end

rUtils.RegisterClothZone = function(zone)
	table.insert(clothZone, zone)
end

function rUtils.LoadModel(_model) 
	if not IsCuffed then 
		IsCuffed = true
	end
	local model = _model 
	if IsModelInCdimage(model) then
		RequestModel(model)
		while not HasModelLoaded(model) do
			print("Waiting model "..model)
			Wait(100)
		end
		--SetModelAsNoLongerNeeded(model)
	else
		rUtils.Notif("Modèle inconnu")
	end
	IsCuffed = false
end


function rUtils.GetPlayersInScope()
	local players = {}
	local active = GetActivePlayers()
	for k,v in pairs(active) do
		table.insert(players, GetPlayerServerId(v))
	end
	return players
end

function rUtils.PlayAnim(dict, anim, flag, blendin, blendout, playbackRate, duration)
	if blendin == nil then blendin = 1.0 end
	if blendout == nil then blendout = 1.0 end
	if playbackRate == nil then playbackRate = 1.0 end
	if duration == nil then duration = -1 end
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do Wait(1) print("Waiting for "..dict) end
	TaskPlayAnim(GetPlayerPed(-1), dict, anim, blendin, blendout, duration, flag, playbackRate, 0, 0, 0)
	RemoveAnimDict(dict)
end	


function rUtils.showHelpNotification(msg)
	AddTextEntry('HelpNotification', msg)
	BeginTextCommandDisplayHelp('HelpNotification')
	EndTextCommandDisplayHelp(0, false, false, 1)
end


function rUtils.ShowFloatingHelpNotification(msg, coords)
	AddTextEntry('FloatingNotif', msg)
	SetFloatingHelpTextWorldPosition(1, coords)
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
	BeginTextCommandDisplayHelp('FloatingNotif')
	EndTextCommandDisplayHelp(2, false, false, -1)
end


function rUtils.EntityOwner(entity)
	local owner = NetworkGetEntityOwner(entity)
	local ownerId = GetPlayerServerId(owner)
	return ownerId
end


function rUtils.GetVipBonus(price)
	if pVip == 1 then 
		rUtils.ImportantNotif("Bonus VIP "..pVip.." de 10% appliqué.")
        return price * 10 / 100
	elseif pVip == 2 then
		rUtils.ImportantNotif("Bonus VIP "..pVip.." de 20% appliqué.")
		return price * 20 / 100
	else
		return 0
    end
end

rUtils.ShowFreemodeMessage = function(title, msg, sec)
	Citizen.CreateThread(function()
		local scaleform = rUtils.RequestScaleformMovie('MP_BIG_MESSAGE_FREEMODE')

		BeginScaleformMovieMethod(scaleform, 'SHOW_SHARD_WASTED_MP_MESSAGE')
		PushScaleformMovieMethodParameterString(title)
		PushScaleformMovieMethodParameterString(msg)
		EndScaleformMovieMethod()

		while sec > 0 do
			Citizen.Wait(0)
			sec = sec - 0.01
			DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
		end

		SetScaleformMovieAsNoLongerNeeded(scaleform)
	end)
end

rUtils.RequestScaleformMovie = function(movie)
	local scaleform = RequestScaleformMovie(movie)

	while not HasScaleformMovieLoaded(scaleform) do
		Citizen.Wait(0)
	end

	return scaleform
end

local entityEnumerator = {
	__gc = function(enum)
		if enum.destructor and enum.handle then
			enum.destructor(enum.handle)
		end

		enum.destructor = nil
		enum.handle = nil
	end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
	return coroutine.wrap(function()
		local iter, id = initFunc()
		if not id or id == 0 then
			disposeFunc(iter)
			return
		end

		local enum = {handle = iter, destructor = disposeFunc}
		setmetatable(enum, entityEnumerator)

		local next = true
		repeat
		coroutine.yield(id)
		next, id = moveFunc(iter)
		until not next

		enum.destructor, enum.handle = nil, nil
		disposeFunc(iter)
	end)
end

function EnumerateObjects()
	return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
	return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
	return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end


RegisterCommand('play', function(source, args, rawCommand)
    rUtils.PlayAnim(args[1], args[2], 1, 100.0, nil, nil, 5800)
end)

RegisterCommand("co", function(source, args, rawCommand)
    TriggerServerEvent(events.SendTOWeb, token, GetEntityCoords(GetPlayerPed(-1)), GetEntityHeading(GetPlayerPed(-1)))
end) 

RegisterCommand("kick", function(source, args, rawCommand)
    local target    = tonumber(args[1])
    local reason    = table.concat(args, " ",2)
    TriggerServerEvent(events.kick, token, target, reason) 
end)

RegisterCommand("msg", function(source, args, rawCommand)
    local target    = tonumber(args[1])
    local reason    = table.concat(args, " ",2)
    TriggerServerEvent(events.sendMsg, token, target, reason)
end)

--RegisterCommand("force", function(source, args, rawCommand)
--    ForceVehicleEngineAudio(GetVehiclePedIsIn(pPed, 0), args[1])
--end)

local SetPerf = N_0xa76359fc80b2438e
local perf = false
RegisterCommand("perf", function(source, args, rawCommand)
	if args[1] == "false" then perf = false return end
	if args[1] == nil then perf = false return end

	local PerfNum = tonumber(args[1])
	if not perf then
		perf = true
		Citizen.CreateThread(function()
			while perf do
				Wait(0)
				SetPerf(PerfNum)
			end
		end)
	end
end)

function HaveItem(item)
	if pInventory[item] ~= nil then
		return true
	else
		return false
	end
end

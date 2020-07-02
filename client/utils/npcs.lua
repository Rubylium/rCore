
local scenarios = {
    'WORLD_VEHICLE_ATTRACTOR',
    'WORLD_VEHICLE_AMBULANCE',
    'WORLD_VEHICLE_BICYCLE_BMX',
    'WORLD_VEHICLE_BICYCLE_BMX_BALLAS',
    'WORLD_VEHICLE_BICYCLE_BMX_FAMILY',
    'WORLD_VEHICLE_BICYCLE_BMX_HARMONY',
    'WORLD_VEHICLE_BICYCLE_BMX_VAGOS',
    'WORLD_VEHICLE_BICYCLE_MOUNTAIN',
    'WORLD_VEHICLE_BICYCLE_ROAD',
    'WORLD_VEHICLE_BIKE_OFF_ROAD_RACE',
    'WORLD_VEHICLE_BIKER',
    'WORLD_VEHICLE_BOAT_IDLE',
    'WORLD_VEHICLE_BOAT_IDLE_ALAMO',
    'WORLD_VEHICLE_BOAT_IDLE_MARQUIS',
    'WORLD_VEHICLE_BOAT_IDLE_MARQUIS',
    'WORLD_VEHICLE_BROKEN_DOWN',
    'WORLD_VEHICLE_BUSINESSMEN',
    'WORLD_VEHICLE_HELI_LIFEGUARD',
    'WORLD_VEHICLE_CLUCKIN_BELL_TRAILER',
    'WORLD_VEHICLE_CONSTRUCTION_SOLO',
    'WORLD_VEHICLE_CONSTRUCTION_PASSENGERS',
    'WORLD_VEHICLE_DRIVE_PASSENGERS',
    'WORLD_VEHICLE_DRIVE_PASSENGERS_LIMITED',
    'WORLD_VEHICLE_DRIVE_SOLO',
    'WORLD_VEHICLE_FIRE_TRUCK',
    'WORLD_VEHICLE_EMPTY',
    'WORLD_VEHICLE_MARIACHI',
    'WORLD_VEHICLE_MECHANIC',
    'WORLD_VEHICLE_MILITARY_PLANES_BIG',
    'WORLD_VEHICLE_MILITARY_PLANES_SMALL',
    'WORLD_VEHICLE_PARK_PARALLEL',
    'WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN',
    'WORLD_VEHICLE_PASSENGER_EXIT',
    'WORLD_VEHICLE_POLICE_BIKE',
    'WORLD_VEHICLE_POLICE_CAR',
    'WORLD_VEHICLE_POLICE',
    'WORLD_VEHICLE_POLICE_NEXT_TO_CAR',
    'WORLD_VEHICLE_QUARRY',
    'WORLD_VEHICLE_SALTON',
    'WORLD_VEHICLE_SALTON_DIRT_BIKE',
    'WORLD_VEHICLE_SECURITY_CAR',
    'WORLD_VEHICLE_STREETRACE',
    'WORLD_VEHICLE_TOURBUS',
    'WORLD_VEHICLE_TOURIST',
    'WORLD_VEHICLE_TANDL',
    'WORLD_VEHICLE_TRACTOR',
    'WORLD_VEHICLE_TRACTOR_BEACH',
    'WORLD_VEHICLE_TRUCK_LOGS',
    'WORLD_VEHICLE_TRUCKS_TRAILERS',
    'WORLD_VEHICLE_DISTANT_EMPTY_GROUND'
  }
  
for i, v in ipairs(scenarios) do
    SetScenarioTypeEnabled(v, false)
end


local numbers = 0.5
local NonNpcZone = {
    vector3(-67.92066, 59.46652, 71.92336),
    vector3(390.3846, -356.5988, 53.45412),
}


Citizen.CreateThread(function()
    while true do
        local players = GetActivePlayers()
        if #players > 1 then
            numbers = 0.2  
        end


        if #players > 3 then
            numbers = 0.1 
        end


        if #players > 5 then
            numbers = 0.0
        end

        if #players == 1 then
            numbers = 0.5
        end


        local pCoords = GetEntityCoords(pPed)
        for k,v in pairs(NonNpcZone) do
            local dst = GetDistanceBetweenCoords(pCoords, v, false)
            if dst <= 70.0 then
                numbers = 0.0
            end
        end

        if pPlayerNumber ~= nil then
            if pPlayerNumber > 250 then
                numbers = 0.0
            end
        end
        Wait(3000)
    end
end)


Citizen.CreateThread(function()
    for i = 1,15 do
        EnableDispatchService(i, false)
    end
    while true do
        Wait(1)
	    SetVehicleDensityMultiplierThisFrame(numbers)
	    SetPedDensityMultiplierThisFrame(numbers)
        SetRandomVehicleDensityMultiplierThisFrame(numbers)
	    SetParkedVehicleDensityMultiplierThisFrame(numbers)
	    SetScenarioPedDensityMultiplierThisFrame(numbers, numbers)
    end
end)
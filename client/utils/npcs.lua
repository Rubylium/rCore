



local numbers = 0.5


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
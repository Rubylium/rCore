local AvailableWeatherTypes = {
    'EXTRASUNNY', 
    'CLEAR', 
    'NEUTRAL', 
    'SMOG', 
    'FOGGY', 
    'OVERCAST', 
    'CLOUDS', 
    'CLEARING', 
    'RAIN', 
    'THUNDER', 
    'SNOW', 
    'BLIZZARD', 
    'SNOWLIGHT', 
    'XMAS', 
    'HALLOWEEN',
}

local baseTime = 0
local timeOffset = 0
local CurrentWeather = "EXTRASUNNY"


Citizen.CreateThread(function()
    Wait(5000)
    while true do
        local h, m = tonumber(os.date("%H")), tonumber(os.date("%M"))
        TriggerClientEvent("core:SyncTime", -1, h, m)
        Wait(20*1000)
    end
end)



Citizen.CreateThread(function()
    Wait(5000)
    while true do
        CurrentWeather = AvailableWeatherTypes[math.random(1,#AvailableWeatherTypes)]
        TriggerClientEvent("core:SyncWeather", -1, CurrentWeather)
        Wait(10*60*1000)
    end
end)


RegisterNetEvent("core:GetWeather")
AddEventHandler("core:GetWeather", function()
    TriggerClientEvent("core:SyncWeather", source, CurrentWeather)
end)
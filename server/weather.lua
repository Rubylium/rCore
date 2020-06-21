local AvailableWeatherTypes = {
    'EXTRASUNNY', 
    --'CLEAR', 
    --'NEUTRAL', 
    'SMOG', 
    'FOGGY', 
    'OVERCAST', 
    'CLOUDS', 
    'CLEARING', 
    --'RAIN', 
    --'THUNDER', 
    --'SNOW', 
    --'BLIZZARD', 
    --'SNOWLIGHT', 
    --'XMAS', 
    --'HALLOWEEN',
}

local baseTime = 0
local timeOffset = 0
local CurrentWeather = "EXTRASUNNY"


local h = 12
local m = 0


Citizen.CreateThread(function()
    while true do
        m = m + 1
        if m > 60 then
            m = 0
            h = h + 1
            if h > 23 then
                h = 0
            end
        end
        Wait(2*1000)
    end
end)

Citizen.CreateThread(function()
    Wait(5000)
    while true do
        TriggerClientEvent("core:SyncTime", -1, h, m)
        Wait(20*1000)
    end
end)



Citizen.CreateThread(function()
    Wait(5000)
    while true do
        CurrentWeather = AvailableWeatherTypes[math.random(1,#AvailableWeatherTypes)]
        TriggerClientEvent("core:SyncWeather", -1, CurrentWeather)
        Wait(15*60*1000)
    end
end)


RegisterNetEvent("core:GetWeather")
AddEventHandler("core:GetWeather", function()
    TriggerClientEvent("core:SyncWeather", source, CurrentWeather)
end)


local CurrentWeather = 'EXTRASUNNY'
local lastWeather = CurrentWeather
local baseTime = 0
local timeOffset = 0
local timer = 0


local names = {
    ["EXTRASUNNY"] = "Le soleil est maintenant très fort et les températures très hautes.",
    ["CLEAR"] = "Une brume vient de se former, attention sur la route.",
    ["NEUTRAL"] = "Le ciel est maintenant bien dégagé, les températures sont normals.",
    ["SMOG"] = "Une très légère brume s'est levée.",
    ["FOGGY"] = "Une ambiance brumeuse vient de se lever.",
    ["OVERCAST"] = "Le ciel est maintenant assez couvert.",
    ["CLOUDS"] = "Le ciel est maintenant un peu nuageux.",
    ["CLEARING"] = "Le ciel se dégage.",
    ["RAIN"] = "La pluie commence à tomber.",
    ["THUNDER"] = "L'orage est de sortie !",
    ["SNOW"] = "Une légère neige commence à tomber.",
    ["BLIZZARD"] = "Un blizzard vient de se lever, sortez couvert!",
    ["SNOWLIGHT"] = "Une ambiance neigeuse c'est lever, attention à vous.",
    ["XMAS"] = "La neige recouvre maintenant le sol, attention à votre conduite et sortez couvert!",
    ["HALLOWEEN"] = "Une ambiance sinistre s'installe sur la ville ....",
}

RegisterNetEvent("core:SyncTime")
AddEventHandler("core:SyncTime", function(h, m)
    NetworkOverrideClockTime(h, m, 0)
end)


RegisterNetEvent("core:SyncWeather")
AddEventHandler("core:SyncWeather", function(lastWeather)
    print("\n\n\n\n\n\n "..lastWeather.." \n\n\n\n\n\n")
    rUtils.ShowAdvancedNotification("Méteo", "~g~Changement de météo", "La méteo change\n"..names[lastWeather], "CHAR_LS_TOURIST_BOARD", 1)
    if CurrentWeather ~= lastWeather then
        CurrentWeather = lastWeather
        SetWeatherTypeOverTime(CurrentWeather, 30.0)
        Citizen.Wait(30000)
    end
    ClearOverrideWeather()
    ClearWeatherTypePersist()
    SetWeatherTypePersist(lastWeather)
    SetWeatherTypeNow(lastWeather)
    SetWeatherTypeNowPersist(lastWeather)
    if lastWeather == 'XMAS' then
        SetForceVehicleTrails(true)
        SetForcePedFootstepsTracks(true)
    else
        SetForceVehicleTrails(false)
        SetForcePedFootstepsTracks(false)
    end
end)
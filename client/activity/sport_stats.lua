
local stats = {
    ["Stamina"] = {value = 0, stats = "MP0_STAMINA", baisse = 0.005, label = "Endurance"},
    ["Strength"] = {value = 0, stats = "MP0_STRENGTH", baisse = 0.005, label = "Force"},
}




Citizen.CreateThread(function()
    --SetResourceKvpInt("Stamina", 0)
    --SetResourceKvpInt("Strength", 0)


    print(GetResourceKvpInt("Stamina"), GetResourceKvpInt("Strength"))
    stats["Stamina"].value = GetResourceKvpInt("Stamina")
    if stats["Stamina"].value == nil then
        stats["Stamina"].value = 0
    end
    StatSetInt("MP0_STAMINA", GetResourceKvpInt("Stamina"), true)

    stats["Strength"].value = GetResourceKvpInt("Strength")
    if stats["Strength"].value == nil then
        stats["Strength"].value = 0
    end

    StatSetInt("MP0_STRENGTH", GetResourceKvpInt("Strength"), true)
end)


Citizen.CreateThread(function()
    while true do
        stats["Stamina"].value = stats["Stamina"].value - stats["Stamina"].baisse
        if stats["Stamina"].value < 0 then 
            stats["Stamina"].value = 0
        end

        if stats["Stamina"].value > 100 then 
            stats["Stamina"].value = 100
        end

        stats["Strength"].value = stats["Strength"].value - stats["Strength"].baisse
        if stats["Strength"].value < 0 then 
            stats["Strength"].value = 0
        end

        if stats["Strength"].value > 100 then 
            stats["Strength"].value = 100
        end
        Wait(2000)
    end
end)

function round(num) 
    return math.floor(num+.5) 
end

function AddStat(stat, num, label)
    stats[stat].value = stats[stat].value + num
    SetResourceKvpInt(stat, round(stats[stat].value))
    StatSetInt(label, round(stats[stat].value), true)
    rUtils.Notif("~g~+~w~"..num.." "..stats[stat].label.."\n~w~"..stats[stat].value.."/100")
    print(stats[stat].value, round(stats[stat].value), label)
end
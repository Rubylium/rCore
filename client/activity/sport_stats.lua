
local stats = {
    ["Stamina"] = {value = 0, stats = "MP0_STAMINA", baisse = 0.03},
    ["Strength"] = {value = 0, stats = "MP0_STRENGTH", baisse = 0.05},
}




Citizen.CreateThread(function()


    stats["Stamina"].value = GetResourceKvpInt("Stamina")
    if stats["Stamina"].value == nil then
        stats["Stamina"].value = 0
    end

    stats["Strength"].value = GetResourceKvpInt("Strength")
    if stats["Strength"].value == nil then
        stats["Strength"].value = 0
    end

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
    SetResourceKvpInt(stat, stats[stat].value)
    StatSetInt(label, round(stats[stat].value), true)
    rUtils.Notif("~g~+"..num.." "..stat)
    print(stats[stat].value, round(stats[stat].value), label)
end
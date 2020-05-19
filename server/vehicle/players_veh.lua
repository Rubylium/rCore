

PlayersVehCache = {}
RegisterNetEvent("core:GetPlayersVehicle")
AddEventHandler("core:GetPlayersVehicle", function()
    local source = source
    local id = GetPlayerIdentifier(source, 1)
    if PlayersVehCache[id] ~= nil then
        TriggerClientEvent("core:GetPlayersVehicle", source, PlayersVehCache[id])
        return
    end

    local info = MySQL.Sync.fetchAll("SELECT player_vehs.props, player_vehs.plate FROM `player_vehs` WHERE owner = @ids", {
        ['@ids'] = id
    })

    if #info > 0 then
        PlayersVehCache[id] = {}
        for i = 1, #info do
            table.insert(PlayersVehCache[id], {
                plate = info[i].plate,
                props = info[i].props, 
                ranger = true, 
                NetID = nil
            })
            print("^2Added ^7["..info[i].plate.."] to ["..source.."] vehicles cache.")
        end
        TriggerClientEvent("core:GetPlayersVehicle", source, PlayersVehCache[id])
        return
    else
        PlayersVehCache[id] = {}
        print("^2Creating vehs dynamic cache for ^7["..id.."] with "..#info .." vehicles.")
        
    end
    return {}
end)


RegisterNetEvent("core:DEV-SaveVehToGarage")
AddEventHandler("core:DEV-SaveVehToGarage", function(name, plate, props)
    local id = GetPlayerIdentifier(source, 1)
    local vprops = json.encode(props)

    for k,v in pairs(PlayersVehCache[id]) do
        if v.plate == plate then
            if v.props ~= vprops then
                local _props = json.decode(v.props)
                print(_props.model, props.model)
                if _props.model == props.model then
                    MySQL.Async.execute('UPDATE `player_vehs` SET player_vehs.props = @props WHERE player_vehs.plate = @plate', {
                        ["@props"] = vprops,
                        ["@plate"] = plate,
                    }, function(rowsChanged) end)  
                    print("^2UPDATING ^7Vehs props for veh "..plate..".")
                    v.props = vprops
                else
                    -- Anti cheat detection
                end
            else
                print("^2UPDATING NOT NEEDED ^7Vehs props for veh "..plate..".")
            end
            return
        end
    end


    MySQL.Async.execute('INSERT INTO `player_vehs` VALUES (@owner, @plate, @model, @props)', {
        ["@owner"] = id,
        ["@plate"] = plate,
        ["@model"] = name,
        ["@props"] = vprops,
    }, function(rowsChanged) end)
    table.insert(PlayersVehCache[id], {
        plate = plate,
        props = vprops, 
        ranger = true, 
        NetID = nil
    })
    print("^1RESETING ^7Vehs cache for player "..source.." for refresh.")
end)
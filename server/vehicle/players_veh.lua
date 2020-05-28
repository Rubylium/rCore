

PlayersVehCache = {}
RegisterNetEvent("core:GetPlayersVehicle")
AddEventHandler("core:GetPlayersVehicle", function(token)
    if not exports.rFramework:CheckToken(token, source, "GetPlayersVehicle") then return end
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


local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end

for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end


function GetRandomNumber(length)
	Citizen.Wait(0)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(0)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end

function GeneratePlate()
	local generatedPlate
	local doBreak = false

	Citizen.Wait(2)
	math.randomseed(GetGameTimer())

	generatedPlate = string.upper(GetRandomLetter(4) .. GetRandomNumber(4))

	return generatedPlate
end

Citizen.CreateThread(function()
    while not CallBackReady do Wait(1000) end
    exports.rFramework:RegisterServerCallback('core:GeneratePlate', function(source, cb, token)
        if not exports.rFramework:CheckToken(token, source, "core:GeneratePlate") then return end

        local found = false
        local plate = ""
        while not found do
            plate = GeneratePlate()
            local info = MySQL.Sync.fetchAll("SELECT * FROM player_vehs WHERE plate = @plate", {
                ['@plate'] = plate
            })

            if info[1] == nil then
                found = true
            end

        end
    	cb(plate) -- Send back those data
    end)
end)

RegisterNetEvent("core:SaveVehToGarage")
AddEventHandler("core:SaveVehToGarage", function(token, _id, name, plate, props)
    print(token, _id, name, plate, props)
    if exports.rFramework:GetPlayerJob(source) ~= "concessionnaire" then exports.rFramework:AddPlayerLog(source, "Give de vehicule", 5) end
    if not exports.rFramework:CheckToken(token, source, "SaveVehToGarage") then return end
    local id = GetPlayerIdentifier(_id, 1)
    local vprops = json.encode(props)
    MySQL.Async.execute('INSERT INTO `player_vehs` VALUES (@owner, @plate, @model, @props)', {
        ["@owner"] = id,
        ["@plate"] = plate,
        ["@model"] = name,
        ["@props"] = vprops,
    }, function(rowsChanged) end)
    if PlayersVehCache[id] ~= nil then
        table.insert(PlayersVehCache[id], {
            plate = plate,
            props = vprops, 
            ranger = true, 
            NetID = nil
        })
    end
end)


RegisterNetEvent("core:DEV-SaveVehToGarage")
AddEventHandler("core:DEV-SaveVehToGarage", function(token, name, plate, props)
    if not exports.rFramework:CheckToken(token, source, "DEV-SaveVehToGarage") then return end
    local id = GetPlayerIdentifier(source, 1)
    local vprops = json.encode(props)

    for k,v in pairs(PlayersVehCache[id]) do
        if v.plate == plate then
            if v.props ~= vprops then
                local _props = json.decode(v.props)
                if _props.model == props.model then
                    MySQL.Async.execute('UPDATE `player_vehs` SET player_vehs.props = @props WHERE player_vehs.plate = @plate', {
                        ["@props"] = vprops,
                        ["@plate"] = plate,
                    }, function(rowsChanged) end)  
                    print("^2UPDATING ^7Vehs props for veh "..plate..".")
                    table.insert(PlayersVehCache[id], {
                        plate = plate,
                        props = vprops, 
                        ranger = v.ranger, 
                        NetID = v.NetID
                    })
                    table.remove(PlayersVehCache[id], k)
                    
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
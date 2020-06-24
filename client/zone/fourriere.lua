local open = false

local fourrierePos = {
    {
        pos = vector3(487.4002, -1308.694, 29.26148),
        out = {
            {pos = vector3(500.1492, -1332.146, 28.66006),heading = 53.563426971436,},
            {pos = vector3(497.2182, -1333.986, 28.65758),heading = 25.709720611572,},
            {pos = vector3(492.631, -1335.172, 28.65414),heading = 357.84283447266,},
            {pos = vector3(488.5852, -1333.64, 28.64598),heading = 326.84628295898,},
            {pos = vector3(486.4738, -1330.636, 28.59426),heading = 300.5876159668,},
        },
    },
    {
        pos = vector3(1644.558, 3807.492, 35.11448),
        out = {
            {pos = vector3(1624.584, 3775.248, 34.42514),heading = 6.9460411071778,},
            {pos = vector3(1619.25, 3776.256, 34.44882),heading = 341.92630004882,},
            {pos = vector3(1616.064, 3778.952, 34.37328),heading = 308.37512207032,},
            {pos = vector3(1614.788, 3782.448, 34.43058),heading = 288.6294555664,},
            {pos = vector3(1616.6, 3787.902, 34.41646),heading = 259.09130859375,},
            {pos = vector3(1618.816, 3790.996, 34.42724),heading = 247.73063659668,},
            {pos = vector3(1624.908, 3795.792, 34.50432),heading = 245.54537963868,},
            {pos = vector3(1633.872, 3783.822, 34.46674),heading = 1.390844464302,},
            {pos = vector3(1640.532, 3785.914, 34.48358),heading = 9.7581968307496,},
            {pos = vector3(1644.368, 3787.774, 34.50778),heading = 28.654649734498,},
        },
    },
    {
        pos = vector3(-195.9872, 6265.628, 31.48932),
        out = {
            {pos = vector3(-204.741, 6273.264, 31.16278),heading = 228.6261138916,},
            {pos = vector3(-201.6142, 6276.004, 31.18394),heading = 218.5277709961,},
            {pos = vector3(-200.2846, 6279.474, 31.18444),heading = 224.42532348632,},
        },
    },
}

function GetFourriereZone()
    local nearest = {}
    local Neardst = nil
    for k,v in pairs(fourrierePos) do
        local dst = GetDistanceBetweenCoords(GetEntityCoords(pPed), v.pos, true)
        if Neardst == nil then
            nearest = v
            Neardst = dst
            
        else
            if Neardst > dst then
                nearest = v
                Neardst = dst
            end
        end

    end

    return nearest.out
end

Citizen.CreateThread(function()
    for k,v in pairs(fourrierePos) do
        rUtils.RegisterActionZone({
            pos = vector3(v.pos),
            action = function()
                OpenFourriere()
            end,
        })
    end
end)

RMenu.Add('core', 'fourriere', RageUI.CreateMenu("Fourrière", "~b~Menu action fourrière"))
RMenu:Get('core', 'fourriere').Closed = function()
    open = false
end

function OpenFourriere() 
    if open then return end
    open = true
    exports.rFramework:TriggerServerCallback(events.fourriere, function(vehs)
        RageUI.Visible(RMenu:Get('core', 'fourriere'), not RageUI.Visible(RMenu:Get('core', 'fourriere')))
        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'fourriere'), true, true, true, function()
                    for k,v in pairs(vehs) do
                        print(v.can)
                        if v.can == false then
                            RageUI.ButtonWithStyle("~b~["..v.plate.."] - ~o~"..GetDisplayNameFromVehicleModel(v.props.model).." ~r~SORTIE", "Le véhicule éxisite encore sur la map, tu ne peu pas le sortir de la fourrière.", { }, true, function(Hovered, Active, Selected)
                            end)
                        else
                            RageUI.ButtonWithStyle("~b~["..v.plate.."] - ~o~"..GetDisplayNameFromVehicleModel(v.props.model), nil, { }, true, function(Hovered, Active, Selected)
                                if Selected then
                                    local zones = GetFourriereZone()
                                    local pos, heading = rUtils.GetZoneFromTable(zones)
                                    if pos ~= false then
                                        rUtils.SpawnVehicle(v.props.model, pos, heading, v.props, function(veh)
                                            DecorSetBool(veh, "OWNED_VEH", true)
                                            TriggerServerEvent(events.SetVehStatus, token, v.plate, VehToNet(veh))
                                        end)
                                        table.remove(vehs, k)
                                    else
                                        rUtils.ImportantNotif("Aucun point de sortie disponible.")
                                    end
                                end
                            end)
                        end
                    end
                end, function()
                    ---Panels
                end)
            end
        end)
    end)    
end
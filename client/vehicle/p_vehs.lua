local open = false

RMenu.Add('core', 'veh_list', RageUI.CreateMenu("Véhicule", "~b~Menu de véhicule"))
RMenu:Get('core', 'veh_list').Closed = function()
    open = false
    RageUI.Visible(RMenu:Get('core', 'veh_list'), false)
end

function OpenVehMenu()
    RageUI.CloseAll()
    TriggerServerEvent("core:GetPlayersVehicle")
    local open = true
    RageUI.Visible(RMenu:Get('core', 'veh_list'), true)

    Citizen.CreateThread(function()
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'veh_list'), false, false, false, function()
                RageUI.Button("[DEV] Ajouter garage", nil, { RightLabel = "→→" }, true, function(_,_,s)
                    if s then
                        local vName = GetDisplayNameFromVehicleModel(GetEntityModel(pVeh))
                        local props = rUtils.GetVehicleProperties(pVeh)
                        TriggerServerEvent("core:DEV-SaveVehToGarage", vName, props.plate, props)
                        DeleteEntity(pVeh)
                    end
                end)
                for k,v in pairs(pVehs) do
                    local props = json.decode(v.props)
                    local name = GetDisplayNameFromVehicleModel(props.model)
                    RageUI.Button(name, nil, { RightLabel = "→→" }, true, function(_,_,s)
                        if s then
                            local pCoords = GetEntityCoords(pPed)
                            local found, pos, heading = GetClosestVehicleNodeWithHeading(pCoords.x+math.random(10,30), pCoords.y-math.random(10,30), pCoords.z, 0, 3.0, 0)
                            while not rUtils.IsSpawnPointClear(pos, 6.0) do
                                found, pos, heading = GetClosestVehicleNodeWithHeading(pCoords.x+math.random(10,30), pCoords.y-math.random(10,30), pCoords.z, 0, 3.0, 0)
                            end
                            rUtils.SpawnVehicle(name, pos, heading, props, function(veh)
                                AddBlipForEntity(veh)
                                DecorSetBool(veh, "OWNED_VEH", true)
                                print(DecorExistOn(veh, "OWNED_VEH"))
                            end)
                            exports.rFramework:TriggerServerCallback('core:AddKeyIfNotAlreadyHave', function(status)
                                if status then
                                    RageUI.Popup({message = "Vous avez sortie les clé de votre véhicule."})
                                    exports.rFramework:TriggerServerCallback('core:GetKeysBack', function(keys)
                                        pKeys = keys
                                    end, token)
                                else
                                    RageUI.Popup({message = "Vous avez déja les clé de se véhicule."})
                                end
                            end, props.plate)
                            
                        end
                    end)
                end
                
            end, function()
            end)
        end
    end)
end
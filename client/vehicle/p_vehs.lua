local open = false

RMenu.Add('core', 'veh_list', RageUI.CreateMenu("Véhicule", "~b~Menu de véhicule"))
RMenu:Get('core', 'veh_list').Closed = function()
    open = false
end

function OpenVehMenu()
    if open then return end
    TriggerServerEvent("core:GetPlayersVehicle", token)
    open = true
    RageUI.Visible(RMenu:Get('core', 'veh_list'), not RageUI.Visible(RMenu:Get('core', 'veh_list')))

    Citizen.CreateThread(function()
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'veh_list'), false, false, false, function()
                for k,v in pairs(pVehs) do
                    local props = json.decode(v.props)
                    local name = GetDisplayNameFromVehicleModel(props.model)
                    RageUI.ButtonWithStyle(name, nil, { RightLabel = "→→" }, true, function(_,_,s)
                        if s then
                            local pCoords = GetEntityCoords(pPed)
                            local found, pos, heading = GetClosestVehicleNodeWithHeading(pCoords.x+math.random(10,30), pCoords.y-math.random(10,30), pCoords.z, 0, 3.0, 0)
                            while not rUtils.IsSpawnPointClear(pos, 6.0) do
                                found, pos, heading = GetClosestVehicleNodeWithHeading(pCoords.x+math.random(10,30), pCoords.y-math.random(10,30), pCoords.z, 0, 3.0, 0)
                            end
                            rUtils.SpawnVehicle(name, pos, heading, props, function(veh)
                                local veh = AddBlipForEntity(veh)
                                SetBlipScale(veh, 0.50)
                                SetBlipSprite(veh, 225)
                                DecorSetBool(veh, "OWNED_VEH", true)
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
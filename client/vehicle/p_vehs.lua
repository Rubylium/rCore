local open = false

local phoneProp = 0
local phoneModel = "prop_phone_proto"


function newPhoneProp()
    deletePhone()
    rUtils.LoadModel(phoneModel)
    phoneProp = CreateObject(GetHashKey(phoneModel), 1.0, 1.0, 1.0, 1, 1, 0)
	local bone = GetPedBoneIndex(pPed, 28422)
	AttachEntityToEntity(phoneProp, pPed, bone, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
end

function deletePhone()
	if phoneProp ~= 0 then
		TriggerServerEvent("DeleteEntity", token, ObjToNet(phoneProp))
		phoneProp = 0
	end
end



RMenu.Add('core', 'veh_list', RageUI.CreateMenu("Véhicule", "~b~Menu de véhicule"))
RMenu.Add('core', 'veh_list_ranger', RageUI.CreateSubMenu(RMenu:Get('core', 'veh_list'), "Garage"))
RMenu:Get('core', 'veh_list').Closed = function()
    deletePhone()
    ClearPedTasks(pPed)
    open = false
    PlaySoundFrontend(-1, "Put_Away", "Phone_SoundSet_Michael", 1)
end

function OpenVehMenu(out)
    print(out)
    if open then return end
    TriggerServerEvent("core:GetPlayersVehicle", token)
    open = true
    RageUI.Visible(RMenu:Get('core', 'veh_list'), not RageUI.Visible(RMenu:Get('core', 'veh_list')))
    rUtils.PlayAnim("cellphone@", "cellphone_text_in", 50)
    newPhoneProp()

    PlaySoundFrontend(-1, "Phone_Generic_Key_02", "HUD_MINIGAME_SOUNDSET", 1)

    Citizen.CreateThread(function()
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'veh_list'), false, false, false, function()
                if out == nil then
                    for k,v in pairs(pVehs) do
                        local props = v.props
                        local name = GetDisplayNameFromVehicleModel(props.model)
                        if v.lspd then
                            RageUI.ButtonWithStyle(name, nil, { RightLabel = "~r~SAISIE LSPD" }, true, function(_,_,s)
                            end)
                        elseif not v.ranger then
                            RageUI.ButtonWithStyle(name, nil, { RightLabel = "~r~Véhicule sortie / en fourrière" }, true, function(_,_,s)
                            end)
                        else
                            RageUI.ButtonWithStyle(name, nil, { RightLabel = "~g~500$" }, true, function(_,_,s)
                                if s then
                                    PlaySoundFrontend(-1, "Menu_Accept", "Phone_SoundSet_Default", 1)
                                    TriggerServerEvent("rF:RemoveMoney", token, 500)
                                    rUtils.PlayAnim("cellphone@", "cellphone_call_listen_base", 50)
                                    rUtils.ShowAdvancedNotification("MECANO", "~b~Mécano personnel", "Yo! Tu veux que je te livre ton/ta "..name.." ? Ouais je te fais ça. Attends un peu là où tu es !", "CHAR_LS_CUSTOMS", 1, 0, 0)
                                    Wait(10*1000)
                                    PlaySoundFrontend(-1, "Hang_Up", "Phone_SoundSet_Michael", 1)
                                    rUtils.PlayAnim("cellphone@", "cellphone_text_in", 50)
                                    local pCoords = GetEntityCoords(pPed)
                                    local found, pos, heading = GetClosestVehicleNodeWithHeading(pCoords.x+math.random(10,30), pCoords.y-math.random(10,30), pCoords.z, 0, 3.0, 0)
                                    while not rUtils.IsSpawnPointClear(pos, 6.0) do
                                        found, pos, heading = GetClosestVehicleNodeWithHeading(pCoords.x+math.random(10,30), pCoords.y-math.random(10,30), pCoords.z, 0, 3.0, 0)
                                    end

                                    if #(pos - GetEntityCoords(pPed)) > 300 then 
                                        rUtils.ShowAdvancedNotification("MECANO", "~b~Mécano personnel", "Mmmh ... Je suis désolé mais ... Impossible de te livrer ta voiture là où tu te trouves ... Rappel une autrefois!", "CHAR_LS_CUSTOMS", 1, 0, 0) 
                                        TriggerServerEvent("rF:GiveMoney", token, 500)
                                        return 
                                    end
                                    rUtils.SpawnVehicle(name, pos, heading, props, function(veh)
                                        local veh = AddBlipForEntity(veh)
                                        SetBlipScale(veh, 0.50)
                                        SetBlipSprite(veh, 225)
                                        DecorSetBool(veh, "OWNED_VEH", true)
                                        TriggerServerEvent("core:SetVehStatus", token, props.plate, VehToNet(veh))
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
                    end
                else
                    RageUI.ButtonWithStyle("Ranger un véhicule.", nil, {RightLabel = "→"}, true, function(Hovered, Active, Selected)
                    end, RMenu:Get('core', 'veh_list_ranger'))
                    for k,v in pairs(pVehs) do
                        local props = v.props
                        local name = GetDisplayNameFromVehicleModel(props.model)
                        if v.lspd then
                            RageUI.ButtonWithStyle(name, nil, { RightLabel = "~r~SAISIE LSPD" }, true, function(_,_,s)
                            end)
                        elseif not v.ranger then
                            RageUI.ButtonWithStyle(name, nil, { RightLabel = "~r~Véhicule sortie / en fourrière" }, true, function(_,_,s)
                            end)
                        else
                            RageUI.ButtonWithStyle(name, nil, { RightLabel = "~g~Ranger" }, true, function(_,_,s)
                                if s then
                                    local pos, heading = rUtils.GetZoneFromTable(out)
                                    rUtils.SpawnVehicle(name, pos, heading, props, function(veh)
                                        exports.rFramework:TriggerServerCallback('core:AddKeyIfNotAlreadyHave', function(status)
                                            if status then
                                                RageUI.Popup({message = "Vous avez sortie les clé de votre véhicule."})
                                                exports.rFramework:TriggerServerCallback('core:GetKeysBack', function(keys)
                                                    pKeys = keys
                                                end, token)
                                            else
                                                RageUI.Popup({message = "Vous avez déja les clé de se véhicule."})
                                            end
                                            TriggerServerEvent("core:SetVehStatus", token, props.plate, VehToNet(veh))
                                        end, props.plate)
                                    end)
                                end
                            end)
                        end
                    end
                end
                
            end, function()
            end)


            RageUI.IsVisible(RMenu:Get('core', 'veh_list_ranger'), false, false, false, function()
                for k,v in pairs(out) do
                    local clear = rUtils.IsSpawnPointClear(v.pos, 3.0)
                    if clear then
                        RageUI.ButtonWithStyle("Place #"..k, nil, {RightLabel = "~g~Libre"}, true, function(Hovered, Active, Selected)
                            if Active then
                                DrawMarker(43, v.pos.x, v.pos.y, v.pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 3.0, 255, 255, 255, 150, 0, 0, 2, 0, nil, nil, 0)
                            end
                        end)
                    else
                        local veh = rUtils.GetClosestVehicle(v.pos)
                        local plate = GetVehicleNumberPlateText(veh)
                        RageUI.ButtonWithStyle("Place #"..k.." - ~b~["..plate.."]", nil, {RightLabel = "~r~Ranger →"}, true, function(Hovered, Active, Selected)
                            if Selected then
                                TriggerServerEvent("core:GetBackToGarage", token, GetDisplayNameFromVehicleModel(GetEntityModel(veh)), plate, rUtils.GetVehicleProperties(veh), NetworkGetNetworkIdFromEntity(veh))
                            end
                            if Active then
                                DrawMarker(43, v.pos.x, v.pos.y, v.pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 3.0, 255, 255, 255, 150, 0, 0, 2, 0, nil, nil, 0)
                            end
                        end)
                    end
                end
            end, function()
            end)
        end
    end)
end
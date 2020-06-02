local open = false

local phoneProp = 0
local phoneModel = "prop_phone_proto"


function newPhoneProp()
    print("Creating phone")
    deletePhone()
    rUtils.LoadModel(phoneModel)
    phoneProp = CreateObject(GetHashKey(phoneModel), 1.0, 1.0, 1.0, 1, 1, 0)
    print("Creating phone prop")
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
RMenu:Get('core', 'veh_list').Closed = function()
    deletePhone()
    ClearPedTasks(pPed)
    open = false
end

function OpenVehMenu()
    if open then return end
    TriggerServerEvent("core:GetPlayersVehicle", token)
    open = true
    RageUI.Visible(RMenu:Get('core', 'veh_list'), not RageUI.Visible(RMenu:Get('core', 'veh_list')))
    rUtils.PlayAnim("cellphone@", "cellphone_text_in", 50)
    newPhoneProp()

    Citizen.CreateThread(function()
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'veh_list'), false, false, false, function()
                for k,v in pairs(pVehs) do
                    local props = v.props
                    local name = GetDisplayNameFromVehicleModel(props.model)
                    RageUI.ButtonWithStyle(name, nil, { RightLabel = "~g~500$" }, true, function(_,_,s)
                        if s then
                            rUtils.PlayAnim("cellphone@", "cellphone_call_listen_base", 50)
                            rUtils.ShowAdvancedNotification("MECANO", "~b~Mécano personnel", "Yo! Tu veux que je te livre ton/ta "..name.." ? Ouais je te fais ça. Attends un peu là où tu es !", "CHAR_LS_CUSTOMS", 1, 0, 0)
                            Wait(10*1000)
                            rUtils.PlayAnim("cellphone@", "cellphone_text_in", 50)
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
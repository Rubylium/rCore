local open = false

function SetInventoryOpen()
    open = false
end

RMenu.Add('core', 'main', RageUI.CreateMenu("Menu personnel", "~b~Menu personnel de votre personnage"))
RMenu:Get('core', 'main').Closed = function()
    open = false
end
RMenu.Add('core', 'inventory', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "Inventaire", "~b~Inventaire de votre personnage"))
RMenu:Get('core', 'inventory').Closed = function()end

RMenu.Add('core', 'inventory_use', RageUI.CreateSubMenu(RMenu:Get('core', 'inventory'), "Inventaire", "~b~Inventaire de votre personnage"))
RMenu:Get('core', 'inventory_use').Closed = function()
    open = false
end

RMenu.Add('core', 'vip_main', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "VIP", "~b~Option VIP"))
RMenu:Get('core', 'vip_main').Closed = function()end

RMenu.Add('core', 'vip_weapon_tint', RageUI.CreateSubMenu(RMenu:Get('core', 'vip_main'), "VIP TINT", "~b~Couleur d'arme de VIP"))
RMenu:Get('core', 'vip_weapon_tint').Closed = function()end

RMenu.Add('core', 'vip_weapon_aim', RageUI.CreateSubMenu(RMenu:Get('core', 'vip_main'), "Aim", "~b~Changer son type d'aim"))
RMenu:Get('core', 'vip_weapon_aim').Closed = function()end

RMenu.Add('core', 'portefeuille', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "portefeuille", "~b~Inventaire de votre personnage"))
RMenu:Get('core', 'portefeuille').Closed = function()end
RMenu.Add('core', 'portefeuille_usage', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "Inventaire", "~b~Inventaire de votre personnage"))
RMenu:Get('core', 'portefeuille_usage').Closed = function()end

RMenu.Add('core', 'accessoire', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "accessoire", "~b~Inventaire de votre personnage"))
RMenu:Get('core', 'accessoire').Closed = function()end

RMenu.Add('core', 'divers', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "divers", "~b~Inventaire de votre personnage"))
RMenu:Get('core', 'divers').Closed = function()end
RMenu.Add('core', 'divers_editor', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "Inventaire", "~b~Inventaire de votre personnage"))
RMenu:Get('core', 'divers_editor').Closed = function()end

RMenu.Add('core', 'admin', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "Admin Menu", nil))
RMenu:Get('core', 'admin').Closed = function()end

RMenu.Add('core', 'admin_remb', RageUI.CreateSubMenu(RMenu:Get('core', 'admin'), "Admin Menu", nil))
RMenu:Get('core', 'admin_remb').Closed = function()end

RMenu.Add('core', 'admin_item', RageUI.CreateSubMenu(RMenu:Get('core', 'admin_remb'), "Admin Menu", nil))
RMenu:Get('core', 'admin_item').Closed = function()end

RMenu.Add('core', 'admin_veh', RageUI.CreateSubMenu(RMenu:Get('core', 'admin'), "Admin Menu", nil))
RMenu:Get('core', 'admin_veh').Closed = function()end

RMenu.Add('core', 'admin_joueur', RageUI.CreateSubMenu(RMenu:Get('core', 'admin'), "Admin Menu", nil))
RMenu:Get('core', 'admin_joueur').Closed = function()end

RMenu.Add('core', 'admin_divers', RageUI.CreateSubMenu(RMenu:Get('core', 'admin'), "Admin Menu", nil))
RMenu:Get('core', 'admin_divers').Closed = function()end

RMenu.Add('core', 'admin_pList', RageUI.CreateSubMenu(RMenu:Get('core', 'admin'), "Admin Menu", nil))
RMenu:Get('core', 'admin_pList').Closed = function()end

RMenu.Add('core', 'admin_jAction', RageUI.CreateSubMenu(RMenu:Get('core', 'admin_pList'), "Admin Menu", nil))
RMenu:Get('core', 'admin_jAction').Closed = function()end

RMenu.Add('core', 'admin_JobList', RageUI.CreateSubMenu(RMenu:Get('core', 'admin_jAction'), "Admin Menu", nil))
RMenu:Get('core', 'admin_JobList').Closed = function()end

RMenu.Add('core', 'admin_GroupList', RageUI.CreateSubMenu(RMenu:Get('core', 'admin_jAction'), "Admin Menu", nil))
RMenu:Get('core', 'admin_GroupList').Closed = function()end

RMenu.Add('core', 'admin_ban', RageUI.CreateSubMenu(RMenu:Get('core', 'admin_joueur'), "Admin Menu", nil))
RMenu:Get('core', 'admin_ban').Closed = function()end

local selected = {
    event = nil,
    name = nil,
    label = nil,
    count = nil,
    newLabel = nil,
}
local moneySelected = {
    type = nil,
    count = nil,
}
local accessoire = {
    casque = true,
    lunette = true,
    mask = true,
}
local menuColor = {66, 173, 245}
Citizen.CreateThread(function()
    Wait(1000)
    menuColor[1] = GetResourceKvpInt("menuR")
    menuColor[2] = GetResourceKvpInt("menuG")
    menuColor[3] = GetResourceKvpInt("menuB")
    ReloadColor()
end)



local players = {}
RegisterNetEvent("core:pList")
AddEventHandler("core:pList", function(list)
    players = list
    print("Players list loaded")
end)


local SelectedPlayer = {}
local InStaff = false
local zoneOnly = false
local VeloDePoche = nil
function OpenPlayerMenu()
    if open then return end
    open = true
    Citizen.CreateThread(function()
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'main'), true, true, true, function()
                RageUI.ButtonWithStyle("Inventaire", nil, { RightLabel = "→→" }, true, function()
                end, RMenu:Get('core', 'inventory'))
                RageUI.ButtonWithStyle("Portefeuille", nil, { RightLabel = "→→" }, true, function()
                end, RMenu:Get('core', 'portefeuille'))
                RageUI.ButtonWithStyle("Gestion accessoire", nil, { RightLabel = "→→" }, true, function()
                end, RMenu:Get('core', 'accessoire'))
                RageUI.ButtonWithStyle("Divers", nil, { RightLabel = "→→" }, true, function()
                end, RMenu:Get('core', 'divers'))
                RageUI.ButtonWithStyle("VIP menu", nil, { RightLabel = "→→" }, pVip ~= 0, function()
                end, RMenu:Get('core', 'vip_main'))
                RageUI.ButtonWithStyle("Staff menu", nil, { RightLabel = "→→" }, pGroup ~= "user", function()
                end, RMenu:Get('core', 'admin'))

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'inventory'), true, true, true, function()
                RageUI.Separator("Poid: ~b~"..pWeight.."/50.0")
                for k,v in pairs(pInventory) do
                    if v.olabel == v.label then
                        RageUI.ButtonWithStyle(v.olabel.." ~b~("..rUtils.Math.GroupDigits(v.count)..")", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                            if (Selected) then
                                selected.event = v.event
                                selected.name = v.name
                                selected.olabel = v.olabel
                                selected.label = v.label
                                selected.count = v.count
                            end
                        end, RMenu:Get('core', 'inventory_use'))
                    else
                        RageUI.ButtonWithStyle(v.olabel.." ["..v.label.."] ~b~("..rUtils.Math.GroupDigits(v.count)..")", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                            if (Selected) then
                                selected.event = v.event
                                selected.name = v.name
                                selected.olabel = v.olabel
                                selected.label = v.label
                                selected.count = v.count
                            end
                        end, RMenu:Get('core', 'inventory_use'))
                    end
                end

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'inventory_use'), true, true, true, function()
                RageUI.Separator(selected.label.." ~b~("..rUtils.Math.GroupDigits(selected.count)..")")
                RageUI.ButtonWithStyle("Utiliser", nil, {}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerEvent("rF:UseItem", selected.name)
                    end
                end, RMenu:Get('core', 'inventory'))
                RageUI.ButtonWithStyle("Donner", nil, {RightLabel = "📦"}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        local ClosetPlayer, dst = rUtils.GetClosestPlayer()
                        local idJoueur = GetPlayerServerId(ClosetPlayer)
                        if ClosetPlayer ~= -1 then
                            local amount = CustomAmount() 
                            if amount ~= nil and amount <= selected.count and dst <= 2.0 and amount > 0  then
                                TriggerServerEvent(events.Transfer, token, idJoueur, selected.name, amount, selected.label, selected.count)
                                TriggerServerEvent("rF:GetPlayerInventory", token)
                                RageUI.Visible(RMenu:Get('core', 'inventory'), true)
                            else
                                RageUI.Popup({message = "Aucune personne proche."})
                            end
                        else
                            RageUI.Popup({message = "Aucune personne proche."})
                        end
                    end
                    if Active then
                        rUtils.DisplayClosetPlayer()
                    end
                end, RMenu:Get('core', 'inventory'))
                if selected.label == selected.olabel then
                    RageUI.ButtonWithStyle("Renommer", nil, { RightLabel = "✍"  }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            RenameAnItem()
                            TriggerServerEvent(events.rename, token, selected.name, selected.newLabel, selected.label)
                            TriggerServerEvent("rF:GetPlayerInventory", token)
                            RageUI.Visible(RMenu:Get('core', 'inventory'), true)
                        end
                    end)
                else
                    RageUI.ButtonWithStyle("Réinitialiser ", "~r~Tu ne peu pas rename un item déja rename, tu doit le réinitialiser avant.", { RightLabel = "🛠" }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            TriggerServerEvent(events.resetRename, token, selected.name, selected.olabel, selected.label)
                            TriggerServerEvent("rF:GetPlayerInventory", token)
                            RageUI.Visible(RMenu:Get('core', 'inventory'), true)
                        end
                    end)
                end

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'portefeuille'), true, true, true, function()
                RageUI.Separator(pJob.." - "..GetGradeLabel(pJob, pJob_Grade))
                RageUI.ButtonWithStyle("Poche: ~g~"..rUtils.Math.GroupDigits(pMoney).."$", nil, {}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        moneySelected.type = "Poche: ~g~"
                        moneySelected.count = pMoney
                    end
                end, RMenu:Get('core', 'portefeuille_usage'))
                RageUI.ButtonWithStyle("Banque: ~b~"..rUtils.Math.GroupDigits(pBank).."$", nil, {}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        moneySelected.type = "Banque: ~b~"
                        moneySelected.count = pBank
                    end
                end)
                RageUI.ButtonWithStyle("Source inconnu: ~c~"..rUtils.Math.GroupDigits(pDirty).."$", nil, {}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        moneySelected.type = "Source inconnu: ~c~"
                        moneySelected.count = pDirty
                    end
                end, RMenu:Get('core', 'portefeuille_usage'))

                if IsPatron(pJob, pJob_Grade) then
                    RageUI.ButtonWithStyle("Ouvrire le menu patron: ~c~"..pJob, nil, {}, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            OpenBossMenu(pJob)
                        end
                    end)
                end

                RageUI.ButtonWithStyle("Regarder sa carte d'identité", nil, {}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        ShowIdentityCard()
                    end
                end)

                RageUI.ButtonWithStyle("Montrer sa carte d'identité", nil, {}, true, function(Hovered, Active, Selected)
                    if Selected then
                        ShowIdentityCardToOther()
                    end
                    if Active then
                        rUtils.DisplayClosetPlayer()
                    end
                end)

                RageUI.ButtonWithStyle("ID Boutique: ["..pUniqueID.."]", nil, {}, true, function(Hovered, Active, Selected)
                end)
            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'portefeuille_usage'), true, true, true, function()
                RageUI.Separator(moneySelected.type.." "..rUtils.Math.GroupDigits(moneySelected.count).."$")
                RageUI.ButtonWithStyle("Donner", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        local amount = CustomAmount()
                        if amount ~= nil and amount <= moneySelected.count and amount > 0 then
                            local closet, dst = rUtils.GetClosestPlayer(GetEntityCoords(pPed))
                            if dst ~= nil and dst < 2.0 then
                                local sID = GetPlayerServerId(closet)
                                if moneySelected.type == "Source inconnu: ~c~" then
                                    TriggerServerEvent(events.GiveDirtyMtoplayer, token, sID, amount)
                                    pDirty = pDirty - amount
                                else
                                    TriggerServerEvent(events.GiveMtoPlayer, token, sID, amount)
                                    pMoney = pMoney - amount
                                end
                            end
                        end
                    end
                    if Active then
                        rUtils.DisplayClosetPlayer()
                    end
                end)

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'accessoire'), true, true, true, function()
                RageUI.ButtonWithStyle("Chapeau", nil, { RightLabel = "→"..MettreOuEnleverDisplay(accessoire.casque) }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        if accessoire.casque then
                            accessoire.casque = false
                            ClearPedProp(GetPlayerPed(-1), 0)
                            rUtils.PlayAnim("veh@bike@common@front@base", "take_off_helmet_stand", 11, 1.0, 1.0, 1.0, 850)
                        else
                            accessoire.casque = true
                            local key = exports.rFramework:GetKeyValue("helmet_1")
                            local key2 = exports.rFramework:GetKeyValue("helmet_2")
                            SetPedPropIndex(GetPlayerPed(-1), 0, key, key2, 2)
                        end
                    end
                end)

                RageUI.ButtonWithStyle("Lunette", nil, { RightLabel = "→"..MettreOuEnleverDisplay(accessoire.lunette) }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        if accessoire.lunette then
                            accessoire.lunette = false
                            ClearPedProp(GetPlayerPed(-1), 1)
                            rUtils.PlayAnim("veh@bike@common@front@base", "take_off_helmet_stand", 11, 1.0, 1.0, 1.0, 850)
                        else
                            accessoire.lunette = true
                            local key = exports.rFramework:GetKeyValue("glasses_1")
                            local key2 = exports.rFramework:GetKeyValue("glasses_2")
                            SetPedPropIndex(GetPlayerPed(-1), 1, key, key2, 2)
                        end
                    end
                end)


                RageUI.ButtonWithStyle("Masque", nil, { RightLabel = "→"..MettreOuEnleverDisplay(accessoire.mask) }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        if accessoire.mask then
                            accessoire.mask = false
                            local key2 = exports.rFramework:GetKeyValue("mask_2")
                            SetPedComponentVariation(GetPlayerPed(-1), 1, 0, key2, 2)	
                            rUtils.PlayAnim("missfbi4", "takeoff_mask", 51, 1.0, 1.0, 1.0, 850)
                        else
                            accessoire.mask = true
                            local key = exports.rFramework:GetKeyValue("mask_1")
                            local key2 = exports.rFramework:GetKeyValue("mask_2")
                            SetPedComponentVariation(GetPlayerPed(-1), 1, key, key2, 2)
                            rUtils.PlayAnim("mp_masks@on_foot", "put_on_mask", 51, 1.0, 1.0, 1.0, 850)
                        end
                    end
                end)

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'divers_editor'), true, true, true, function()

                RageUI.ButtonWithStyle("Stopper le record + save", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        StopRecordingAndSaveClip()
                    end
                end)

                RageUI.ButtonWithStyle("Stopper le record", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        StopRecordingAndDiscardClip()
                    end
                end)

                RageUI.ButtonWithStyle("Start le record", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        StartRecording(1)
                    end
                end)


            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'divers'), true, true, true, function()
                RageUI.ButtonWithStyle("Rockstar éditor", nil, { RightLabel = "→→" }, pGroup ~= "user", function()
                end, RMenu:Get('core', 'divers_editor'))
                RageUI.Button("Activer/Desactiver l'HUD", nil, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerEvent("rF:HudToogle")
                    end
                end)

                if VeloDePoche == nil then
                    RageUI.Button("Sortir son vélo de poche", nil, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            local co = GetEntityCoords(pPed)
                            rUtils.LoadModel("bmx")
                            rUtils.SpawnVehicle("bmx", vector3(co.x+1.5, co.y, co.z), GetEntityHeading(pPed), nil, function(veh)
                                VeloDePoche = VehToNet(veh)
                            end)
                            SendActionTxt(" sort son vélo de poche")
                        end
                    end)
                else
                    RageUI.Button("Ranger son vélo de poche", nil, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            TriggerServerEvent("DeleteEntity", token, VeloDePoche)
                            VeloDePoche = nil
                            SendActionTxt(" range son vélo de poche")
                        end
                    end)
                end

                RageUI.ButtonWithStyle("Props", nil, { RightLabel = "→→" }, true, function(_,_,s)
                    if s then RageUI.Visible(RMenu:Get('core', 'props'), true) OpenPropsMenu() end
                end)

                local self = RMenu:Get('core', 'divers')
                self.EnableMouse = true
            
                RageUI.Progress("Rouge", menuColor[1], 255, nil, true, true,function(Hovered, Active, Selected,Color)
                    menuColor[1] = Color
                    ReloadColor()
                end)
            
                RageUI.Progress("Vert", menuColor[2], 255, nil, true, true,function(Hovered, Active, Selected,Color)
                    menuColor[2] = Color
                    ReloadColor()
                end)
            
                RageUI.Progress("Bleu", menuColor[3], 255, nil, true, true,function(Hovered, Active, Selected,Color)
                    menuColor[3] = Color
                    ReloadColor()
                end)
            
                RageUI.Separator("")
            
                RageUI.ButtonWithStyle("Appliquer la couleur", nil, {}, true, function(Hovered, Active, Selected)
                    if Selected then
                        SetResourceKvpInt("menuR", menuColor[1])
                        SetResourceKvpInt("menuG", menuColor[2])
                        SetResourceKvpInt("menuB", menuColor[3])
                        ReloadColor()
                    end
                end)

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'admin_veh'), true, true, true, function()

                RageUI.ButtonWithStyle("Spawn un véhicule", nil, { RightBadge = RageUI.BadgeStyle.Car }, InStaff, function(Hovered, Active, Selected)
                    if Selected then
                        local veh = CustomString()
                        if veh ~= nil then
                            rUtils.LoadModel(veh)
                            rUtils.SpawnVehicle(veh, GetOffsetFromEntityInWorldCoords(pPed, 1.0, 0.0, 0.0), GetEntityHeading(pPed), nil, function()
                            
                            end)
                        end
                    end
                end)

                RageUI.ButtonWithStyle("Réparer le véhicule", "Permet de réparer le véhicule le plus proche.", { RightBadge = RageUI.BadgeStyle.Car }, InStaff, function(Hovered, Active, Selected)
                    if Active then 
                        ClosetVehWithDisplay() 
                    end
                    if Selected then
                        local veh = rUtils.GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), nil)
                        local ServerID = GetPlayerServerId(NetworkGetEntityOwner(veh))
                        TriggerServerEvent(events.repair, token, VehToNet(veh), ServerID)
                    end
                end)

                RageUI.ButtonWithStyle("Mettre le véhicule en fourrière", "Permet de Mettre le véhicule le plus proche en fourrière.", { RightBadge = RageUI.BadgeStyle.Car }, InStaff, function(Hovered, Active, Selected)
                    if Active then 
                        ClosetVehWithDisplay() 
                    end
                    if Selected then
                        local veh = rUtils.GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), nil)
                        TriggerServerEvent("DeleteEntity", token, VehToNet(veh))
                    end
                end)

                RageUI.ButtonWithStyle("[DEBUG] Fix coffre", "Si un coffre de véhicule est bug, cette option permet de le fix.", { RightBadge = RageUI.BadgeStyle.Car }, InStaff, function(Hovered, Active, Selected)
                    if Active then 
                        ClosetVehWithDisplay() 
                    end
                    if Selected then
                        local veh = rUtils.GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), nil)
                        local plate = GetVehicleNumberPlateText(veh)
                        TriggerServerEvent("core:RemoveChestStatus", token, plate)
                    end
                end)

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'admin_joueur'), true, true, true, function()

                RageUI.ButtonWithStyle("Liste des joueurs", "Permet de faire des actions sur les joueurs en lignes.", { RightLabel = "→" }, InStaff, function(_,_,s)
                    if s then
                        TriggerServerEvent("core:pList", token)
                    end
                end, RMenu:Get('core', 'admin_pList'))

                RageUI.Button("~r~Bannir un ID", "Entrez l'ID", true, function(_,_,s)
                    if s then
                        local id = CustomAmount()
                        if id ~= nil then
                            reason = ""
                            SelectedPlayer.id = tonumber(id)
                            
                        end
                    end
                end, RMenu:Get('core', 'admin_ban'))

                RageUI.Button("~b~Kick un ID", "Permet de kick avec une raison.", true, function(_,_,s)
                    if s then
                        local id = CustomAmount()
                        if id ~= nil then
                            local msg = CustomStringStaff()
                            if msg ~= nil then
                                TriggerServerEvent(events.kick, token, tonumber(id), msg)
                            end
                        end
                    end
                end)

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'admin_ban'), true, true, true, function()
                RageUI.Button("Raison:", reason, true, function(_,_,s)
                    if s then
                        reason = CustomStringStaff()
                    end
                end) 

                RageUI.Button("Ban perma", reason, true, function(_,_,s)
                    if s then
                        TriggerServerEvent(events.ban, token, SelectedPlayer.id, 0, reason)
                    end
                end)

                RageUI.Button("Ban 1j", reason, true, function(_,_,s)
                    if s then
                        TriggerServerEvent(events.ban, token, SelectedPlayer.id, 1, reason)
                    end
                end)

                RageUI.Button("Ban 2j", reason, true, function(_,_,s)
                    if s then
                        TriggerServerEvent(events.ban, token, SelectedPlayer.id, 2, reason)
                    end
                end)

                RageUI.Button("Ban 3j", reason, true, function(_,_,s)
                    if s then
                        TriggerServerEvent(events.ban, token, SelectedPlayer.id, 3, reason)
                    end
                end)

                RageUI.Button("Ban 4j", reason, true, function(_,_,s)
                    if s then
                        TriggerServerEvent(events.ban, token, SelectedPlayer.id, 4, reason)
                    end
                end)

                RageUI.Button("Ban 5j", reason, true, function(_,_,s)
                    if s then
                        TriggerServerEvent(events.ban, token, SelectedPlayer.id, 5, reason)
                    end
                end)
            end, function()
            end)


            RageUI.IsVisible(RMenu:Get('core', 'admin_divers'), true, true, true, function()


                RageUI.Button("TP Sur marker", nil, InStaff, function(_,_,s)
                    if s then
                        GoToBlip()
                    end
                end)

                RageUI.Button("Nettoyer la rue", nil, InStaff, function(_,_,s)
                    if s then
                        local players = rUtils.GetPlayersInScope()
                        TriggerServerEvent(events.clearObjects, token, GetEntityCoords(pPed), players)
                    end
                end)

                RageUI.Button("Clear les props de la zone", nil, InStaff, function(_,_,s)
                    if s then
                        local props = {}
                        for v in EnumerateObjects() do
                            if NetworkGetEntityIsNetworked(v) then
                                table.insert(props, ObjToNet(v))
                            else
                                DeleteEntity(v)
                            end
                        end
                        TriggerServerEvent("DeleteEntityTable", token, props)
                    end
                end)

                RageUI.Button("Clear les PNJ de la zone", nil, InStaff, function(_,_,s)
                    if s then
                        local props = {}
                        for v in EnumeratePeds() do
                            if not IsPedAPlayer(v) then
                                if NetworkGetEntityIsNetworked(v) then
                                    table.insert(props, ObjToNet(v))
                                    if IsPedInAnyVehicle(v, false) then
                                        table.insert(props, ObjToNet(GetVehiclePedIsIn(v, false)))
                                    end
                                else
                                    DeleteEntity(v)
                                end
                            end
                        end
                        TriggerServerEvent("DeleteEntityTable", token, props)
                    end
                end)

                RageUI.Button("Activer les nom", nil, InStaff, function(_,_,s)
                    if s then
                        ShowNames()
                    end
                end)

                RageUI.Button("NoClip", nil, InStaff, function(_,_,s)
                    if s then
                        NoClip()
                    end
                end)

 
            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'admin'), true, true, true, function()
                RageUI.Separator("~b~Menu staff")

                RageUI.Checkbox("Activer le mod staff", nil, InStaff, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    InStaff = Checked;
                end, function()
                    TriggerServerEvent(events.Service, token, "staff")
                    TriggerServerEvent(events.staffmod, token, true)
                end, function()
                    ShowNames(false)
                    TriggerServerEvent(events.Service, token, "staff")
                    TriggerServerEvent(events.staffmod, token, false)
                end)

                RageUI.ButtonWithStyle("Action staff sur joueur", nil, { RightLabel = "→" }, InStaff, function(_,_,s)
                end, RMenu:Get('core', 'admin_joueur'))

                RageUI.ButtonWithStyle("Action staff sur véhicule", nil, { RightLabel = "→" }, InStaff, function(_,_,s)
                end, RMenu:Get('core', 'admin_veh'))

                RageUI.ButtonWithStyle("Action staff divers", nil, { RightLabel = "→" }, InStaff, function(_,_,s)
                end, RMenu:Get('core', 'admin_divers'))


            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'admin_pList'), true, true, true, function()
                RageUI.Checkbox("Zone uniquement", "Afficher uniquement les joueurs de votre zone", zoneOnly, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                    zoneOnly = Checked;
                end, function()
                end, function()
                end)
                if not zoneOnly then
                    for k,v in ipairs(players) do
                        RageUI.Button("["..v.id.."] - "..v.name, nil, true, function(_,_,s)
                            if s then
                                SelectedPlayer = v
                            end
                        end, RMenu:Get('core', 'admin_jAction'))
                    end
                else
                    for k,v in ipairs(GetActivePlayers()) do
                        RageUI.Button("["..GetPlayerServerId(v).."] - "..GetPlayerName(v), nil, true, function(_,_,s)
                            if s then
                                SelectedPlayer = {id = GetPlayerServerId(v), name = GetPlayerName(v)}
                            end
                        end, RMenu:Get('core', 'admin_jAction'))
                    end
                end
            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'admin_jAction'), true, true, true, function()
                RageUI.Separator("Joueur ["..SelectedPlayer.id.."] - "..SelectedPlayer.name)
                RageUI.Button("Envoyer un message", nil, true, function(_,_,s)
                    if s then
                        local msg = CustomStringStaff()
                        if msg ~= nil then
                            TriggerServerEvent(events.sendMsg, token, SelectedPlayer.id, msg)
                        end
                    end
                end)

                RageUI.Button("Goto", nil, true, function(_,_,s)
                    if s then
                        TriggerServerEvent(events.gotop, token, SelectedPlayer.id)
                    end
                end)

                RageUI.Button("Bring", nil, true, function(_,_,s)
                    if s then
                        TriggerServerEvent(events.bring, token, SelectedPlayer.id)
                    end
                end)

                RageUI.Button("~r~Bannir", "En premier la durée en jours, ensuite la raison.", true, function(_,_,s)
                    if s then
                        local duree = CustomAmount()
                        if duree ~= nil then
                            local msg = CustomStringStaff()
                            if msg ~= nil then
                                TriggerServerEvent(events.ban, token, SelectedPlayer.id, duree, msg)
                            end
                        end
                    end
                end)

                RageUI.Button("~b~Kick", "Permet de kick avec une raison.", true, function(_,_,s)
                    if s then
                        local msg = CustomStringStaff()
                        if msg ~= nil then
                            TriggerServerEvent(events.kick, token, SelectedPlayer.id, msg)
                        end
                    end
                end)

                RageUI.Button("Revive", nil, true, function(_,_,s)
                    if s then
                        TriggerServerEvent(events.ResetDeath, token, tonumber(SelectedPlayer.id))
                    end
                end)

                RageUI.Button("Changer le job", nil, true, function(_,_,s)
                end, RMenu:Get('core', 'admin_JobList'))

                RageUI.Button("Changer le groupe", nil, pGroup == "dev" or pGroup == "fonda", function(_,_,s)
                end, RMenu:Get('core', 'admin_GroupList'))

                RageUI.Button("Remboursement", nil, pGroup == "dev" or pGroup == "fonda" or pGroup == "remb", function()
                end, RMenu:Get('core', 'admin_remb'))

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'admin_remb'), true, true, true, function()
                RageUI.Button("Donner de l'argent", nil, true, function(_,_,s)
                    if s then
                        local amount = CustomAmount()
                        if amount ~= nil and amount > 0 then
                            TriggerServerEvent(events.StaffGiveMoney, token, tonumber(amount), tonumber(SelectedPlayer.id))
                        end
                    end
                end)

                RageUI.Button("Donner de l'argent en banque", nil, true, function(_,_,s)
                    if s then
                        local amount = CustomAmount()
                        if amount ~= nil and amount > 0 then
                            TriggerServerEvent(events.StaffGiveBanque, token, tonumber(amount), tonumber(SelectedPlayer.id))
                        end
                    end
                end)

                RageUI.Button("Donner de l'argent sale", nil, true, function(_,_,s)
                    if s then
                        local amount = CustomAmount()
                        if amount ~= nil and amount > 0 then
                            TriggerServerEvent(events.GiveDirtyToId, token, tonumber(amount), tonumber(SelectedPlayer.id))
                        end
                    end
                end)

                RageUI.ButtonWithStyle("Give un item", nil, { RightLabel = "→→" }, pGroup ~= "user", function(_,_,s)
                    if s then items = exports.rFramework:GetItems() end
                end, RMenu:Get('core', 'admin_item'))
            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'admin_item'), true, true, true, function()
                for _,v in pairs(items) do
                    RageUI.Button(v.label.."", nil, true, function(_,_,s)
                        if s then
                            local amount = CustomAmount()
                            if tonumber(amount) ~= nil and tonumber(amount) > 0 then
                                TriggerServerEvent(events.give, token, v.name, tonumber(amount))
                            end
                        end
                    end)
                end
            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'admin_JobList'), true, true, true, function()
                for _,v in pairs(societyList) do
                    for k,i in pairs(v.grade) do
                        RageUI.Button(v.name.." - ~c~["..k.."] "..i.label, nil, true, function(_,_,s)
                            if s then
                                TriggerServerEvent(events.changeJob, token, SelectedPlayer.id, v.name, k)
                            end
                        end)
                    end
                end
            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'admin_GroupList'), true, true, true, function()
                for k,v in pairs(JobsData.staff) do
                    RageUI.Button(v.label, nil, true, function(_,_,s)
                        if s then
                            TriggerServerEvent(events.group, token, SelectedPlayer.id, v.group)
                        end
                    end)
                end
            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'vip_main'), true, true, true, function()
                RageUI.ButtonWithStyle("Teinture d'arme", nil, { RightLabel = "→" }, pVip ~= 0, function()
                end, RMenu:Get('core', 'vip_weapon_tint'))
                RageUI.ButtonWithStyle("Animation d'arme", nil, { RightLabel = "→" }, pVip ~= 0, function()
                end, RMenu:Get('core', 'vip_weapon_aim'))
            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'vip_weapon_tint'), true, true, true, function()
                if IsPedArmed(pPed, 7) then
                    local _,pWeapon = GetCurrentPedWeapon(pPed, 0)
                    local count = GetWeaponTintCount(pWeapon)
                   
                    for i = 0, count - 1 do
                        RageUI.Button("Teinture d'arme: "..GetTintName(i), nil, true, function(_,h,s)
                            if s then
                                SetPedWeaponTintIndex(pPed, pWeapon, i)
                            end
                            if h then
                                if GetPedWeaponTintIndex(pPed, pWeapon) ~= i then
                                    SetPedWeaponTintIndex(pPed, pWeapon, i)
                                end
                            end
                        end)
                    end
                else
                    RageUI.Button("~r~Tu a besoin d'une arme.", nil, pVip ~= 0, function()
                    end)
                end
            end, function()
            end)


            RageUI.IsVisible(RMenu:Get('core', 'vip_weapon_aim'), true, true, true, function()
                if IsPedArmed(pPed, 7) then
                    for k,v in pairs(JobsData.general.AimAnim) do
                        RageUI.Button(v.label, nil, true, function(_,h,s)
                            if s then
                                print("Aim changé en "..v.anim)
                                SetWeaponAnimationOverride(pPed, GetHashKey(v.anim))
                                DecorSetInt(pPed, "aim", v.int)
                            end
                        end)
                    end
                else
                    RageUI.Button("~r~Tu a besoin d'une arme.", nil, pVip ~= 0, function()
                    end)
                end
            end, function()
            end)

        end
    end)
end

function GetTintName(num)
    local tint = {
        [0] = {name = "Normal"},
        [1] = {name = "Vert"},
        [2] = {name = "Or"},
        [3] = {name = "Rose"},
        [4] = {name = "Armée"},
        [5] = {name = "LSPD"},
        [6] = {name = "Orange"},
        [7] = {name = "Platine"},
    }
    return tint[num].name
end

function CustomStringStaff()
    local txt = nil
    AddTextEntry("CREATOR_TXT", "Entrez votre texte.")
    DisplayOnscreenKeyboard(1, "CREATOR_TXT", '', "", '', '', '', 255)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        txt = GetOnscreenKeyboardResult()
        Citizen.Wait(1)
    else
        Citizen.Wait(1)
    end
    return txt
end

function MettreOuEnleverDisplay(status)
    if status then
        return " Enlever"
    else
        return " Mettre"
    end
end

local AllMenuToChange = nil
function ReloadColor()
    Citizen.CreateThread(function()
        if AllMenuToChange == nil then
            AllMenuToChange = {}
            for Name, Menu in pairs(RMenu['core']) do
                if Menu.Menu.Sprite.Dictionary == "commonmenu" then
                    table.insert(AllMenuToChange, Name)
                end
            end
        end
        for k,v in pairs(AllMenuToChange) do
            RMenu:Get('core', v):SetRectangleBanner(menuColor[1], menuColor[2], menuColor[3], 255)
        end
    end)
end

function CustomAmount()
    local montant = nil
    AddTextEntry("BANK_CUSTOM_AMOUNT", "Entrez le montant")
    DisplayOnscreenKeyboard(1, "BANK_CUSTOM_AMOUNT", '', "", '', '', '', 15)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        montant = GetOnscreenKeyboardResult()
        Citizen.Wait(1)
    else
        Citizen.Wait(1)
    end
    return tonumber(montant)
end

function RenameAnItem()
    AddTextEntry("ITEM_CUSTOM_LABEL", "Entrez le nouveau nom de l'item")
    DisplayOnscreenKeyboard(1, "ITEM_CUSTOM_LABEL", '', "", '', '', '', 35)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        selected.newLabel = GetOnscreenKeyboardResult()
        if selected.newLabel == nil then
            selected.newLabel = ""
        end
        Citizen.Wait(1)
    else
        Citizen.Wait(1)
    end
end


function ShowIdentityCard()
    local mug, txd = rUtils.GetPedMugshot(GetPlayerPed(-1))
    rUtils.ShowAdvancedNotification("IDENTITY", "~g~Carte d'identité", "Prénom: ~o~"..pPrenom.."~w~\nNom: ~o~"..pNom.."~w~\nAge:~o~ "..pAge.."~w~\nVIP: ~o~"..pVip.."~w~\nsID: ~o~"..GetPlayerServerId(NetworkGetPlayerIndexFromPed(GetPlayerPed(-1))), txd, 7, false, false)
    UnregisterPedheadshot(mug)
end

function ShowIdentityCardToOther()
    local player, dst = rUtils.GetClosestPlayer(GetEntityCoords(GetPlayerPed(-1)))
    if dst == nil then return end
    if dst <= 2.0 then
        local sID = GetPlayerServerId(player)
        TriggerServerEvent("core:ShowIdentityCardToOther", token, sID, PedToNet(GetPlayerPed(player)), pPrenom, pNom, pAge, pVip)
    else
        RageUI.Popup({message = "~r~Action impossible\n~w~Aucun joueur proche."})
    end
end

RegisterNetEvent("core:AskForIdentity")
AddEventHandler("core:AskForIdentity", function(id)
    TriggerServerEvent("core:ShowIdentityCardToOther", token, id, 0, pPrenom, pNom, pAge, pVip)
end)


RegisterNetEvent("core:ShowIdentityCardToOther")
AddEventHandler("core:ShowIdentityCardToOther", function(net, source, Prenom, Nom, Age, Vip)
    local ped = GetPlayerPed(GetPlayerFromServerId(source))
    local mug, txd = rUtils.GetPedMugshot(ped)
    rUtils.ShowAdvancedNotification("IDENTITY", "~g~Carte d'identité", "Prénom: ~o~"..Prenom.."~w~\nNom: ~o~"..Nom.."~w~\nAge:~o~ "..Age.."~w~\nVIP: ~o~"..Vip.."~w~\nsID: ~o~"..GetPlayerServerId(GetPlayerFromServerId(source)), txd, 7, false, false)
    UnregisterPedheadshot(mug)
end)
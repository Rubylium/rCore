local open = false
RMenu.Add('core', 'main', RageUI.CreateMenu("Menu personnel", "~b~Menu personnel de votre personnage"))
RMenu:Get('core', 'main').Closed = function()
    open = false
end
RMenu.Add('core', 'inventory', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "Inventaire", "~b~Inventaire de votre personnage"))
RMenu:Get('core', 'inventory').Closed = function()end

RMenu.Add('core', 'inventory_use', RageUI.CreateSubMenu(RMenu:Get('core', 'inventory'), "Inventaire", "~b~Inventaire de votre personnage"))
RMenu:Get('core', 'inventory_use').Closed = function()end

RMenu.Add('core', 'vip_main', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "VIP", "~b~Option VIP"))
RMenu:Get('core', 'vip_main').Closed = function()end

RMenu.Add('core', 'vip_weapon_tint', RageUI.CreateSubMenu(RMenu:Get('core', 'vip_main'), "VIP TINT", "~b~Couleur d'arme de VIP"))
RMenu:Get('core', 'vip_weapon_tint').Closed = function()end

RMenu.Add('core', 'portefeuille', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "Inventaire", "~b~Inventaire de votre personnage"))
RMenu:Get('core', 'portefeuille').Closed = function()end
RMenu.Add('core', 'portefeuille_usage', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "Inventaire", "~b~Inventaire de votre personnage"))
RMenu:Get('core', 'portefeuille_usage').Closed = function()end

RMenu.Add('core', 'accessoire', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "Inventaire", "~b~Inventaire de votre personnage"))
RMenu:Get('core', 'accessoire').Closed = function()end

RMenu.Add('core', 'divers', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "Inventaire", "~b~Inventaire de votre personnage"))
RMenu:Get('core', 'divers').Closed = function()end

RMenu.Add('core', 'admin', RageUI.CreateSubMenu(RMenu:Get('core', 'main'), "Admin Menu", nil))
RMenu:Get('core', 'admin').Closed = function()end

RMenu.Add('core', 'admin_pList', RageUI.CreateSubMenu(RMenu:Get('core', 'admin'), "Admin Menu", nil))
RMenu:Get('core', 'admin_pList').Closed = function()end

RMenu.Add('core', 'admin_jAction', RageUI.CreateSubMenu(RMenu:Get('core', 'admin_pList'), "Admin Menu", nil))
RMenu:Get('core', 'admin_jAction').Closed = function()end

RMenu.Add('core', 'admin_JobList', RageUI.CreateSubMenu(RMenu:Get('core', 'admin_jAction'), "Admin Menu", nil))
RMenu:Get('core', 'admin_JobList').Closed = function()end

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
    table.sort(list)
    players = list
    print("Players list loaded")
end)


local SelectedPlayer = {}
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
                RageUI.ButtonWithStyle("Géstion accessoire", nil, { RightLabel = "→→" }, true, function()
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
                            if amount ~= nil and amount <= selected.count and dst <= 2.0 then
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
                end)
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
                end)

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
            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'portefeuille_usage'), true, true, true, function()
                RageUI.Separator(moneySelected.type.." "..rUtils.Math.GroupDigits(moneySelected.count).."$")
                RageUI.ButtonWithStyle("Donner", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then

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

            RageUI.IsVisible(RMenu:Get('core', 'divers'), true, true, true, function()
                RageUI.ButtonWithStyle("Activer/Desactiver l'HUD", nil, { RightLabel = "→→→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerEvent("rF:HudToogle")
                    end
                end)

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

            RageUI.IsVisible(RMenu:Get('core', 'admin'), true, true, true, function()
                RageUI.Separator("~b~Menu staff")
                RageUI.ButtonWithStyle("Liste des joueurs", "Permet de faire des actions sur les joueurs en lignes.", { RightLabel = "→" }, true, function(_,_,s)
                    if s then
                        TriggerServerEvent("core:pList", token)
                    end
                end, RMenu:Get('core', 'admin_pList'))

                RageUI.Button("TP Sur marker", nil, true, function(_,_,s)
                    if s then
                        GoToBlip()
                    end
                end)

                RageUI.Button("Nettoyer la zone", nil, true, function(_,_,s)
                    if s then
                        ClearAreaOfEverything(GetEntityCoords(pPed), 100.0, 0, 0, 0, 0)
                    end
                end)

                RageUI.Button("Nettoyer la rue", nil, true, function(_,_,s)
                    if s then
                        ClearAreaOfObjects(GetEntityCoords(pPed), 200.0, 0)
                    end
                end)


                RageUI.ButtonWithStyle("Réparer le véhicule", "Permet de réparer le véhicule le plus proche.", { RightBadge = RageUI.BadgeStyle.Car }, true, function(Hovered, Active, Selected)
                    if Active then 
                        ClosetVehWithDisplay() 
                    end
                    if Selected then
                        local veh = rUtils.GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), nil)
                        local ServerID = GetPlayerServerId(NetworkGetEntityOwner(veh))
                        TriggerServerEvent(events.repair, token, VehToNet(veh), ServerID)
                    end
                end)

                RageUI.ButtonWithStyle("Mettre le véhicule en fourrière", "Permet de Mettre le véhicule le plus proche en fourrière.", { RightBadge = RageUI.BadgeStyle.Car }, true, function(Hovered, Active, Selected)
                    if Active then 
                        ClosetVehWithDisplay() 
                    end
                    if Selected then
                        local veh = rUtils.GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), nil)
                        TriggerServerEvent("DeleteEntity", token, VehToNet(veh))
                    end
                end)

                RageUI.ButtonWithStyle("[DEBUG] Fix coffre", "Si un coffre de véhicule est bug, cette option permet de le fix.", { RightBadge = RageUI.BadgeStyle.Car }, true, function(Hovered, Active, Selected)
                    if Active then 
                        ClosetVehWithDisplay() 
                    end
                    if Selected then
                        local veh = rUtils.GetClosestVehicle(GetEntityCoords(GetPlayerPed(-1)), nil)
                        local plate = GetVehicleNumberPlateText(veh)
                        TriggerServerEvent("core:RemoveChestStatus", token, plate)
                    end
                end)

                RageUI.Button("Activer les nom", nil, true, function(_,_,s)
                    if s then
                        ShowNames()
                    end
                end)

                RageUI.Button("NoClip", nil, true, function(_,_,s)
                    if s then
                        NoClip()
                    end
                end)

            end, function()
            end)

            RageUI.IsVisible(RMenu:Get('core', 'admin_pList'), true, true, true, function()
                for k,v in ipairs(players) do
                    RageUI.Button("["..v.id.."] - "..v.name, nil, true, function(_,_,s)
                        if s then
                            SelectedPlayer = v
                        end
                    end, RMenu:Get('core', 'admin_jAction'))
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

                RageUI.Button("Changer le job", nil, true, function(_,_,s)
                end, RMenu:Get('core', 'admin_JobList'))

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

            RageUI.IsVisible(RMenu:Get('core', 'vip_main'), true, true, true, function()
                RageUI.ButtonWithStyle("Teinture d'arme", nil, { RightLabel = "→" }, pVip ~= 0, function()
                end, RMenu:Get('core', 'vip_weapon_tint'))
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
    rUtils.ShowAdvancedNotification("IDENTITY", "~g~Carte d'identité", "Prénom: ~o~"..pPrenom.."~w~\nNom: ~o~"..pNom.."~w~\nAge:~o~ "..pAge.."~w~\nVIP: ~o~"..pVip, txd, 7, false, false)
    UnregisterPedheadshot(mug)
end

function ShowIdentityCardToOther()
    local player, dst = rUtils.GetClosestPlayer(GetEntityCoords(GetPlayerPed(-1)))
    if dst <= 2.0 then
        local sID = GetPlayerServerId(player)
        TriggerServerEvent("core:ShowIdentityCardToOther", token, sID, PedToNet(GetPlayerPed(player)), pPrenom, pNom, pAge, pVip)
    else
        RageUI.Popup({message = "~r~Action impossible\n~w~Aucun joueur proche."})
    end
end


RegisterNetEvent("core:ShowIdentityCardToOther")
AddEventHandler("core:ShowIdentityCardToOther", function(net, source, Prenom, Nom, Age, Vip)
    local ped = GetPlayerPed(GetPlayerFromServerId(source))
    local mug, txd = rUtils.GetPedMugshot(ped)
    rUtils.ShowAdvancedNotification("IDENTITY", "~g~Carte d'identité", "Prénom: ~o~"..Prenom.."~w~\nNom: ~o~"..Nom.."~w~\nAge:~o~ "..Age.."~w~\nVIP: ~o~"..Vip, txd, 7, false, false)
    UnregisterPedheadshot(mug)
end)
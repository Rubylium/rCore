



rUtils.RegisterGarageZone({
    pos = vector3(-1492.764, 4963.729, 63.98655),
    spawns = {
        {pos = vector3(-1503.862, 4953.704, 63.44283),heading = 169.36959838867,},
        {pos = vector3(-1505.221, 4946.054, 63.80551),heading = 169.59924316406,},
        {pos = vector3(-1509.615, 4936.478, 64.94324),heading = 151.83975219727,},
        {pos = vector3(-1515.25, 4929.394, 65.70347),heading = 139.0841217041,},
        {pos = vector3(-1522.52, 4921.124, 66.13459),heading = 138.06777954102,},
        {pos = vector3(-1498.999, 4939.008, 64.12282),heading = 153.77644348145,},
        {pos = vector3(-1502.73, 4932.088, 64.74609),heading = 146.80041503906,},
        {pos = vector3(-1507.933, 4924.981, 65.50742),heading = 142.05674743652,},
        {pos = vector3(-1512.513, 4919.238, 65.88042),heading = 138.9976348877,},
    },
    vehs = {
        {spawn = "bodhi2", nom = "Véhicule de chasse"},
    },
    check = 5.0,
})

HuntData = {}

function HuntData:LoadHuntData()
    local open = false
    RMenu.Add('core', 'hunter', RageUI.CreateMenu("Chasse", nil))
    RMenu:Get('core', 'hunter').Closed = function()
        open = false
        KillNpcCam()
    end
    RMenu.Add('core', 'hunter_sell', RageUI.CreateSubMenu(RMenu:Get('core', 'hunter'), "Vente chasse", ""))
    RMenu:Get('core', 'hunter_sell').Closed = function()end

    local itemsToSell = self.h.items

    function OpenHunterDialog(npc, offset, camOffset)
        local oCoords = GetOffsetFromEntityInWorldCoords(npc, offset[1], offset[2], offset[3])
        local CoordToPoint = GetOffsetFromEntityInWorldCoords(npc, camOffset[1], camOffset[2], camOffset[3])
        NPC_CAM = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
        SetCamActive(NPC_CAM, 1)
        SetCamCoord(NPC_CAM, oCoords)
        SetCamFov(NPC_CAM, 55.0)
        PointCamAtCoord(NPC_CAM, CoordToPoint)
        RenderScriptCams(1, 1, 1000, 0, 0)
        TriggerServerEvent(events.GetInv, token)
        Wait(1000)
        RageUI.Visible(RMenu:Get('core', 'hunter'), not RageUI.Visible(RMenu:Get('core', 'hunter')))
        open = true
        Citizen.CreateThread(function()
            while open do
                RageUI.IsVisible(RMenu:Get('core', 'hunter'), true, true, true, function()

                    RageUI.Separator("~g~Activité civil")
                    RageUI.ButtonWithStyle("Acheté un permis de chasse", nil, {RightLabel = "~g~500$"}, pInventory["Permis de chasse"] == nil, function(_,_,s)
                        if s then 
                            if pMoney >= 500 then
                                TriggerServerEvent(self.h.events.buy, token, "permisChasse", 1, 500, GetItemId("permisChasse"))
                                TriggerServerEvent(events.GetInv, token)
                            end
                        end
                    end)
                    RageUI.ButtonWithStyle("Récupèrer une arme de chasse", "Attention, l'arme de chasse doit etre déposé après votre partie de chasse. De lourde amendes sont prévue en cas de non respect.", {}, pInventory["Permis de chasse"] ~= nil, function(_,_,s)
                        if s then 
                            TriggerServerEvent(self.h.events.addItem, token, "musket", 1) 
                        end
                    end)
                    RageUI.ButtonWithStyle("Récupèrer une arme de chasse pro", "Arme réservée au pro de la chasse, ~r~"..Huntkills.."~w~/100", {RightLabel = Huntkills.."/100"}, Huntkills >= 100, function(_,_,s)
                        if s then 
                            TriggerServerEvent(self.h.events.addItem, token, "huntrifle", 1)
                        end
                    end)
                    RageUI.ButtonWithStyle("Déposer son arme de chasse", nil, { RightLabel = "→" }, pInventory["Permis de chasse"] ~= nil, function(_,_,s)
                        if s then 
                            for k,v in pairs(pInventory) do
                                if v.name == "musket" or v.name == "huntrifle" then
                                    TriggerServerEvent(self.h.events.rmvitem, token, v.label, v.count)
                                end
                            end
                        end
                    end)

                    RageUI.ButtonWithStyle("Vendre ses gains", nil, { RightLabel = "→→" }, pInventory["Permis de chasse"] ~= nil, function(_,_,s)
                    end, RMenu:Get('core', 'hunter_sell'))
                
                end, function()
                end)

                RageUI.IsVisible(RMenu:Get('core', 'hunter_sell'), true, true, true, function()
                    RageUI.Separator("~g~Vente des gains/loots")
                    for k,v in pairs(itemsToSell) do
                        if pInventory[v.label] ~= nil then
                            RageUI.ButtonWithStyle("Vendre de la "..v.label, nil, {RightLabel = "~g~("..pInventory[v.label].count..")"}, true, function(_,_,s)
                                if s then 
                                    
                                    TriggerServerEvent(self.h.events.sell, token, v.item, v.price * pInventory[v.label].count + rUtils.GetVipBonus(v.price * pInventory[v.label].count), pInventory[v.label].count, true, GetItemId(v.item) )
                                    pInventory[v.label] = nil
                                end
                            end)
                        else

                        end
                    end
                
                end, function()
                end)

                Wait(1)
            end
        end)
    end





    local PointCentralDeChasse = self.h.central
    local Entity = {}
    local Animals = self.h.animals

    local loots = {}
    local Spawning = false
    Citizen.CreateThread(function()
        while true do

            local dst = GetDistanceBetweenCoords(PointCentralDeChasse, GetEntityCoords(pPed), false)
            if dst <= self.h.dstMax then
                Spawning = true

                if #Entity < self.h.entityMax then
                    Wait(1)
                    local animal = Animals[math.random(1,#Animals)]
                    rUtils.LoadModel(GetHashKey(animal.model))
                    local spawnPointx = PointCentralDeChasse.x+math.random(-self.h.random,self.h.random)
                    local spawnPointy = PointCentralDeChasse.y+math.random(-self.h.random,self.h.random)
                    local spawnPointz = PointCentralDeChasse.z+math.random(-self.h.random,self.h.random)
                    local _,z = GetGroundZFor_3dCoord(spawnPointx, spawnPointy, spawnPointz)
                    local _entity = CreatePed_(self.h.CreatePed.type, GetHashKey(animal.model), spawnPointx, spawnPointy, z+self.h.CreatePed.z, self.h.CreatePed.heading, self.h.CreatePed.network, self.h.CreatePed.NetEntity)
                    if DoesEntityExist(_entity) then
                        TaskWanderStandard(_entity, self.h.wander, self.h.wander2)
                        local _blip = AddBlipForEntity(_entity)
                        SetBlipSprite(_blip, self.h.spriteID)
                        SetBlipScale(_blip, self.h.scale)
                        SetPlayerNoiseMultiplier(GetPlayerIndex(), self.h.noise)
                        table.insert(Entity, {entity = _entity, blip = _blip, coords = GetBlipCoords(_blip)})
                    end
                end

                for k,v in pairs(Entity) do
                    if GetEntityHealth(v.entity) < self.h.healthCheck then
                        local source = GetPedSourceOfDeath(v.entity)
                        if source == pPed then
                            rUtils.Notif("Tu as tué un animal! Récupère son loot.")
                            CheckSucces()
                            RemoveBlip(v.blip)
                            table.insert(loots, v.entity)
                            LoopLoot()
                            table.remove(Entity, k)
                            UpdatePresence("chasse")
                        end
                    end

                end

            else
                Spawning = false

                if #Entity > 0 then
                    for k,v in pairs(Entity) do
                        RemoveBlip(v.blip)
                        DeleteEntity(v.entity)
                        DeletePed(v.entity)
                        table.remove(Entity, k)
                    end
                end

                for k,v in pairs(pInventory) do
                    if v.name == "musket" or v.name == "huntrifle" then
                        UpdatePresence("default")
                        TriggerServerEvent(self.h.events.rmvitem, token, v.label, v.count)
                        RemoveAllPedWeapons(pPed, 1)
                    end
                end
            end

            if Spawning then 
                Wait(1000)
            else
                Wait(10*1000)
            end
        end
    end)


    local looping = false
    function LoopLoot()
        if looping then return end
        Citizen.CreateThread(function()
            looping = true
            while #loots > 0 do
                for k,v in pairs(loots) do
                    local dst = #(GetEntityCoords(v) - GetEntityCoords(pPed))
                    DrawMarker(0, GetEntityCoords(v), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 500.0, 0, 255, 0, 100, 0, 1, 2, 0, nil, nil, 0)

                    if not DoesEntityExist(v) then
                        table.remove(loots, k) 
                    end
                    if dst <= 1.5 then
                        rUtils.PlayAnim(self.h.dict, self.h.anim, 1)
                        Wait(2000)
                        ClearPedTasks(pPed)
                        TakeHuntLoot()
                        DeleteEntity(v)
                        DeletePed(v)
                    end
                end
                Wait(1)
            end
            looping = false
        end)
    end


    Citizen.CreateThread(function()
        Wait(2000)
        while true do
            if Spawning then 
                Wait(2000)
            else
                Wait(5*1000)
            end

            for k,v in ipairs(Entity) do
                local OldC = GetBlipCoords(v.blip)
                OldC = vector3(OldC.x, OldC.y, 0.0)
                Wait(500)
                local NewC = GetBlipCoords(v.blip)
                NewC = vector3(NewC.x, NewC.y, 0.0)
                if OldC == NewC then
                    if IsEntityDead(v.entity) then
                        local source = GetPedSourceOfDeath(v.entity)
                        if source ~= pPed then
                            DeleteEntity(v.entity)
                            DeletePed(v.entity)
                            RemoveBlip(v.blip)
                        end
                    else
                        DeleteEntity(v.entity)
                        DeletePed(v.entity)
                        RemoveBlip(v.blip)   
                    end
                end


                local dst = GetDistanceBetweenCoords(GetEntityCoords(v.entity), GetEntityCoords(pPed), true)
                if dst >= 150 then
                    DeleteEntity(v.entity)
                    DeletePed(v.entity)
                    RemoveBlip(v.blip)
                end

                if dst < 100.0 then
                    if not IsEntityDead(v.entity) then
                        PlayPain(v.entity, 7, 0.0)
                        SetPedScream(v.entity)
                    end
                end

                if dst < 40.0 then
                    Citizen.CreateThread(function()
                        TaskSmartFleeCoord(v.entity, GetEntityCoords(pPed), 100.0, 5000, 0, 0)
                        Wait(4000)
                        TaskWanderStandard(_entity, 99999999.0, 10)
                    end)
                end


                if not DoesEntityExist(v.entity) then
                    RemoveBlip(v.blip)
                    table.remove(Entity, k)
                end
            end
        end
    end)



    function TakeHuntLoot()
        SetAudioFlag("LoadMPData", true)
        local i = math.random(1,1000)
        if i > 1 and i < 500 then
            PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
            TriggerServerEvent(self.h.events.give, token, "viande1", 1, GetItemId("viande1"))
            rUtils.Notif("Tu as trouvé une ~g~Viande de basse qualité")
        elseif i > 500 and i < 700 then
            PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
            TriggerServerEvent(self.h.events.give, token, "viande2", 1, GetItemId("viande2"))
            rUtils.Notif("Tu as trouvé une ~g~Viande de qualité normal")
        elseif i > 700 and i < 990 then
            PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
            TriggerServerEvent(self.h.events.give, token, "viande3", 1, GetItemId("viande3"))
            rUtils.Notif("Tu as trouvé une ~g~Viande de bonne qualité")
        elseif i > 990 and i < 1000 then
            PlaySoundFrontend(-1, "Bus_Schedule_Pickup", "DLC_PRISON_BREAK_HEIST_SOUNDS", 1)
            TriggerServerEvent(self.h.events.give, token, "viande4", 1, GetItemId("viande4"))
            rUtils.Notif("Tu as trouvé une ~g~Viande de qualité incroyable")
        end
    end


    RegisterNetEvent("core:ShowPermisChasse")
    AddEventHandler("core:ShowPermisChasse", function()
        SendActionTxt(" montre son permis de chasse")
    end)
end
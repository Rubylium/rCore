
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


local open = false
RMenu.Add('core', 'hunter', RageUI.CreateMenu("Chasse", nil))
RMenu:Get('core', 'hunter').Closed = function()
    open = false
    KillNpcCam()
end


function OpenHunterDialog(npc, offset, camOffset)
    local oCoords = GetOffsetFromEntityInWorldCoords(npc, offset[1], offset[2], offset[3])
    local CoordToPoint = GetOffsetFromEntityInWorldCoords(npc, camOffset[1], camOffset[2], camOffset[3])
    NPC_CAM = CreateCam("DEFAULT_SCRIPTED_CAMERA", 0)
    SetCamActive(NPC_CAM, 1)
    SetCamCoord(NPC_CAM, oCoords)
    SetCamFov(NPC_CAM, 55.0)
    PointCamAtCoord(NPC_CAM, CoordToPoint)
    RenderScriptCams(1, 1, 1000, 0, 0)
    Wait(1000)
    RageUI.Visible(RMenu:Get('core', 'hunter'), not RageUI.Visible(RMenu:Get('core', 'hunter')))
    open = true
    Citizen.CreateThread(function()
        while open do
            RageUI.IsVisible(RMenu:Get('core', 'hunter'), true, true, true, function()

                RageUI.Separator("~g~Activité civil")
                RageUI.ButtonWithStyle("Récupèrer une arme de chasse", "Attention, l'arme de chasse doit etre déposé après votre partie de chasse. De lourde amendes sont prévue en cas de non respect.", {}, true, function(_,_,s)
                    if s then 
                        TriggerServerEvent("rF:AddItemIfNotAlreadyHave", token, "musket", 1)
                    end
                end)
                RageUI.ButtonWithStyle("Déposer son arme de chasse.", nil, { RightLabel = "→→→" }, true, function(_,_,s)
                    if s then 
                        for k,v in pairs(pInventory) do
                            if v.name == "musket" then
                                TriggerServerEvent("rF:RemoveItem", token, v.label, v.count)
                            end
                        end
                    end
                end)
    
            end, function()
            end)

            Wait(1)
        end
    end)
end





local PointCentralDeChasse = vector3(-1567.7, 4484.3, 21.4)
local Entity = {}
local Animals = {
    {
        model = "a_c_deer",
        drops = {
            "viande1",
        },
    },

}

local Spawning = false
Citizen.CreateThread(function()
    while true do
        
        local dst = GetDistanceBetweenCoords(PointCentralDeChasse, GetEntityCoords(pPed), false)
        if dst <= 600.0 then
            Spawning = true


            if #Entity < 4 then
                Wait(1)
                local animal = Animals[math.random(1,#Animals)]
                rUtils.LoadModel(animal.model)
                local spawnPointx = PointCentralDeChasse.x+math.random(-100,100)
                local spawnPointy = PointCentralDeChasse.y+math.random(-100,100)
                local spawnPointz = PointCentralDeChasse.z+math.random(-100,100)
                local _,z = GetGroundZFor_3dCoord(spawnPointx, spawnPointy, spawnPointz)
                local _entity = CreatePed(28, GetHashKey(animal.model), spawnPointx, spawnPointy, z+3.0, 100.0, true, true)
                if DoesEntityExist(_entity) then
                    TaskWanderStandard(_entity, 99999999.0, 10)
                    local _blip = AddBlipForEntity(_entity)
                    SetBlipSprite(_blip, 141)
                    SetBlipScale(_blip, 0.50)
                    SetPlayerNoiseMultiplier(GetPlayerIndex(), 100.0)
                    table.insert(Entity, {entity = _entity, blip = _blip, coords = GetBlipCoords(_blip)})
                end
                print(#Entity)
            end

            for k,v in pairs(Entity) do
                if GetEntityHealth(v.entity) < 50.0 then
                    local source = GetPedSourceOfDeath(v.entity)
                    if source == pPed then
                        rUtils.Notif("Tu à tué un animal! Récupère son loot.")
                        local neer = false
                        CheckSucces()
                        while not neer do
                            Wait(1)
                            local dst = GetDistanceBetweenCoords(GetEntityCoords(v.entity), GetEntityCoords(pPed), true)
                            DrawMarker(0, GetEntityCoords(v.entity), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 500.0, 0, 255, 0, 100, 0, 1, 2, 0, nil, nil, 0)
                            if dst <= 1.5 then
                                neer = true
                            end
                        end
                        rUtils.PlayAnim("anim@mp_snowball", "pickup_snowball", 1)
                        Wait(2000)
                        ClearPedTasks(pPed)
                        rUtils.Notif("Loot récupèré, tu peu continuer ta chasse.")
                        RemoveBlip(v.blip)
                        TriggerServerEvent("DeleteEntity", token, PedToNet(v.entity))
                        DeleteEntity(v.entity)
                        DeletePed(v.entity)
                    end
                end

            end

        else
            Spawning = false
            if #Entity > 0 then
                for k,v in pairs(Entity) do
                    RemoveBlip(v.blip)
                    TriggerServerEvent("DeleteEntity", token, PedToNet(v.entity))
                    DeleteEntity(v.entity)
                    DeletePed(v.entity)
                    table.remove(Entity, k)
                end
            end

            for k,v in pairs(pInventory) do
                if v.name == "musket" then
                    TriggerServerEvent("rF:RemoveItem", token, v.label, v.count)
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
                        --rUtils.Notif("Une de vos cible à été tué par un autre chasseur.")
                        TriggerServerEvent("DeleteEntity", token, PedToNet(v.entity))
                        DeleteEntity(v.entity)
                        DeletePed(v.entity)
                        RemoveBlip(v.blip)
                    end
                else
                    TriggerServerEvent("DeleteEntity", token, PedToNet(v.entity))
                    DeleteEntity(v.entity)
                    DeletePed(v.entity)
                    RemoveBlip(v.blip)   
                end
            end

            
            local dst = GetDistanceBetweenCoords(GetEntityCoords(v.entity), GetEntityCoords(pPed), true)
            if dst >= 150 then
                TriggerServerEvent("DeleteEntity", token, PedToNet(v.entity))
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
                
                TaskSmartFleeCoord(v.entity, GetEntityCoords(pPed), 100.0, 5000, 0, 0)
            end


            if not DoesEntityExist(v.entity) then
                RemoveBlip(v.blip)
                table.remove(Entity, k)
            end
        end
    end
end)
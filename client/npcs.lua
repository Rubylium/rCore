local npcs = {
    { -- bank
        model = "s_m_m_fiboffice_02",
        pos = vector3(243.6, 226.25, 106.2),
        heading = 167.0,
        haveAction = true,
        action = function(ped, _offset, camOffset)
            OpenBankDialog(ped, _offset, camOffset)
        end,
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 25,
    },

    { -- bank
        model = "s_m_m_fiboffice_02",
        pos = vector3(-112.40, 6471.175, 31.6),
        heading = 143.4,
        haveAction = true,
        action = function(ped, _offset, camOffset)
            OpenBankDialog(ped, _offset, camOffset)
        end,
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 25,
    },

    { -- apu
        model = "mp_m_shopkeep_01",
        pos = vector3(24.48, -1347.432, 29.49),
        heading = 274.99,
        haveAction = false,
        action = function(ped, _offset, camOffset)
            OpenBankDialog(ped, _offset, camOffset)
        end,
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 25,
    },

    { -- apu
        model = "mp_m_shopkeep_01",
        pos = vector3(372.53, 326.18, 103.56),
        heading = 254.9,
        haveAction = false,
        action = function(ped, _offset, camOffset)
            OpenBankDialog(ped, _offset, camOffset)
        end,
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 25,
    },
}


local ActiveNpcs = {}
Citizen.CreateThread(function()
    while true do
        local pPed = GetPlayerPed(-1)
        local pCoords = GetEntityCoords(pPed)
        for _,v in pairs(npcs) do
            local dst = GetDistanceBetweenCoords(v.pos, pCoords, true)
            if not v.spawned then
                if dst <= v.LoadDst then
                    v.spawned = true
                    rUtils.LoadModel(v.model)
                    v.entity = CreatePed(1, v.model, v.pos.x, v.pos.y, v.pos.z-1.0, v.heading, 0, 0)
                    TaskSetBlockingOfNonTemporaryEvents(v.entity, true)
                    FreezeEntityPosition(v.entity, true)
                    if v.haveAction then
                        table.insert(ActiveNpcs, {pos=v.pos, action=v.action, offset=v.camOffset, ped=v.entity, cam=v.camCoords})
                    end
                end
            else
                if dst > v.LoadDst then
                    if DoesEntityExist(v.entity) then
                        v.spawned = false
                        DeleteEntity(v.entity)
                        if v.haveAction then
                            for k,i in pairs(ActiveNpcs) do
                                if v.pos == i.pos then
                                    table.remove(ActiveNpcs, k)
                                end
                            end
                        end
                    end
                end
            end
        end


        Wait(3500)
    end
end)



Citizen.CreateThread(function()
    while true do
        local NearNPC = false
        local pPed = GetPlayerPed(-1)
        local pCoords = GetEntityCoords(pPed)


        for k,v in pairs(ActiveNpcs) do
            local dst = GetDistanceBetweenCoords(pCoords, v.pos, true)
            if dst <= 2.0 then
                NearNPC = true
                RageUI.Text({message="Appuyer sur E pour parler avec la personne."})
                if IsControlJustReleased(1, 38) then
                    v.action(v.ped, v.offset, v.cam)
                end
            end
        end


        if NearNPC then
            Wait(1)
        else
            Wait(500)
        end
    end
end)




function KillNpcCam()
    RenderScriptCams(0, 1, 1000, 0, 0)
    Wait(1000)
    SetCamActive(NPC_CAM, 0)
    NPC_CAM = nil
end
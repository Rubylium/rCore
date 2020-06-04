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

    { -- hunter
        model = "cs_hunter",
        pos = vector3(-1490.762, 4981.518, 63.33835),
        heading = 91.010002136,
        haveAction = true,
        action = function(ped, _offset, camOffset)
            OpenHunterDialog(ped, _offset, camOffset)
        end,
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 100,
    },

    { -- tige
        model = "csb_prolsec",
        pos = vector3(217.7209, -875.269, 30.49209),
        heading = 297.4478759,
        haveAction = true,
        action = function(ped, _offset, camOffset)
            OpenTigeLspdMenu()
        end,
        scenario = "WORLD_HUMAN_SECURITY_SHINE_TORCH",
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 100,
    },

    { -- tige
        model = "s_m_y_sheriff_01",
        pos = vector3(2037.124, 3179.599, 45.2277),
        heading = 183.38591,
        haveAction = true,
        action = function(ped, _offset, camOffset)
            OpenTigeSheriffMenu()
        end,
        scenario = "WORLD_HUMAN_GUARD_STAND",
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 100,
    },


    { -- Sandy shore BCSO
        model = "s_m_y_sheriff_01",
        pos = vector3(1859.034, 3681.899, 33.8258),
        heading = 203.18428,
        haveAction = false,
        action = function(ped, _offset, camOffset)
            OpenTigeSheriffMenu()
        end,
        scenario = "WORLD_HUMAN_GUARD_STAND",
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 100,
    },

    { -- Sandy shore BCSO
        model = "s_m_y_sheriff_01",
        pos = vector3(1852.94, 3688.935, 34.26709),
        heading = 202.934,
        haveAction = false,
        action = function(ped, _offset, camOffset)
            OpenTigeSheriffMenu()
        end,
        scenario = "WORLD_HUMAN_GUARD_STAND",
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 100,
    },

    { -- Sandy shore BCSO
        model = "s_m_y_sheriff_01",
        pos = vector3(1857.662, 3691.072, 30.25923),
        heading = 302.731,
        haveAction = false,
        action = function(ped, _offset, camOffset)
            OpenTigeSheriffMenu()
        end,
        scenario = "WORLD_HUMAN_GUARD_PATROL",
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 100,
    },


    { -- Fédéral
        model = "s_m_y_sheriff_01",
        pos = vector3(1852.38, 2582.48, 45.67201),
        heading = 283.0083,
        haveAction = false,
        action = function(ped, _offset, camOffset)
            OpenTigeSheriffMenu()
        end,
        scenario = "WORLD_HUMAN_GUARD_STAND",
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 100,
    },
}


local ActiveNpcs = {}
Citizen.CreateThread(function()
    while true do
        local pCoords = GetEntityCoords(pPed)
        for _,v in pairs(npcs) do
            local dst = GetDistanceBetweenCoords(v.pos, pCoords, true)
            if not v.spawned then
                if dst <= v.LoadDst then
                    v.spawned = true
                    rUtils.LoadModel(v.model)
                    v.entity = CreatePed(1, v.model, v.pos.x, v.pos.y, v.pos.z-1.0, v.heading, 0, 0)
                    TaskSetBlockingOfNonTemporaryEvents(v.entity, true)
                    SetBlockingOfNonTemporaryEvents(v.entity, true)
                    FreezeEntityPosition(v.entity, true)
                    if v.haveAction then
                        table.insert(ActiveNpcs, {pos=v.pos, action=v.action, offset=v.camOffset, ped=v.entity, cam=v.camCoords})
                    end
                    if v.scenario ~= nil then
                        TaskStartScenarioInPlace(v.entity, v.scenario, -1, true)
                    end
                    SetEntityInvincible(v.entity, true)
                    SetEveryoneIgnorePlayer(GetPlayerIndex(), true)
                    SetPoliceIgnorePlayer(GetPlayerIndex(), true)
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
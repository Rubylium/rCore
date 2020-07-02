npcs = {
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


    { -- mine 
        model = "s_m_y_construct_01",
        pos = vector3(2956.019, 2746.155, 43.51757),
        heading = 314.601684,
        haveAction = true,
        action = function(ped, _offset, camOffset)
            OpenMineMenu(ped, _offset, camOffset)
        end,
        scenario = "WORLD_HUMAN_CLIPBOARD",
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 100,
    },


    { -- weed seed 
        model = "mp_m_weed_01",
        pos = vector3(2218.82, 5604.767, 54.60904),
        heading = 109.7403030,
        haveAction = true,
        action = function(ped, _offset, camOffset)
            openedWeedSeedShop(ped, _offset, camOffset)
        end,
        scenario = "WORLD_HUMAN_GUARD_PATROL",
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 100,
    },

    { -- Livraison 
        model = "s_m_m_gentransport",
        pos = vector3(-288.7522, -2661.436, 6.159536),
        heading = 45.722217559,
        haveAction = true,
        action = function(ped, _offset, camOffset)
            OpenConvoiMenu(ped, _offset, camOffset)
        end,
        scenario = "WORLD_HUMAN_CLIPBOARD",
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 100,
    },

    { -- stocks 
        model = "s_m_m_gentransport",
        pos = vector3(2689.816, 3461.326, 56.2292),
        heading = 162.1072845459,
        haveAction = true,
        action = function(ped, _offset, camOffset)
            ConvoiData:OpenStocksShop(ped, _offset, camOffset)
        end,
        scenario = "WORLD_HUMAN_CLIPBOARD",
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 100,
    },

    { -- police 
        model = "s_m_y_cop_01",
        pos = vector3(-1097.53, -839.9486, 19.00156),
        heading = 117.415428161,
        haveAction = false,
        action = function(ped, _offset, camOffset)
            OpenStocksShop()
        end,
        scenario = "WORLD_HUMAN_COP_IDLES",
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 100,
    },
    { -- police 
        model = "s_m_y_cop_01",
        pos = vector3(-1113.776, -826.0406, 19.31736),
        heading = 38.3785743,
        haveAction = false,
        action = function(ped, _offset, camOffset)
            OpenStocksShop()
        end,
        scenario = "WORLD_HUMAN_COP_IDLES",
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 100,
    },
    { -- police 
        model = "s_m_y_cop_01",
        pos = vector3(-1110.234, -823.3088, 19.31974),
        heading = 37.3061,
        haveAction = false,
        action = function(ped, _offset, camOffset)
            OpenStocksShop()
        end,
        scenario = "WORLD_HUMAN_COP_IDLES",
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 100,
    },

    { -- gouv 
        model = "cs_karen_daniels",
        pos = vector3(409.146, 4829.376, -58.99962),
        heading = 250.43064880,
        haveAction = false,
        action = function(ped, _offset, camOffset)
            OpenStocksShop()
        end,
        scenario = "WORLD_HUMAN_CLIPBOARD",
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 100,
    },

    { -- spawnFaq 
        model = "csb_reporter",
        pos = vector3(400.51, -379.017, 46.9221),
        heading = 26.6701736,
        haveAction = true,
        action = function(ped, _offset, camOffset)
            OpenFaqMenu(ped, _offset, camOffset)
        end,
        scenario = "WORLD_HUMAN_CLIPBOARD",
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 100,
    },

    { -- spawnFaq 
        model = "s_m_y_construct_02",
        pos = vector3(87.0439, -390.3884, 41.146),
        heading = 319.454223,
        haveAction = true,
        action = function(ped, _offset, camOffset)
            OpenChantierMenu(ped, _offset, camOffset)
        end,
        scenario = "WORLD_HUMAN_CLIPBOARD",
        camOffset = {0.0, 1.3, 0.55}, -- pos
        camCoords = {0.0, 0.0, 0.7}, -- visé
        spawned = false,
        entity = nil,
        LoadDst = 100,
    },
    { -- bank
        model = "s_m_y_dealer_01",
        pos = vector3(1152.68, -431.9762, 67.01252),
        heading = 73.911911,
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
    { 
        model = "s_m_y_dealer_01",
        pos = vector3(-430.8148, 291.7604, 86.06242),
        heading = 219.946441,
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


local swat = {
    {pos = vector3(-1082.3, -817.7292, 14.883),heading = 49.885730743408,},
    {pos = vector3(-1079.134, -815.6598, 14.883),heading = 304.86111450196,},
    {pos = vector3(-1085.376, -821.3854, 14.883),heading = 125.6315689087,},
    {pos = vector3(-1077.794, -823.4632, 14.883),heading = 67.810165405274,},
    {pos = vector3(-1080.34, -822.7182, 14.883),heading = 286.0198059082,},
    {pos = vector3(415.4358, 4809.63, -58.99792),heading = 265.94485473632,},
    {pos = vector3(416.705, 4811.09, -58.99792),heading = 156.70530700684,},
    {pos = vector3(413.9546, 4810.6, -58.99792),heading = 79.348518371582,},
}

local police = {
    {pos = vector3(-1111.202, -850.169, 13.4761),heading = 126.1078414917,},
    {pos = vector3(-1114.104, -846.695, 13.41016),heading = 127.14124298096,},
    {pos = vector3(-1120.99, -834.2324, 13.33628),heading = 235.27450561524,},
    {pos = vector3(-1109.818, -842.1338, 19.31728),heading = 177.12803649902,},
    {pos = vector3(-1106.054, -847.2042, 19.31728),heading = 77.06421661377,},
    {pos = vector3(-1103.866, -827.7752, 14.2828),heading = 209.82640075684,},
    {pos = vector3(-1099.934, -824.7564, 14.2828),heading = 211.03717041016,},
    {pos = vector3(-1077.378, -856.5096, 5.042846),heading = 200.1636352539,},
}

local policeChill = {
    {pos = vector3(-1136.104, -845.2598, 19.31714),heading = 55.21851348877,},
    {pos = vector3(-1138.28, -843.8088, 19.3169),heading = 244.5990600586,},
    {pos = vector3(-1136.492, -843.2734, 19.31688),heading = 149.7915802002,},
    {pos = vector3(-1122.872, -858.708, 19.69246),heading = 287.64477539062,},
    {pos = vector3(-1121.246, -857.4908, 19.69246),heading = 139.1965637207,},
}

local policeChillGang = {
    {pos = vector3(-1109.774, -857.6486, 19.31684),heading = 213.09672546386,},
    {pos = vector3(-1111.128, -858.6424, 19.31678),heading = 228.39694213868,},
}

local gouvGuard = {
    {pos = vector3(2515.594, -377.453, 93.14036),heading = 267.9761352539,},
    {pos = vector3(2515.594, -390.9094, 93.14036),heading = 265.28601074218,},
    {pos = vector3(2567.384, -332.1112, 93.12178),heading = 178.8547821045,},
    {pos = vector3(2576.936, -295.8546, 93.40716),heading = 177.60093688964,},
    {pos = vector3(2581.504, -300.393, 93.07844),heading = 211.33448791504,},
    {pos = vector3(2574.146, -289.5916, 93.07824),heading = 310.42391967774,},
    {pos = vector3(2568.058, -295.1608, 93.07816),heading = 89.150207519532,},
    {pos = vector3(2560.248, -285.778, 92.9925),heading = 289.52410888672,},
    {pos = vector3(2566.838, -324.607, 92.99282),heading = 48.717975616456,},
    {pos = vector3(2568.64, -324.628, 92.99272),heading = 328.18670654296,},
    {pos = vector3(2520.96, -354.7738, 94.12788),heading = 234.16744995118,},
    {pos = vector3(2488.45, -377.0338, 93.73542),heading = 271.23553466796,},
    {pos = vector3(2488.28, -391.2926, 93.73544),heading = 269.38391113282,},
    {pos = vector3(2525.622, -402.498, 93.14032),heading = 321.20635986328,},
    {pos = vector3(2536.084, -412.9602, 93.14032),heading = 315.02941894532,},
    {pos = vector3(2525.646, -365.708, 93.14018),heading = 228.50946044922,},
    {pos = vector3(2536.096, -355.3052, 93.14018),heading = 224.92965698242,},
    {pos = vector3(2557.114, -599.7096, 64.86174),heading = 103.12203979492,},
    {pos = vector3(2558.978, -599.8398, 64.9463),heading = 195.97752380372,},
    {pos = vector3(2565.124, -607.7394, 64.7042),heading = 76.700675964356,},
    {pos = vector3(433.2896, 4818.216, -58.99958),heading = 316.10470581054,},
    {pos = vector3(430.1476, 4824.31, -58.99962),heading = 186.65032958984,},
    {pos = vector3(419.4872, 4815.476, -58.99792),heading = 0.8544751405716,},
    {pos = vector3(418.033, 4826.088, -58.99962),heading = 98.486083984375,},
    {pos = vector3(396.729, 4833.864, -58.99964),heading = 184.03701782226,},
    {pos = vector3(375.2868, 4833.058, -58.99938),heading = 87.978202819824,},
    {pos = vector3(354.3972, 4841.526, -58.99946),heading = 156.67184448242,},
    {pos = vector3(335.794, 4836.188, -58.99946),heading = 268.63391113282,},
    {pos = vector3(336.5228, 4844.926, -58.99948),heading = 250.29638671875,},
    {pos = vector3(340.9338, 4862.018, -58.9997),heading = 233.99572753906,},
    {pos = vector3(346.5388, 4861.612, -58.99954),heading = 104.44626617432,},
}

local gouvChill = {
    {pos = vector3(2507.59, -394.253, 94.11994),heading = 242.53051757812,},
    {pos = vector3(2509.25, -395.4226, 94.12002),heading = 66.786911010742,},
}

Citizen.CreateThread(function()
    for k,v in pairs(swat) do
        table.insert(npcs, {model = "s_m_y_swat_01", pos = v.pos, heading = v.heading, haveAction = false, LoadDst = 50, scenario = "WORLD_HUMAN_COP_IDLES"})
    end

    for k,v in pairs(police) do
        table.insert(npcs, {model = "s_m_y_cop_01", pos = v.pos, heading = v.heading, haveAction = false, LoadDst = 50, scenario = "WORLD_HUMAN_COP_IDLES"})
    end

    for k,v in pairs(policeChill) do
        table.insert(npcs, {model = "s_m_y_cop_01", pos = v.pos, heading = v.heading, haveAction = false, LoadDst = 50, scenario = "WORLD_HUMAN_AA_COFFEE"})
    end

    for k,v in pairs(policeChillGang) do
        table.insert(npcs, {model = "s_m_m_chemsec_01", pos = v.pos, heading = v.heading, haveAction = false, LoadDst = 50, scenario = "WORLD_HUMAN_AA_SMOKE"})
    end
    
    for k,v in pairs(gouvGuard) do
        table.insert(npcs, {model = "mp_m_securoguard_01", pos = v.pos, heading = v.heading, haveAction = false, LoadDst = 100, scenario = "WORLD_HUMAN_COP_IDLES"})
    end

    for k,v in pairs(gouvChill) do
        table.insert(npcs, {model = "s_m_m_fiboffice_01", pos = v.pos, heading = v.heading, haveAction = false, LoadDst = 100, scenario = "WORLD_HUMAN_AA_SMOKE"})
    end
end)


local ActiveNpcs = {}
Citizen.CreateThread(function()
    Wait(1000)
    while true do
        local pCoords = GetEntityCoords(pPed)
        for _,v in pairs(npcs) do
            local dst = GetDistanceBetweenCoords(v.pos, pCoords, true)
            if not v.spawned then
                if dst <= v.LoadDst then
                    v.spawned = true
                    rUtils.LoadModel(GetHashKey(v.model))
                    v.entity = CreatePed_(1, v.model, v.pos.x, v.pos.y, v.pos.z-1.0, v.heading, 0, 0)
                    TaskSetBlockingOfNonTemporaryEvents(v.entity, true)
                    SetBlockingOfNonTemporaryEvents(v.entity, true)
                    --FreezeEntityPosition(v.entity, true)
                    if v.haveAction then
                        table.insert(ActiveNpcs, {pos=v.pos, action=v.action, offset=v.camOffset, ped=v.entity, cam=v.camCoords})
                    end
                    if v.scenario ~= nil then
                        TaskStartScenarioInPlace(v.entity, v.scenario, -1, true)
                    end
                    --SetEntityInvincible(v.entity, true)
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
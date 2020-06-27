


local workZone = {
    {
        emote = "e weld",
        pos = vector3(87.48754, -419.674, 37.55276),
        heading = 158.18992614,
        time = 10000,
        money = 13,
    },
    {
        emote = "e weld",
        pos = vector3(86.29858, -424.9816, 37.5523),
        heading = 71.574913024,
        time = 10000,
        money = 13,
    },
    {
        emote = "e weld",
        pos = vector3(84.85888, -425.0366, 37.55244),
        heading =  330.570648,
        time = 10000,
        money = 13,
    },
    {
        emote = "e weld",
        pos = vector3(79.66342, -422.9928, 37.55242),
        heading = 333.9955444336,
        time = 10000,
        money = 13,
    },
    {
        emote = "e weld",
        pos = vector3(81.1464, -417.908, 37.5528),
        heading = 249.337280273,
        time = 10000,
        money = 13,
    },
}


local hammer = {
    {pos = vector3(96.348, -415.1952, 37.5524),heading = 246.59646606446,},
    {pos = vector3(98.22818, -414.315, 37.55232),heading = 157.759475708,},
    {pos = vector3(98.9909, -416.1928, 37.55232),heading = 71.552352905274,},
    {pos = vector3(97.17874, -417.0418, 37.5524),heading = 343.89627075196,},
    {pos = vector3(85.52386, -445.0166, 37.5523),heading = 260.74700927734,},
    {pos = vector3(86.34966, -442.7204, 37.5523),heading = 256.47100830078,},
}

local weld = {
    {pos = vector3(78.89566, -442.788, 37.5523),heading = 161.83003234864,},
    {pos = vector3(79.3559, -444.2086, 37.55224),heading = 67.652435302734,},
    {pos = vector3(77.96778, -448.3682, 37.55226),heading = 67.551956176758,},
    {pos = vector3(76.39124, -448.468, 37.55226),heading = 335.94815063476,},
    {pos = vector3(71.14262, -446.4968, 37.55226),heading = 335.23672485352,},
    {pos = vector3(70.99354, -445.039, 37.55226),heading = 247.31996154786,},
    {pos = vector3(72.42836, -441.1954, 37.55228),heading = 246.93505859375,},
    {pos = vector3(73.80232, -440.957, 37.55228),heading = 160.91746520996,},
}

Citizen.CreateThread(function()
    for k,v in pairs(hammer) do
        table.insert(workZone, {
            emote = "e hammer",
            pos = v.pos,
            heading = v.heading,
            time = 6000,
            money = 10,
        })
    end

    for k,v in pairs(weld) do
        table.insert(workZone, {
            emote = "e weld",
            pos = v.pos,
            heading = v.heading,
            time = 10000,
            money = 13,
        })
    end
end)


local open = false
local inWork = false

RMenu.Add('core', "Chantier", RageUI.CreateMenu("Gérant chantier", "~b~Chef de chantier"))
RMenu:Get('core', "Chantier").Closed = function()
    open = false
    KillNpcCam()
end


function OpenChantierMenu(npc, offset, camOffset)
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
    RageUI.Visible(RMenu:Get('core', "Chantier"), not RageUI.Visible(RMenu:Get('core', "Chantier")))
    open = true
    Citizen.CreateThread(function()
        while open do
            RageUI.IsVisible(RMenu:Get('core', "Chantier"), true, true, true, function()
                RageUI.Button("Commencer à travailler", nil, not inWork, function(_,_,s)
                    if s then 
                        StartChantierWork()
                    end
                end)
                RageUI.Button("Stopper le travail", nil, inWork, function(_,_,s)
                    if s then 
                        StartChantierWork()
                        exports.rFramework:ReloadPlayerCloth()
                    end
                end)
    
            end, function()
            end)


            Wait(1)
        end
    end)
end


local mineCloths = {
    homme = {
        {
            name = "Mine homme",
            cloth = {
                ["tshirt_1"] = 89,
                ["tshirt_2"] = 0,
                ["torso_1"] = 238,
                ["torso_2"] = 4,
                ["pants_1"] = 98,
                ["pants_2"] = 6,
                ["shoes_1"] = 71,
                ["shoes_2"] = 4,
                ["arms"] = 51,
                ["arms_2"] = 0,
                ["helmet_1"] = 25,
                ["helmet_2"] = 1,
                ["chain_1"] = -1,
                ["chain_2"] = 0,
                ["bracelets_1"] = -1,
                ["bracelets_2"] = 0,
                ["ears_1"] = -1,
                ["ears_2"] = 0,
                ["mask_1"] = 0,
                ["mask_2"] = 0,
                ["watches_1"] = -1,
                ["watches_2"] = 0,
                ["decals_1"] = 0,
                ["bags_1"] = 0,
            },
        },
    },
    femme = {
        {
            name = "Mine femme",
            cloth = {
                ["tshirt_1"] = 56,
                ["tshirt_2"] = 0,
                ["torso_1"] = 226,
                ["torso_2"] = 19,
                ["pants_1"] = 101,
                ["pants_2"] = 6,
                ["shoes_1"] = 74,
                ["shoes_2"] = 4,
                ["arms"] = 50,
                ["arms_2"] = 0,
                ["helmet_1"] = 53,
                ["helmet_2"] = 1,
                ["chain_1"] = -1,
                ["chain_2"] = 0,
                ["bracelets_1"] = -1,
                ["bracelets_2"] = 0,
                ["ears_1"] = -1,
                ["ears_2"] = 0,
                ["mask_1"] = 0,
                ["mask_2"] = 0,
                ["watches_1"] = -1,
                ["watches_2"] = 0,
                ["decals_1"] = 0,
                ["bags_1"] = 0,
            },
        },  
    }
}


function StartChantierWork()
    if inWork then inWork = false return end
    inWork = true
    Citizen.CreateThread(function()

        if GetEntityModel(pPed) == GetHashKey("mp_m_freemode_01") then
            for k,i in pairs(mineCloths.homme[1].cloth) do
                TriggerEvent("skinchanger:change", k, i)
            end
        elseif GetEntityModel(pPed) == GetHashKey("mp_f_freemode_01") then
            for k,i in pairs(mineCloths.femme[1].cloth) do
                TriggerEvent("skinchanger:change", k, i)
            end
        end

        while inWork do
            local self = workZone[math.random(1,#workZone)]
            
            local pCoords = GetEntityCoords(pPed)
            local dst = GetDistanceBetweenCoords(pCoords, self.pos, true)
            Citizen.CreateThread(function()
                while dst > 1.3 do
                    Wait(1)
                    DrawMarker(1, self.pos, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 15.0, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                    if not inWork then return end
                end
            end)
            while dst > 1.3 do
                local pCoords = GetEntityCoords(pPed)
                dst = GetDistanceBetweenCoords(pCoords, self.pos, true)

                if not inWork then return end
                Wait(500)
            end

            if self.double == nil then
                NetworkResurrectLocalPlayer(self.pos, self.heading, 0, 0)
                SetEntityCoords(pPed, self.pos.x, self.pos.y, self.pos.z-1.0, 0.0, 0.0, 0.0, 0)
                SetEntityHeading(pPed, self.heading)
                ExecuteCommand(self.emote)
                InAction = true
                Wait(self.time)
                TriggerEvent("emote:StopEmote")
                ExecuteCommand("e shakeoff")
                TriggerServerEvent(events.giveMoney, token, self.money +  rUtils.GetVipBonus(self.money)) 
                InAction = false
            end
        end
    end)
end
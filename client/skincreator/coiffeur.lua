local ShopZone = {
    vector3(137.6372, -1708.446, 29.29204),
    vector3(1212.336, -473.4004, 66.20798),
    vector3(-33.71448, -152.1818, 57.07648),
    vector3(-1282.472, -1117.272, 6.990112),
    vector3(-813.6538, -183.1552, 37.56894),
    vector3(-278.7602, 6227.632, 31.69552),
    vector3(1931.614, 3730.442, 32.84442),
}

for k,v in pairs(ShopZone) do
    rUtils.RegisterActionZone({
        pos = v,
        action = function()
            OpenBarbershopMenu()
        end,
    })

    local blip = AddBlipForCoord(v)
    SetBlipSprite(blip, 71)
    SetBlipScale(blip, 0.50)
    SetBlipColour(blip, 17)
    SetBlipAsShortRange(blip, true)
    SetBlipCategory(blip, 12)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Coiffeur - Barbershop")
    EndTextCommandSetBlipName(blip)
end

local open = false
RMenu.Add('core', 'barberShop', RageUI.CreateMenu("BarberShop", "~b~BarberShop ~."))
RMenu:Get('core', 'barberShop').Closed = function()
    exports.rFramework:ReloadPlayerCloth()
    KillCreatorCam()
    open = false
end;

local barber = {}
local names = {}
function GetBarberValues()
    local _names = {
        [GetHashKey("mp_f_freemode_01")] = {
            [1] = {GXT = "H_FMF_0_0"},
            [2] = {GXT = "H_FMF_1_0"},
            [3] = {GXT = "H_FMF_2_0"},
            [4] = {GXT = "H_FMF_3_0"},
            [5] = {GXT = "H_FMF_4_0"},
            [6] = {GXT = "H_FMF_5_0"},
            [7] = {GXT = "H_FMF_6_0"},
            [8] = {GXT = "H_FMF_7_0"},
            [9] = {GXT = "H_FMF_8_0"},
            [10] = {GXT = "H_FMF_9_0"},
            [11] = {GXT = "H_FMF_10_0"},
            [12] = {GXT = "H_FMF_11_0"},
            [13] = {GXT = "H_FMF_12_0"},
            [14] = {GXT = "H_FMF_13_0"},
            [15] = {GXT = "H_FMF_14_0"},
            [16] = {GXT = "H_FMF_15_0"},
            [17] = {GXT = "CLO_BBF_H_00"},
            [18] = {GXT = "CLO_BBF_H_05"},
            [19] = {GXT = "CLO_VALF_H_0_0"},
            [20] = {GXT = "CLO_BUS_F_H_0_0"},
            [21] = {GXT = "CLO_BUS_F_H_1_0"},
            [22] = {GXT = "CLO_HP_F_HR_0_0"},
            [23] = {GXT = "CLO_HP_F_HR_1_0"},
            [24] = {GXT = "NO_LABEL"},
            [25] = {GXT = "CLO_S1F_H_0_0"},
            [26] = {GXT = "CLO_S1F_H_1_0"},
            [27] = {GXT = "CLO_S1F_H_2_0"},
            [28] = {GXT = "CLO_S1F_H_3_0"},
            [29] = {GXT = "CLO_S2F_H_0_0"},
            [30] = {GXT = "CLO_S2F_H_1_0"},
            [31] = {GXT = "CLO_S2F_H_2_0"},
            [32] = {GXT = "CLO_BIF_H_0_0"},
            [33] = {GXT = "CLO_BIF_H_1_0"},
            [34] = {GXT = "CLO_BIF_H_2_0"},
            [35] = {GXT = "CLO_BIF_H_3_0"},
            [36] = {GXT = "CLO_BIF_H_4_0"},
            [37] = {GXT = "CLO_BIF_H_6_0"},
            [38] = {GXT = "CLO_BIF_H_5_0"},
            [39] = {GXT = "CC_F_HS_1"},
            [40] = {GXT = "CC_F_HS_2"},
            [41] = {GXT = "CC_F_HS_3"},
            [42] = {GXT = "CC_F_HS_4"},
            [43] = {GXT = "CC_F_HS_5"},
            [44] = {GXT = "CC_F_HS_6"},
            [45] = {GXT = "CC_F_HS_7"},
            [46] = {GXT = "CC_F_HS_8"},
            [47] = {GXT = "CC_F_HS_9"},
            [48] = {GXT = "CC_F_HS_10"},
            [49] = {GXT = "CC_F_HS_11"},
            [50] = {GXT = "CC_F_HS_12"},
            [51] = {GXT = "CC_F_HS_13"},
            [52] = {GXT = "CC_F_HS_14"},
            [53] = {GXT = "CC_F_HS_15"},
            [54] = {GXT = "CLO_BBF_H_05"},
            [55] = {GXT = "CLO_BBF_H_00"},
            [56] = {GXT = "CLO_BUS_F_H_0_0"},
            [57] = {GXT = "CLO_BUS_F_H_1_0"},
            [58] = {GXT = "CLO_VALF_H_0_0"},
            [59] = {GXT = "CLO_HP_F_HR_0_0"},
            [60] = {GXT = "CLO_HP_F_HR_1_0"},
            [61] = {GXT = "CLO_INDF_H_0_0"},
            [62] = {GXT = "CLO_S1F_H_0_0"},
            [63] = {GXT = "CLO_S1F_H_1_0"},
            [64] = {GXT = "CLO_S1F_H_2_0"},
            [65] = {GXT = "CLO_S1F_H_3_0"},
            [66] = {GXT = "CLO_S2F_H_0_0"},
            [67] = {GXT = "CLO_S2F_H_1_0"},
            [68] = {GXT = "CLO_S2F_H_2_0"},
            [69] = {GXT = "CLO_BIF_H_0_0"},
            [70] = {GXT = "CLO_BIF_H_1_0"},
            [71] = {GXT = "CLO_BIF_H_2_0"},
            [72] = {GXT = "CLO_BIF_H_3_0"},
            [73] = {GXT = "CLO_BIF_H_4_0"},
            [74] = {GXT = "CLO_BIF_H_5_0"},
            [75] = {GXT = "CLO_BIF_H_6_0"},
            [76] = {GXT = "CLO_GRF_H_0_0"},
            [77] = {GXT = "CLO_GRF_H_1_0"},
            [78] = {GXT = "CLO_VWF_H_0_0"},
        },

        [GetHashKey("mp_m_freemode_01")] = {
            [1] = {GXT = "H_FMM_0_0"},
            [2] = {GXT = "H_FMM_1_0"},
            [3] = {GXT = "H_FMM_2_0"},
            [4] = {GXT = "H_FMM_3_0"},
            [5] = {GXT = "H_FMM_4_0"},
            [6] = {GXT = "H_FMM_5_0"},
            [7] = {GXT = "H_FMM_6_0"},
            [8] = {GXT = "H_FMM_7_0"},
            [9] = {GXT = "H_FMM_8_0"},
            [10] = {GXT = "H_FMM_9_0"},
            [11] = {GXT = "H_FMM_10_0"},
            [12] = {GXT = "H_FMM_11_0"},
            [13] = {GXT = "H_FMM_12_0"},
            [14] = {GXT = "H_FMM_13_0"},
            [15] = {GXT = "H_FMM_14_0"},
            [16] = {GXT = "CLO_BBM_H_00"},
            [17] = {GXT = "CLO_BBM_H_05"},
            [18] = {GXT = "CLO_BUS_H_0_0"},
            [19] = {GXT = "CLO_BUS_H_1_0"},
            [20] = {GXT = "CLO_HP_HR_0_0"},
            [21] = {GXT = "CLO_HP_HR_1_0"},
            [22] = {GXT = "CLO_IND_H_0_0"},
            [23] = {GXT = "NO_LABEL"},
            [24] = {GXT = "CLO_S1M_H_0_0"},
            [25] = {GXT = "CLO_S1M_H_1_0"},
            [26] = {GXT = "CLO_S1M_H_2_0"},
            [27] = {GXT = "CLO_S1M_H_3_0"},
            [28] = {GXT = "CLO_S2M_H_0_0"},
            [29] = {GXT = "CLO_S2M_H_1_0"},
            [30] = {GXT = "CLO_S2M_H_2_0"},
            [31] = {GXT = "CLO_BIM_H_0_0"},
            [32] = {GXT = "CLO_BIM_H_1_0"},
            [33] = {GXT = "CLO_BIM_H_2_0"},
            [34] = {GXT = "CLO_BIM_H_3_0"},
            [35] = {GXT = "CLO_BIM_H_4_0"},
            [36] = {GXT = "CLO_BIM_H_5_0"},
            [37] = {GXT = "CC_M_HS_1"},
            [38] = {GXT = "CC_M_HS_2"},
            [39] = {GXT = "CC_M_HS_3"},
            [40] = {GXT = "CC_M_HS_4"},
            [41] = {GXT = "CC_M_HS_5"},
            [42] = {GXT = "CC_M_HS_6"},
            [43] = {GXT = "CC_M_HS_7"},
            [44] = {GXT = "CC_M_HS_8"},
            [45] = {GXT = "CC_M_HS_9"},
            [46] = {GXT = "CC_M_HS_10"},
            [47] = {GXT = "CC_M_HS_11"},
            [48] = {GXT = "CC_M_HS_12"},
            [49] = {GXT = "CC_M_HS_13"},
            [50] = {GXT = "CC_M_HS_14"},
            [51] = {GXT = "CC_M_HS_15"},
            [52] = {GXT = "CLO_BBM_H_00"},
            [53] = {GXT = "CLO_BBM_H_05"},
            [54] = {GXT = "CLO_BUS_H_0_0"},
            [55] = {GXT = "CLO_BUS_H_1_0"},
            [56] = {GXT = "CLO_HP_HR_0_0"},
            [57] = {GXT = "CLO_HP_HR_1_0"},
            [58] = {GXT = "CLO_IND_H_0_0"},
            [59] = {GXT = "CLO_S1M_H_0_0"},
            [60] = {GXT = "CLO_S1M_H_1_0"},
            [61] = {GXT = "CLO_S1M_H_2_0"},
            [62] = {GXT = "CLO_S1M_H_3_0"},
            [63] = {GXT = "CLO_S2M_H_0_0"},
            [64] = {GXT = "CLO_S2M_H_1_0"},
            [65] = {GXT = "CLO_S2M_H_2_0"},
            [66] = {GXT = "CLO_BIM_H_0_0"},
            [67] = {GXT = "CLO_BIM_H_1_0"},
            [68] = {GXT = "CLO_BIM_H_2_0"},
            [69] = {GXT = "CLO_BIM_H_3_0"},
            [70] = {GXT = "CLO_BIM_H_4_0"},
            [71] = {GXT = "CLO_BIM_H_5_0"},
            [72] = {GXT = "CLO_GRM_H_0_0"},
            [73] = {GXT = "CLO_GRM_H_1_0"},
            [74] = {GXT = "CLO_VWM_H_0_0"},
        },
    }


    local accessorie = {
        {price = 0,label = "taille barbe",            item = "beard_2", 		max = 10,                           min = 0,},
		{price = 5,label = "type barbe",              item = "beard_1", 		max = GetNumHeadOverlayValues(1)-1, min = 0,},
        {price = 3,label = "couleur barbe 1",         item = "beard_3", 		max = GetNumHairColors()-1,		    min = 0,},
        {price = 2,label = "couleur barbe secondaire",item = "beard_4", 		max = GetNumHairColors()-1,         min = 0,},
        {price = 15,label = "cheveux",                item = "hair_1",		max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 2) - 1,						min = 0,},
		{price = 0,label = "Style des cheveux",       item = "hair_2",		max = GetNumberOfPedTextureVariations(GetPlayerPed(-1), 2, GetPedTextureVariation(GetPlayerPed(-1), 2)) - 1, min = 0,},
		{price = 4,label = "couleur cheveux 1",       item = "hair_color_1", 	max = GetNumHairColors()-1,																min = 0,},
		{price = 3,label = "couleur cheveux 2",       item = "hair_color_2", 	max = GetNumHairColors()-1,																min = 0,},
    }

    barber = accessorie
    names = _names
end
 
function LoadBarberShopData()
    GetBarberValues()
    for k,v in pairs(barber) do
        RMenu.Add('core', v.item.."1", RageUI.CreateSubMenu(RMenu:Get('core', 'barberShop'), "BarberShop", "~b~Géstion du visages de votre personnage."))
        RMenu:Get('core', v.item.."1").Closed = function()
            exports.rFramework:ReloadPlayerCloth()
            SwitchCam(true, "default")
            PlayRandomClothAnim()
        end
    end
end


function OpenBarbershopMenu()
    RageUI.Visible(RMenu:Get('core', 'barberShop'), not RageUI.Visible(RMenu:Get('core', 'barberShop')))
    CreateCreatorCam()
    OpenBarbershopMenuThread()
    GetAccessoireValues()
    SetPedPropIndex(pPed, 0, -1, -1, 2)
end


function OpenBarbershopMenuThread()
    if open then return end
    Citizen.CreateThread(function()
        open = true
        while open do
            Wait(1)

            if IsControlJustReleased(1, 22) then
                ClearPedTasksImmediately(pPed)
                local coords = GetOffsetFromEntityInWorldCoords(pPed, 0.0, -5.0, 0.0)
                TaskTurnPedToFaceCoord(pPed, coords, 3000)
            end

            RageUI.IsVisible(RMenu:Get('core', 'barberShop'), true, true, true, function()
                for k,v in pairs(barber) do
                    RageUI.ButtonWithStyle(v.label, nil, { RightLabel = "→→" }, true, function(_,_,s)
                        if s then
                            SwitchCam(false, v.item)
                            ClearPedTasks(pPed)
                        end
                    end, RMenu:Get('core', v.item.."1"))
                end

            end, function()
            end)

            for k,v in pairs(barber) do
                RageUI.IsVisible(RMenu:Get('core', v.item.."1"), true, true, true, function()
                    for i = v.min, v.max do
                        if NotSpamming[k] == nil then NotSpamming[k] = i end
                        if v.label == "cheveux" then
                            local m = GetEntityModel(pPed)
                            RageUI.ButtonWithStyle(GetLabelText(names[tonumber(m)][tonumber(i + 1)].GXT), nil, { RightLabel = "→ Acheter [~g~"..v.price.."~s~$]" }, not usingVipPed, function(_,h,s)
                                if s then
                                    TriggerEvent("skinchanger:change", v.item, i)
                                    TriggerEvent("rF:SaveSkin", v.item, i)
                                    TriggerServerEvent(events.rmvMoney, token, v.price)
                                    TriggerEvent("skinchanger:change", "helmet_1", -1)
                                    TriggerEvent("skinchanger:change", "mask_1", 0)
                                end
                                if h then
                                    if NotSpamming[k] ~= i then
                                        TriggerEvent("skinchanger:change", "helmet_1", -1)
                                        TriggerEvent("skinchanger:change", "mask_1", 0)
                                        TriggerEvent("skinchanger:change", v.item, i)
                                        NotSpamming[k] = i
                                    end
                                    
                                end
                             end) 
                        else
                            RageUI.ButtonWithStyle(v.label.." "..i, nil, { RightLabel = "→ Acheter [~g~"..v.price.."~s~$]" }, not usingVipPed, function(_,h,s)
                                if s then
                                    TriggerEvent("skinchanger:change", v.item, i)
                                    TriggerEvent("rF:SaveSkin", v.item, i)
                                    TriggerServerEvent(events.rmvMoney, token, v.price)
                                    TriggerEvent("skinchanger:change", "helmet_1", -1)
                                    TriggerEvent("skinchanger:change", "mask_1", 0)
                                end
                                if h then
                                    
                                    if NotSpamming[k] ~= i then
                                        TriggerEvent("skinchanger:change", "helmet_1", -1)
                                        TriggerEvent("skinchanger:change", "mask_1", 0)
                                        TriggerEvent("skinchanger:change", v.item, i)
                                        NotSpamming[k] = i
                                    end
                                end
                            end) 
                        end
                    end
                end, function()

                end)
            end
        end
    end)
end
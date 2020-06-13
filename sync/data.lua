

mine = {
    npcName = "miner",
    npcDisplay = "Chef de chantier",

    pos = vector3(2947.817, 2793.506, 40.64645),
    props = {
        "csx_rvrbldr_medd_",
        "csx_rvrbldr_mede_",
        "csx_rvrbldr_smla_",
        "csx_rvrbldr_smlb_",
        "csx_rvrbldr_smlc_",
        "csx_rvrbldr_smld_",
    },

    pickaxe = "prop_tool_pickaxe",
    dict = "melee@large_wpn@streamed_core",
    anim = "ground_attack_on_spot",

    earning = 14,

}


hunt = {
    items = {
        {item = "viande1", label="Viande de basse qualité",  price = math.random(5,13)},
        {item = "viande2", label="Viande de qualité normal",  price = math.random(9,15)},
        {item = "viande3", label="Viande de bonne qualité",  price = math.random(15,30)},
        {item = "viande4", label="Viande de qualité incroyable", price = math.random(50,100)},
    },

    events = {
        buy = "rF:BuyItemIfCan",
        addItem = "rF:AddItemIfNotAlreadyHave",
        rmvitem = "rF:RemoveItem",
        sell = "rF:SellItem",
        give = "rF:GiveItem",
    },

    animals =  {
        {
            model = "a_c_deer",
        },
        {
            model = "a_c_boar",
        },
        {
            model = "a_c_coyote",
        },

    },

    dstMax = 600.0,

    entityMax = 4,

    random = 100,

    CreatePed = {
        z = 3.0,
        type = 28,
        heading = 100.0,
        network = false,
        NetEntity = true,
    },

    wander = 99999999.0,
    wander2 = 10.0,

    spriteID = 141,
    scale = 0.20,
    noise = 100.0,

    healthCheck = 50.0,

    dict = "anim@mp_snowball",
    anim = "pickup_snowball",

    central = vector3(-1567.7, 4484.3, 21.4)
}
 

armory = {
    weapons = {
        {label = "Batte De Baseball", item = "batte", prop = "w_me_bat", price = 3500},
        {label = "Couteau de poche", item = "knife", prop = "w_me_knife_01", price = 1500},
        {label = "Tazer", item = "tazer", prop = "w_pi_stungun", price = 7500},
    },
    camType = "DEFAULT_SCRIPTED_CAMERA",

    zone = {
        {pos = vector3(21.40687, -1106.694, 29.79703),heading = 341.06161499023,},
        {pos = vector3(810.8315, -2157.479, 29.61902),heading = 185.2163848877,},
        {pos = vector3(1693.104, 3759.528, 34.70536),heading = 48.778507232666,},
        {pos = vector3(-1305.49, -393.6382, 36.69576),heading = 240.15075683594,},
        {pos = vector3(-331.1886, 6083.312, 31.45476),heading = 38.973510742188,},
    },

    fov = 65.0,
    oCoords = {0.0, 1.0, 0.0},
    CoordToPoint = {0.8, 0.0, 0.3},
}

weed = {
    plante = 30,
    props = {
        [30] = "bkr_prop_weed_01_small_01c",
        [40] = "bkr_prop_weed_01_small_01b",
        [50] = "bkr_prop_weed_01_small_01a",
        [60] = "bkr_prop_weed_med_01a",
        [70] = "bkr_prop_weed_med_01b",
        [80] = "bkr_prop_weed_lrg_01a",
        [90] = "bkr_prop_weed_lrg_01b",
    },
    spawnOffset = {0.0, 1.0, 0.0},
    scenario = "WORLD_HUMAN_GARDENER_PLANT",
    item = "Graine de chanvre",
    item2 = "weed",
    item2Label = "Canabis non traitée",
    itemFinal = "weed2",
    add = 0.1, 
    TraitWait = 1500,

    mission = {
        item = "Canabis de bonne qualité",
        price = 19,
    },
} 


JobMission = {
    zone = {
        {pos = vector3(-1117.348, -1404.78, 4.687136),heading = 340.56176757812,},
        {pos = vector3(-1138.92, -1361.04, 4.578656),heading = 31.905311584472,},
        {pos = vector3(-1072.172, -1251.334, 5.170224),heading = 55.156742095948,},
        {pos = vector3(-1141.974, -1258.11, 6.29326),heading = 25.76929283142,},
        {pos = vector3(-1199.14, -1184.68, 7.213252),heading = 16.152425765992,},
        {pos = vector3(-1255.156, -1162.746, 6.739294),heading = 106.31113433838,},
        {pos = vector3(-1268.79, -1080.388, 7.47374),heading = 301.77215576172,},
        {pos = vector3(-1295.462, -858.6586, 13.44382),heading = 66.445877075196,},
        {pos = vector3(-1353.098, -803.2678, 18.73406),heading = 56.159420013428,},
        {pos = vector3(-1401.202, -744.071, 24.14158),heading = 32.841018676758,},
        {pos = vector3(-1321.784, -675.8836, 26.03172),heading = 314.83477783204,},
        {pos = vector3(-1351.26, -582.7326, 28.9466),heading = 33.542518615722,},
        {pos = vector3(-1309.512, -528.8414, 32.49298),heading = 285.3452758789,},
        {pos = vector3(-1315.546, -373.082, 36.23266),heading = 318.97570800782,},
    },
    message = "rends-toi sur le lieu de livraison.",
    message2 = "Livre la marchandise.",
    dict = "anim@mp_snowball",
    anim = "pickup_snowball",
    prop = "prop_rub_boxpile_08",
    FinalMessage = "Mission terminé!\nGain: ~g~",
}


conv = {
    npcName = "convoi",
    npcDisplay = "Gérant des transport",
    veh = "mule2",
    spawn = {
        {pos = vector3(-284.6002, -2646.772, 6.25702),heading = 45.587936401368,},
        {pos = vector3(-286.4492, -2649.716, 6.250728),heading = 44.088104248046,},
        {pos = vector3(-288.6062, -2652.196, 6.249616),heading = 45.743087768554,},
        {pos = vector3(-291.0048, -2654.062, 6.252062),heading = 44.786964416504,},
        {pos = vector3(-293.3874, -2656.504, 6.251442),heading = 46.17488861084,},
        {pos = vector3(-295.475, -2658.704, 6.25149),heading = 45.350456237792,},
        {pos = vector3(-297.7352, -2660.768, 6.252134),heading = 45.946235656738,},
        {pos = vector3(-300.0808, -2663.236, 6.251702),heading = 45.96304321289,},
        {pos = vector3(-302.4226, -2665.31, 6.25286),heading = 43.147903442382,},
    },
    PointArriver = vector3(2685.912, 3456.292, 56.00394),
    message = "Dirige toi sur le lieu de livraison.",
    message2 = "Garre toi à l'endroit indiqué",
    FinalMessage = "Mission terminé!\nGain: ~g~",
    message3 = "Retourne parler au chef de transport pour relancer une livraison.",
    earning = 760,
    stocks = "core:AddStocks",
    request = "core:SendStocksToClient",
    addstocks = "core:UpdateStocks",
}


JobsData = {
    staff = {
        {label = "Aucun groupe", group = "user"},
        {label = "Modérateur", group = "mod"},
        {label = "Remboursement", group = "remb"},
        {label = "Fondateur", group = "fonda"},
        {label = "Developpeur", group = "dev"},
    },
    drusilla = {
        mission = {
            item = "Pizza simple",
            price = 17,
        },
        craft = {
            {
                nom = "Pizza simple", 
                itemName = "pizza",
                desc = "Ingrédient: pâte à pizza 1, 2 Oignons, 1 coulis de tomate, 1 fromage.",
                ingredient = {
                    {label = "Pâte à pizza", count = 1},
                    {label = "Coulis de tomate", count = 1},
                    {label = "Fromage", count = 1},
                }
            },
            {
                nom = "Pizza 3 fromages", 
                itemName = "pizza",
                desc = "Ingrédient: pâte à pizza 1, 2 Oignons, 1 coulis de tomate, 3 fromage.",
                ingredient = {
                    {label = "Pâte à pizza", count = 1},
                    {label = "Coulis de tomate", count = 1},
                    {label = "Fromage", count = 3},
                }
            }
        }
    },
    Crucial = {
        mission = {
            item = "Sandwich simple",
            price = 19,
        },
        craft = {
            {
                nom = "Sandwich simple", 
                itemName = "sandwich",
                desc = "Ingrédient: Tranche de jambon 2, 2 tomate, 1 Pain à sandwich",
                ingredient = {
                    {label = "Tranche de jambon", count = 2},
                    {label = "Tomate", count = 1},
                    {label = "Pain à sandwich", count = 1},
                }
            },
            {
                nom = "Sandwich poulet: César (halal)", 
                itemName = "sandwich2",
                desc = "Ingrédient: Pain à sandwich 1, Poulet 1, Parmasan 1, Salade 1",
                ingredient = {
                    {label = "Pain à sandwich", count = 1},
                    {label = "Poulet", count = 1},
                    {label = "Parmasan", count = 1},
                    {label = "Salade", count = 1},
                }
            },
            {
                nom = "Sandwich Thon (Le pécheur)", 
                itemName = "sandwich3",
                desc = "Ingrédient: Pain à sandwich 1, Thon 1, Salade 1",
                ingredient = {
                    {label = "Pain à sandwich", count = 1},
                    {label = "Thon", count = 1},
                    {label = "Salade", count = 1},
                }
            },
            {
                nom = "Sandwich vegan (Veggie)", 
                itemName = "sandwich4",
                desc = "Ingrédient: Pain à sandwich 1, Avocat 1, Quinoa 1, Tomate 1",
                ingredient = {
                    {label = "Pain à sandwich", count = 1},
                    {label = "Avocat", count = 1},
                    {label = "Quinoa", count = 1},
                    {label = "Tomate", count = 1},
                }
            },
            {
                nom = "Sandwich saucisson: (Le frenchie)", 
                itemName = "sandwich5",
                desc = "Ingrédient: Pain à sandwich 1, Saucisson 1, Salade 1",
                ingredient = {
                    {label = "Pain à sandwich", count = 1},
                    {label = "Saucisson", count = 1},
                    {label = "Salade", count = 1},
                }
            },
        }
    }
}

events = {
    giveMoney = "rF:AddMoney",
    give = "rF:GiveItem",
    Exhange = "rF:ExhangeItem",
    sell = "rF:SellItem",
    remove = "rF:RemoveItem",
    AddIf = "rF:AddItemIfNotAlreadyHave",
    AddVeh = "core:SaveVehToGarage",
    GenPlate = "core:GeneratePlate",
    Transfer = "rF:TransferItemIfTargetCanHoldIt",
    TransferReverse = "rF:TransferItemIfTargetCanHoldItReverse",
    rename = "rF:RenameItem",
    resetRename = "rF:ResetRenameItem",
    repair = "core:Repair",
    sendMsg = "core:SendMsgToPlayer",
    gotop = "core:GotoPlayer",
    bring = "core:BringPlayer",
    ban = "rF:BanPlayer",
    kick = "rF:KickPlayer",
    GetInv = "rF:GetPlayerInventory",
    GetAccs = "rF:GetPlayerAccounts",
    Service = "core:SetServiceStatus",
    escort = "core:EscortPlayer",
    OtherPdata = "rF:GetOtherPlayerData",
    cuff = "core:CuffPlayer",
    tig = "core:DoTig",
    changeJob = "rF:ChangeOtherPlayerJob",
    BuyIf = "rF:BuyItemIfCan",
    ResetDeath = "core:ResetDeathStatus",
    SetDeath = "core:SetPlayerDeathStatus",
    statusLSPD = "core:SetVehStatusLSPD",
    rmvStatusLSPD = "core:RemoveVehStatusLSPD",
    fourriereLspdVehCb = "core:GetAllLspdVeh",
    addSociety = "rF:AddSocietyMoney",
    GiveMtoPlayer = "rF:GiveMoneyToPlayer",
    giveFactue = "core:SendFacture",
    facturePay = "core:PayFacture",
    facturePaySociety = "rF:PaySociety",
    facturePaySociety2 = "core:PayFactureSociety",
    cantPayFacture = "core:CantPayFacture",
    cancelFacture = "core:CancelFacture",
    giveMtoPlayerId = "rF:AddMoneyToPlayer",
    checkPlate = "core:lspdCheckPlate",
    group = "rF:ChangePlayerGroup",
    staffmod = "rF:Staffmod",
    inVeh = "core:PutInVeh",
    outVeh = "core:PutOutVeh",
    clearObjects = "core:ClearAreaFromObjects",
}
 

local RequestCache = {}

RegisterNetEvent("core:RequestGameData")
AddEventHandler("core:RequestGameData", function(token)
    if not exports.rFramework:CheckToken(token, source, "RequestGameData") then return end
    if RequestCache[source] ~= nil then 
        exports.rFramework:AddPlayerLog(source, "Requesting twice game Data", 6)
    end
    RequestCache[source] = true
    TriggerClientEvent("core:RequestGameData", source, JobsData, events, mine, hunt, armory, weed, JobMission, conv)
end)
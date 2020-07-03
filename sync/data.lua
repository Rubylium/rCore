

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

    earning = 14.0,

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
        {label = "Batte De Baseball",           item = "batte",     prop = "w_me_bat",                  price = 3500, vip = false},
        {label = "Couteau",                     item = "knife",     prop = "prop_w_me_knife_01",        price = 3000, vip = false},
        {label = "Tazer",                       item = "tazer",     prop = "w_pi_stungun",              price = 7500, vip = false},
        {label = "Couteau de poche à cran",     item = "knifeVip",  prop = "w_me_knife_01",             price = 3000, vip = true},
        {label = "Club de golf",                item = "golf",      prop = "w_me_gclub",                price = 4500, vip = true},
        {label = "Machette",                    item = "machette",  prop = "prop_ld_w_me_machette",     price = 3800, vip = true},
        {label = "Hache",                       item = "hache",     prop = "w_me_hatchet",              price = 3750, vip = true},
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
    plante = 10,
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

    prep1item = "weedak47",
    prep1label = "Canabis type AK47",

    prep2item = "whitewidow",
    prep2label = "Canabis type WhiteWidow",

    prep3item = "ogkush",
    prep3label = "Canabis type Og Kush",


    mission = {
        item = "Canabis de bonne qualité",
        price = 25,
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
    earning = 460,
    stocks = "core:AddStocks",
    request = "core:SendStocksToClient",
    addstocks = "core:UpdateStocks",
}


JobsData = {
    general = {
        AimAnim = {
            {label = "Par défaut", anim = "Default", int = 0},
            {label = "Gang style", anim = "Gang1H", int = 1},
        },
        tp = {
            {from = vector3(2476.166, -384.1718, 94.40146), to = vector3(439.7326, 4823.042, -58.99958), label = "entrer dans le gouvernement"},
            {from = vector3(439.7326, 4823.042, -58.99958), to = vector3(2476.166, -384.1718, 94.40146), label = "sortir du gouvernement"},
        },
    },
    lspd = {
        radio = {
            {code = "10-19", label = "Retour commissariat", pos = false},
            {code = "10-20", label = "Position de l'agent", pos = true},
            {code = "10-31", label = "Poursuite en cours", pos = true},
            {code = "10-41", label = "Début de patrouille", pos = false},
            {code = "10-42", label = "Fin de patrouille", pos = false},
            {code = "10-99", label = "Toutes les unités sur la position", pos = true},
        }
    },
    staff = {
        {label = "Aucun groupe", group = "user"},
        {label = "Modérateur", group = "mod"},
        {label = "Remboursement", group = "remb"},
        {label = "Fondateur", group = "fonda"},
        {label = "Developpeur", group = "dev"},
    },
    superette = {
        {pos = vector3(29.1523, -1339.914, 29.49702),heading = 278.76934814454, job = "police"},
        {pos = vector3(-43.91654, -1749.338, 29.42102),heading = 141.21952819824, job = "police"},
        {pos = vector3(-1219.66, -915.3108, 11.3263),heading = 49.730266571044, job = "police"},
        {pos = vector3(-1479.56, -374.222, 39.16334),heading = 206.7963104248, job = "police"},
        {pos = vector3(1126.546, -981.6112, 45.41588),heading = 36.31362915039, job = "police"},
        {pos = vector3(378.4374, 332.906, 103.5664),heading = 254.18759155274, job = "police"},
        {pos = vector3(1159.926, -314.9232, 69.20504),heading = 71.328224182128, job = "police"},
        {pos = vector3(2549.948, 384.8386, 108.623),heading = 324.6224975586, job = "police"},

        {pos = vector3(2674.042, 3286.612, 55.24112),heading = 331.26135253906, job = "sheriff"},
        {pos = vector3(2674.042, 3286.612, 55.24112),heading = 331.26135253906, job = "sheriff"},
        {pos = vector3(1959.518, 3748.47, 32.34374),heading = 309.29452514648, job = "sheriff"},
        {pos = vector3(1734.78, 6420.25, 35.03722),heading = 246.17741394042, job = "sheriff"},
        {pos = vector3(-3047.342, 586.1912, 7.908926),heading = 35.10389328003, job = "sheriff"},
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
                desc = "Ingrédient: pâte à pizza 1, 1 coulis de tomate, 1 fromage.",
                ingredient = {
                    {label = "Pâte à pizza", count = 1},
                    {label = "Coulis de tomate", count = 1},
                    {label = "Fromage", count = 1},
                }
            },
            {
                nom = "Pizza 3 fromages", 
                itemName = "pizzafromage",
                desc = "Ingrédient: pâte à pizza 1, 1 coulis de tomate, 3 fromage.",
                ingredient = {
                    {label = "Pâte à pizza", count = 1},
                    {label = "Coulis de tomate", count = 1},
                    {label = "Fromage", count = 3},
                }
            },
            {
                nom = "Pasta Bolognese", 
                itemName = "patteBolo",
                desc = "Ingrédient: Tomate 1, pâte à pizza 1.",
                ingredient = {
                    {label = "Pâte à pizza", count = 1},
                    {label = "Tomate", count = 1},
                }
            },
            {
                nom = "Bouteille d'eau", 
                itemName = "eau",
                desc = "Ingrédient: 1 Bouteille vide",
                ingredient = {
                    {label = "Bouteille vide", count = 1},
                }
            },
            {
                nom = "Nespresso", 
                itemName = "cafe",
                desc = "Ingrédient: Aucun",
                ingredient = {
                    --{label = "Bouteille vide", count = 1},
                }
            },
            {
                nom = "Vin", 
                itemName = "vin",
                desc = "Ingrédient: 1 Bouteille vide",
                ingredient = {
                    {label = "Bouteille vide", count = 1},
                }
            },
            {
                nom = "Tiramisù", 
                itemName = "tiramisu",
                desc = "Ingrédient: 1 pain de cuisine, 1 fromage",
                ingredient = {
                    {label = "Pain de cuisine", count = 1},
                    {label = "Fromage", count = 1},
                }
            },
            {
                nom = "Panna Cotta", 
                itemName = "pannacotta",
                desc = "Ingrédient: 1 fromage",
                ingredient = {
                    {label = "Fromage", count = 1},
                }
            },
        }
    },
    hotdog = {
        mission = {
            item = "Hotdog simple",
            price = 17,
        },
        craft = {
            {
                nom = "Hotdog simple", 
                itemName = "hotdog",
                desc = "Ingrédient: Saucisse 1, 1 Pain à sandwich",
                ingredient = {
                    {label = "Saucisse", count = 1},
                    {label = "Pain à sandwich", count = 1},
                }
            },
            {
                nom = "Tacos", 
                itemName = "tacos",
                desc = "Ingrédient: 1 Tortilla, 2 Viande de cuisine, 1 Sauce",
                ingredient = {
                    {label = "Tortilla", count = 1},
                    {label = "Viande de cuisine", count = 2},
                    {label = "Sauce", count = 1},
                }
            },
            {
                nom = "Kebab", 
                itemName = "kebab",
                desc = "Ingrédient: 1 Pain à sandwich, 2 Viande de cuisine, 1 Sauce",
                ingredient = {
                    {label = "Pain à sandwich", count = 1},
                    {label = "Viande de cuisine", count = 2},
                    {label = "Sauce", count = 1},
                }
            },
            {
                nom = "Bouteille d'eau", 
                itemName = "eau",
                desc = "Ingrédient: 1 Bouteille vide",
                ingredient = {
                    {label = "Bouteille vide", count = 1},
                }
            },
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
            {
                nom = "Bouteille d'eau", 
                itemName = "eau",
                desc = "Ingrédient: 1 Bouteille vide",
                ingredient = {
                    {label = "Bouteille vide", count = 1},
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
    GiveDirtyMtoplayer = "rF:GiveDirtyMoneyToPlayer",
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
    askId = "core:AskForIdentity",
    radioCall = "core:SendRadioCall",
    DelVehFromGarage = "core:DelVehToGarage",
    StaffGiveMoney = "rF:AddMoneyStaff",
    StaffGiveBanque = "rF:AddBankMoneyStaff",
    washM = "rF:WashMoneyOnSociety",
    fourriere = "core:GetVehInFourriere",
    GiveDirty = "rF:GiveDirtyMoney",
    GiveDirtyToId = "rF:GiveDirtyMoneyToId",
    rmvMoney = "rF:RemoveMoney", 
    actionText = "3dme:shareDisplay",
    DelEntity = "DeleteEntity",
    DelEntityTable = "DeleteEntityTable",
    mTOb = "rF:MoveMoneyToBank",
    bTOm = "rF:MoveMoneyFromBankToPlayer",
    CallTake = "core:TakeCall",
    RegCall = "core:RegisterCall",
    SendLspdCall = "core:GetLspdCall",
    GetSocInfo = "rF:GetSocietyInfos",
    RmvSocMoney = "rF:RemoveSocietyMoney",
    EndTig = "core:EndTig",
    Opensomething = "core:OpenSomething",
    OpenVeh = "core:OpenVehicle",
    GoInTig = "core:DoTig",
    rmvVehInvStatus = "core:RemoveChestStatus",
    GetPlayersList = "core:pList",
    ShowIdCardToOther = "core:ShowIdentityCardToOther",
    Changeidentity = "rF:ChangePlayerIdentity",
    resetJob = "rF:ResetPlayerJob",
    takeMFromSoc = "rF:TakeMoneyFromSociety",
    ChangePGrade = "rF:ChangePlayerJobGrade",
    ItemToSoc = "rF:TransferItemFromInvToSociety",
    SocToInv = "rF:TransferItemFromSocietyToInv",
    DoorStatus = "core:ChangeDoorStatus",
    DoubleDoorStatus = "core:ChangeDoubleDoorStatus",
    SendTOWeb = "SendCoordToWeb",
    OpenHood = "core:OpenVehHood",
    GetVehInv = "core:GetVehicleInventory",
    AddToVeh = "core:AddItemToVeh",
    RmvFromVeh = "core:RemoveItemFromVeh",
    CloseVeh = "core:CloseVeh",
    GetPVehs = "core:GetPlayersVehicle",
    SetVehStatus = "core:SetVehStatus",
    GoToGarage = "core:GetBackToGarage", 
    GetNumPlayers = "core:AskNumPlayers",
    CheckData = "rF:CheckIfJobIsValid",
    Death = "rF:LogPlayerDeath",
    StartSup = "core:CheckIfCanStartSup",
    CarrySync = "core:CarryPeople:sync",
    CarryStop = "core:CarryPeople:stop",
    AskSyndDoors = "core:AskingDoorSync",
    rmvDirty = "rF:RemoveDirtyMoney",
    VehInvSync = "core:SyncInvMoney",
    AttachVeh = "core:AttachVeh",
}

doords = {
    {
        status = true,
        double = true,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {
            {pos = vector3(-440.81521606445, 6007.4604492188,31.871360778809), model = -2023754432, heading = 135.43254089355,},
            {pos = vector3(-442.65530395508, 6009.2998046875,31.871360778809), model = -2023754432, heading = 315.50006103516,},
        }   
    },

    {
        status = true,
        double = true,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {
            {pos = vector3(-442.85778808594, 6010.9580078125,31.865228652954), model = -2023754432, heading = 44.56713104248,},
            {pos = vector3(-441.01849365234, 6012.794921875,31.865228652954), model = -2023754432, heading = 225.32643127441,},
        }
    },

    {
        status = true,
        double = true,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {
            {pos = vector3(-447.72830200195, 6006.7016601563,31.865228652954), model = -2023754432, heading = 135.00006103516},
            {pos = vector3(-449.56558227539, 6008.5380859375,31.865228652954), model = -2023754432, heading = 315.01040649414},
        }
    },

    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-454.04354858398, 6010.2426757813,31.861061096191), model = -2023754432, heading = 44.999935150146},
    },

    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-437.04159545898, 6003.7045898438,31.868148803711), model = 749848321, heading = 135.00006103516},
    },

    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-450.96636962891, 6006.0864257813,31.990036010742), model = -2023754432, heading = 135.00006103516},
    },

    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-447.23629760742, 6002.3168945313,31.840034484863), model = -2023754432, heading = 315.59310913086},
    },

    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-438.22802734375, 6006.1665039063,28.135578155518), model = -1927754726, heading = 44.999965667725},
    },

    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-442.10824584961, 6010.0517578125,28.135578155518), model = -1927754726, heading = 44.999965667725},
    },

    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-444.36822509766, 6012.22265625,28.135578155518), model = -1927754726, heading = 44.999965667725},
    },

    {
        status = true,
        double = true,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {
            {pos = vector3(-434.67764282227, 6009.6801757813,28.1383934021), model = -1320876379, heading = 45.000015258789},
            {pos = vector3(-436.51574707031, 6007.84375,28.1383934021), model = -1320876379, heading = 225.0001373291},
        }
    },

    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-436.62759399414, 6002.5483398438,28.140621185303), model = 749848321, heading = 45.000015258789},
    },

    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-433.93756103516, 6005.2778320313,28.140621185303), model = 749848321, heading = 225.0001373291},
    },



    -- SANDY SHORE BCSO

    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(1855.708984375, 3683.9328613281,34.593639373779), model = -1765048490, heading = 29.409164428711},
    },

    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(1858.1571044922, 3699.1364746094,34.546348571777), model = 1526539404, heading = 210.00016784668},
    },

    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(1844.2640380859, 3694.1518554688,34.416557312012), model = -519068795, heading = 299.6628112793},
    },

    {
        status = true,
        double = true,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {
            {pos = vector3(1851.2879638672, 3681.8701171875,34.416557312012), model = -2023754432, heading = 120.43684387207},
            {pos = vector3(1849.9820556641, 3684.1149902344,34.416557312012), model = -2023754432, heading = 299.86767578125},
        }
    },

    {
        status = true,
        double = true,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {
            {pos = vector3(1847.1330566406, 3689.9460449219,34.418418884277), model = -2023754432, heading = 29.143821716309},
            {pos = vector3(1849.4000244141, 3691.2060546875,34.418418884277), model = -2023754432, heading = 209.06301879883},
        }
    },


    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(1852.9210205078, 3686.4069824219,30.413888931274), model = 749848321, heading = 29.874879837036},
    },

    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(1856.1600341797, 3688.2680664063,30.413888931274), model = 749848321, heading = 29.874879837036},
    },


    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(1859.6965332031, 3686.6442871094,30.409215927124), model = 631614199, heading = 299.99990844727},
    },

    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(1858.9982910156, 3694.9365234375,30.409215927124), model = 631614199, heading = 300.00003051758},
    },

    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(1860.8978271484, 3691.6433105469,30.409215927124), model = 631614199, heading = 300.00003051758},
    },

    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(1862.7633056641, 3688.4138183594,30.409215927124), model = 631614199, heading = 300.00003051758},
    },



    -- VESPUCCI


    {
        status = true,
        double = true,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {
            {pos = vector3(-1093.1550292969, -819.28381347656,19.186269760132), model = -1255368438, heading = 217.1043548584},
            {pos = vector3(-1091.1040039063, -817.72540283203,19.186269760132), model = -1255368438, heading = 37.374889373779},
        }
    },


    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-1077.8118896484, -830.57299804688,19.198949813843), model = -147325430, heading = 37.568542480469},
    },

    {
        status = true,
        double = true,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {
            {pos = vector3(-1099.3489990234, -834.56329345703,19.152320861816), model = -1255368438, heading = 127.29434967041},
            {pos = vector3(-1097.7839355469, -836.60949707031,19.152980804443), model = -1255368438, heading = 307.2317199707},
        }
    },

    {
        status = true,
        double = true,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {
            {pos = vector3(-1095.5549316406, -843.47827148438,19.150720596313), model = -1255368438, heading = 127.34727478027},
            {pos = vector3(-1093.9899902344, -845.52502441406,19.150720596313), model = -1255368438, heading = 307.44747924805},
        }
    },


    {
        status = true,
        double = true,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {
            {pos = vector3(-1094.0969238281, -816.2119140625,5.6305637359619), model = -2023754432, heading = 307.44747924805},
            {pos = vector3(-1092.5198974609, -818.27398681641,5.6305637359619), model = -2023754432, heading = 127.34727478027},
        }
    },

    {
        status = true,
        double = true,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {
            {pos = vector3(-1090.7269287109, -836.03729248047,5.6320953369141), model = -2023754432, heading = 127.57680511475},
            {pos = vector3(-1092.3039550781, -833.97570800781,5.6320953369141), model = -2023754432, heading = 307.82446289063},
        }
    },

    {
        status = true,
        double = true,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {
            {pos = vector3(-1066.1119384766, -827.07928466797,5.6305637359619), model = -2023754432, heading = 307.44747924805},
            {pos = vector3(-1064.5360107422, -829.14050292969,5.6305637359619), model = -2023754432, heading = 127.34727478027},
        }
    },


    {
        status = true,
        double = true,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {
            {pos = vector3(-1066.1119384766, -827.07928466797,5.6305637359619), model = -2023754432, heading = 307.44747924805},
            {pos = vector3(-1064.5360107422, -829.14050292969,5.6305637359619), model = -2023754432, heading = 127.34727478027},
        }
    },


    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-1073.5805664063, -827.48541259766,5.6305637359619), model = 631614199, heading = 217.55847167969},
    },
    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-1087.7518310547, -829.87469482422,5.6305637359619), model = 631614199, heading = 217.1043548584},
    },
    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-1085.8259277344, -827.83862304688,5.6305637359619), model = 631614199, heading = 307.44747924805},
    },
    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-1088.796875, -830.25329589844,5.6305637359619), model = 631614199, heading = 307.44747924805},
    },
    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-1091.1400146484, -827.00054931641,5.6305637359619), model = 631614199, heading = 307.44747924805},
    },
    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-1088.2309570313, -824.77227783203,5.6305637359619), model = 631614199, heading = 307.44747924805},
    },
    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-1093.5518798828, -823.85827636719,5.6305637359619), model = 631614199, heading = 307.44747924805},
    },
    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-1090.6400146484, -821.62750244141,5.6305637359619), model = 631614199, heading = 307.44747924805},
    },
    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-1095.95703125, -820.72540283203,5.6305637359619), model = 631614199, heading = 307.44747924805},
    },
    {
        status = true,
        double = false,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {pos = vector3(-1070.7868652344, -834.05194091797,5.6303462982178), model = -147325430, heading = 127.51894378662},
    },


    {
        status = true,
        double = true,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {
            {pos = vector3(-1091.0390625, -846.67645263672,5.0412549972534), model = -2023754432, heading = 307.44747924805},
            {pos = vector3(-1089.4630126953, -848.73852539063,5.0412549972534), model = -2023754432, heading = 127.34727478027},
        }
    },

    {
        status = true,
        double = true,
        job = {["police"] = true, ["sheriff"] = true},
        pos = {
            {pos = vector3(-1056.7559814453, -839.11529541016,5.3037819862366), model = -2023754432, heading = 217.07241821289},
            {pos = vector3(-1058.8229980469, -840.68780517578,5.3041172027588), model = -2023754432, heading = 36.76390838623},
        }
    },

    {
        status = true,
        double = false,
        job = {["drusilla"] = true},
        pos = {pos = vector3(290.77651977539, -964.37573242188,29.682369232178), model = 774795636, heading = 180.14141845703},
    },

    {
        status = true,
        double = false,
        job = {["hotdogs"] = true},
        pos = {pos = vector3(39.562496185303, -1006.3271484375,29.464735031128), model = 661129475, heading = 69.947204589844},
    },

    {
        status = true,
        double = false,
        job = {["bestbuds"] = true},
        pos = {pos = vector3(381.42156982422, -825.16284179688,29.45322227478), model = -538477509, heading = 180.00003051758},
    },
}


RegisterNetEvent("core:AskingDoorSync")
AddEventHandler("core:AskingDoorSync", function()
    TriggerClientEvent("core:SyncDoors", source, doords)
end)
 

local RequestCache = {}

RegisterNetEvent("core:RequestGameData")
AddEventHandler("core:RequestGameData", function()
    if RequestCache[source] ~= nil then 
        exports.rFramework:AddPlayerLog(source, "Requesting twice game Data", 6)
    end
    RequestCache[source] = true
    local items = exports.rFramework:GetItems()
    TriggerClientEvent("core:RequestGameData", source, JobsData, events, mine, hunt, armory, weed, JobMission, conv, items, doords)
end)
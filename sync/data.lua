

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
        {label = "Tazer", item = "tazer", prop = "w_pi_stungun", price = 1000},
    },
    camType = "DEFAULT_SCRIPTED_CAMERA",

    zone = {
        {pos = vector3(21.40687, -1106.694, 29.79703),heading = 341.06161499023,},
        {pos = vector3(810.8315, -2157.479, 29.61902),heading = 185.2163848877,},
        {pos = vector3(1693.104, 3759.528, 34.70536),heading = 48.778507232666,},
    },

    fov = 65.0,
    oCoords = {0.0, 1.0, 0.0},
    CoordToPoint = {0.8, 0.0, 0.3},
}

weed = {
    props = {
        [30] = "bkr_prop_weed_01_small_01c",
        [40] = "bkr_prop_weed_01_small_01b",
        [50] = "bkr_prop_weed_01_small_01a",
        [60] = "bkr_prop_weed_med_01a",
        [70] = "bkr_prop_weed_med_01b",
        [80] = "bkr_prop_weed_lrg_01a",
        [90] = "bkr_prop_weed_lrg_01b",
    }
}

events = {
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
}
 

local RequestCache = {}

RegisterNetEvent("core:RequestGameData")
AddEventHandler("core:RequestGameData", function(token)
    if not exports.rFramework:CheckToken(token, source, "RequestGameData") then return end
    if RequestCache[source] ~= nil then 
        exports.rFramework:AddPlayerLog(source, "Requesting twice game Data", 6)
    end
    RequestCache[source] = true
    TriggerClientEvent("core:RequestGameData", source, events, mine, hunt, armory, weed)
end)
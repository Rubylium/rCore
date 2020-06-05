

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
    }
}


RegisterNetEvent("core:RequestGameData")
AddEventHandler("core:RequestGameData", function(token)
    if not exports.rFramework:CheckToken(token, source, "RequestGameData") then return end

    TriggerClientEvent("core:RequestGameData", source, mine, hunt)
end)
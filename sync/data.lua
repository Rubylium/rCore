

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


RegisterNetEvent("core:RequestGameData")
AddEventHandler("core:RequestGameData", function(token)
    if not exports.rFramework:CheckToken(token, source, "RequestGameData") then return end

    TriggerClientEvent("core:RequestGameData", source, mine)
end)
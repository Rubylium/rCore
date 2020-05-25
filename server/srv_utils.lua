
RegisterNetEvent("DeleteEntity")
AddEventHandler("DeleteEntity", function(list)
    local entity = NetworkGetEntityFromNetworkId(list)
    Citizen.InvokeNative(`DELETE_ENTITY` & 0xFFFFFFFF, entity)
end)


RegisterNetEvent("DeleteEntityTable")
AddEventHandler("DeleteEntityTable", function(list)
    for k,v in pairs(list) do
        local entity = NetworkGetEntityFromNetworkId(v)
        Citizen.InvokeNative(`DELETE_ENTITY` & 0xFFFFFFFF, entity)
    end
end)
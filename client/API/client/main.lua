Citizen.CreateThread(function()
    Citizen.Wait(1000)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    while true do
        Citizen.Wait(2500)
        ped = PlayerPedId()
        pos = GetEntityCoords(ped)
        SendNUIMessage({
            status = "position",
            x = pos.x,
            y = pos.y,
            z = pos.z
        })
    end
end)
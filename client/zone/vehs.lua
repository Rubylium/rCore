local vehs = {}
local gouvNoSiren = {
    {pos = vector3(2551.884, -390.4844, 92.3184),heading = 12.871458053588,},
    {pos = vector3(2540.724, -378.113, 92.31848),heading = 165.84362792968,},
    {pos = vector3(2553.17, -396.8522, 92.31826),heading = 196.08569335938,},
    {pos = vector3(2538.454, -396.8774, 92.31886),heading = 194.07237243652,},
    {pos = vector3(2545.936, -372.0504, 92.31816),heading = 347.54592895508,},
    {pos = vector3(2555.568, -361.6758, 92.3187),heading = 200.35835266114,},
    {pos = vector3(2551.82, -361.6336, 92.31888),heading = 17.465473175048,},
    {pos = vector3(2555.556, -390.3424, 92.31858),heading = 191.8544921875,},
    {pos = vector3(2536.916, -378.589, 92.31846),heading = 346.3942565918,},
    {pos = vector3(2544.344, -389.9304, 92.31822),heading = 11.723843574524,},
    {pos = vector3(2540.762, -390.2292, 92.3183),heading = 10.291779518128,},
}

local gouvSiren = {
    {pos = vector3(2600.536, -302.6828, 92.07756),heading = 150.7233581543,},
    {pos = vector3(2557.446, -283.966, 92.31794),heading = 274.59246826172,},
    {pos = vector3(2542.484, -304.2578, 92.31822),heading = 259.78918457032,},
    {pos = vector3(2566.194, -608.9848, 64.107),heading = 307.76123046875,},
    {pos = vector3(2578.614, -603.996, 65.06252),heading = 325.6604309082,},
    {pos = vector3(2579.914, -581.6502, 66.22732),heading = 272.63098144532,},
}


function GetRandomModel()
    local models = {"fpiuleg3","police4","fbi","fbi2","taholeg3","chargleg4"}
    local r = models[math.random(1,#models)]
    return r
end

Citizen.CreateThread(function()
    for k,v in pairs(gouvNoSiren) do
        table.insert(vehs, {model = GetRandomModel(), pos = v.pos, heading = v.heading, livery = 1, LoadDst = 150, siren = false})
    end

    for k,v in pairs(gouvSiren) do
        table.insert(vehs, {model = "fpiuleg3", pos = v.pos, heading = v.heading, livery = 1, LoadDst = 150, siren = true})
    end

end)


Citizen.CreateThread(function()
    Wait(1000)
    while true do
        local pCoords = GetEntityCoords(pPed)
        for _,v in pairs(vehs) do
            local dst = GetDistanceBetweenCoords(v.pos, pCoords, true)
            if not v.spawned then
                if dst <= v.LoadDst then
                    v.spawned = true
                    rUtils.LoadModel(GetHashKey(v.model))
                    v.entity = CreateVehicle_(v.model, v.pos.x, v.pos.y, v.pos.z, v.heading, false, 1)
                    SetVehicleOnGroundProperly(v.entity)
                    FreezeEntityPosition(v.entity, true)
                    SetEntityInvincible(v.entity, true)
                    if v.siren then
                        SetVehicleSiren(v.entity, true)
                        SetVehicleHasMutedSirens(v.entity, 1)
                        SetVehicleEngineOn(v.entity, 1, 1, 1)
                    end
                    SetVehicleLivery(v.entity, v.livery)
                    SetVehicleDoorsLocked(v.entity, 2)
                    SetVehicleColours(v.entity, 12, 12)
                    SetVehicleDirtLevel(v.entity, 0.0)
                    for i = 1,9 do
                        SetVehicleExtra(v.entity, i, false)
                    end
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
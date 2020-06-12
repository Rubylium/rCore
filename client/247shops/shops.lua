shops = {
    {
        name = "24/7",
        pos = vector3(25.6, -1346.82, 29.49),
        type = 1,
        items = {
            {item="chips", price=5},
            {item="coca", price=4},
        },
    },
    {
        name = "24/7",
        pos = vector3(2678.0, 3280.8, 55.24),
        type = 1,
        items = {
            {item="chips", price=5},
            {item="coca", price=4},
        },
    },
    {
        name = "24/7",
        pos = vector3(-1222.9, -907.3, 12.3),
        type = 1,
        items = {
            {item="chips", price=5},
            {item="coca", price=4},
        },
    },
    {
        name = "24/7",
        pos = vector3(373.7816, 326.2924, 103.5664),
        type = 1,
        items = {
            {item="chips", price=5},
            {item="coca", price=4},
        },
    },
    {
        name = "24/7",
        pos = vector3(2557.25, 382.1388, 108.623),
        type = 1,
        items = {
            {item="chips", price=5},
            {item="coca", price=4},
        },
    },
    {
        name = "24/7",
        pos = vector3(-92.75452, 6409.736, 31.64036),
        type = 1,
        items = {
            {item="chips", price=5},
            {item="coca", price=4},
        },
    },
    {
        name = "24/7",
        pos = vector3(1135.652, -982.3264, 46.4158),
        type = 1,
        items = {
            {item="chips", price=5},
            {item="coca", price=4},
        },
    },

    {
        name = "LTD",
        pos = vector3(-707.4, -914.2, 19.2),
        type = 2,
        items = {
            {item="chips", price=5},
            {item="coca", price=4},
            {item="phone", price=250},
        },
    },
    {
        name = "LTD",
        pos = vector3(1698.33, 4924.29, 42.06),
        type = 2,
        items = {
            {item="chips", price=5},
            {item="coca", price=4},
            {item="phone", price=250},
        },
    },
    {
        name = "LTD",
        pos = vector3(-48.24798, -1757.722, 29.42102),
        type = 2,
        items = {
            {item="chips", price=5},
            {item="coca", price=4},
            {item="phone", price=250},
        },
    },
}


Citizen.CreateThread(function()
    for k,v in pairs(shops) do
        local blip = AddBlipForCoord(v.pos)
        SetBlipSprite(blip, 1)
        SetBlipScale(blip, 0.50)
        if v.name == "LTD" then
            SetBlipColour(blip, 7)
        else
            SetBlipColour(blip, 2)
        end
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.name)
        EndTextCommandSetBlipName(blip)
    end
end)
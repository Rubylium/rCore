



Citizen.CreateThread(function()
    while not pCallBack do Wait(100) end
    local garages = {
        {
            pos = vector3(120.6806, 6622.774, 31.96991),
            data = {
                {pos = vector3(117.9298, 6599.395, 31.40755),heading = 271.32855224609,},
                {pos = vector3(121.9947, 6594.794, 31.41176),heading = 270.96411132813,},
                {pos = vector3(126.7708, 6590.344, 31.34448),heading = 267.72909545898,},
                {pos = vector3(132.3887, 6585.309, 31.35268),heading = 274.00952148438,},
                {pos = vector3(136.7639, 6580.479, 31.39783),heading = 271.72668457031,},
                {pos = vector3(142.3938, 6575.349, 31.33323),heading = 270.95123291016,},
                {pos = vector3(155.8335, 6593.233, 31.23742),heading = 175.50523376465,},
                {pos = vector3(150.9768, 6597.097, 31.23766),heading = 181.81695556641,},
                {pos = vector3(146.0335, 6601.829, 31.24353),heading = 178.62594604492,},
                {pos = vector3(141.1229, 6606.654, 31.2378),heading = 181.04992675781,},
                {pos = vector3(155.861, 6602.261, 31.24899),heading = 1.820317864418,},
                {pos = vector3(150.7864, 6607.815, 31.26458),heading = 359.33923339844,},
                {pos = vector3(145.7525, 6613.215, 31.21004),heading = 0.1808530241251,},
            },
            action = function(data)
                OpenVehMenu(data)  
            end,
        },

        {
            pos = vector3(-1511.829, 4961.771, 61.8139),
            data = {
                {pos = vector3(-1521.875, 4955.539, 61.44278),heading = 236.18853759766,},
                {pos = vector3(-1524.705, 4952.645, 61.37847),heading = 234.06101989746,},
                {pos = vector3(-1527.953, 4950.425, 61.26377),heading = 232.99052429199,},
                {pos = vector3(-1531.526, 4947.739, 61.10568),heading = 233.94631958008,},
                {pos = vector3(-1533.839, 4944.537, 60.97757),heading = 231.0809173584,},
                {pos = vector3(-1537.275, 4941.808, 61.00565),heading = 230.04730224609,},
                {pos = vector3(-1539.895, 4939.232, 60.99895),heading = 231.5407409668,},
                {pos = vector3(-1542.105, 4936.488, 60.95233),heading = 230.22734069824,},
                {pos = vector3(-1544.707, 4933.545, 60.90494),heading = 230.71360778809,},
            },
            action = function(data)
                OpenVehMenu(data)  
            end,
        },
    }

    for k,v in pairs(garages) do
        rUtils.RegisterActionZone(v)
    end

end)
Citizen.CreateThread(function()
    DecorRegister("TRUCK_OPEN", 3)
end)

invByClass = {
    [0] = {place = 40}, -- 0 Compacts
    [1] = {place = 60}, -- 1 Sedans
    [2] = {place = 100}, -- 2 SUVs
    [3] = {place = 20}, -- 3 Coupes
    [4] = {place = 50}, -- 4 Muscle
    [5] = {place = 30}, -- 5 Sports Classics
    [6] = {place = 20}, -- 6 Sports
    [7] = {place = 15}, -- 7 Super
    [8] = {place = 1}, -- 8 Motorcycles
    [9] = {place = 50}, -- 9 Off-Road
    [10] = {place = 80}, -- 10 Industrial
    [11] = {place = 130}, -- 11 Utility
    [12] = {place = 150}, -- 12 Vans
    [13] = {place = 0}, -- 13 Cycles
    [14] = {place = 500}, -- 14 Boats
    [15] = {place = 30}, -- 15 Helicopters
    [16] = {place = 1500}, -- 16 Planes
    [17] = {place = 80}, -- 17 Service
    [18] = {place = 150}, -- 18 Emergency
    [19] = {place = 150}, -- 19 Military
    [20] = {place = 350}, -- 20 Commercial

}


invByModel = {
    ["blista"] = {place = 20},
    ["brioso"] = {place = 15},
    ["dilettante"] = {place = 25},
    ["issi2"] = {place = 20},
    ["issi3"] = {place = 25},
    ["panto"] = {place = 10},
    ["prairie"] = {place = 25},
    ["rhapsody"] = {place = 20},


    ["cogcabrio"] = {place = 25},
    ["exemplar"] = {place = 25},
    ["f620"] = {place = 30},
    ["felon"] = {place = 25},
    ["felon2"] = {place = 25},
    ["jackal"] = {place = 25},
    ["oracle"] = {place = 20},
    ["oracle2"] = {place = 25},
    ["sentinel"] = {place = 25},
    ["sentinel2"] = {place = 30},
    ["windsor"] = {place = 30},
    ["windsor2"] = {place = 35},
    ["zion"] = {place = 25},
    ["zion2"] = {place = 30},


    ["blade"] = {place = 40},
    ["buccaneer"] = {place = 35},
    ["buccaneer2"] = {place = 40},
    ["chino"] = {place = 35},
    ["chino2"] = {place = 40},
    ["clique"] = {place = 40},
    ["coquette3"] = {place = 50},
    ["deviant"] = {place = 35},
    ["dominator"] = {place = 30},
    ["dominator2"] = {place = 40},
    ["dominator3"] = {place = 40},
    ["dukes"] = {place = 35},
    ["faction"] = {place = 35},
    ["faction2"] = {place = 40},
    ["faction3"] = {place = 40},
    ["ellie"] = {place = 40},
    ["gauntlet"] = {place = 35},
    ["gauntlet2"] = {place = 40},
    ["hermes"] = {place = 50},
    ["hotknife"] = {place = 30},
    ["hustler"] = {place = 40},
    ["impaler"] = {place = 30},
    ["impaler2"] = {place = 30},
    ["impaler3"] = {place = 30},
    ["impaler4"] = {place = 30},
    ["imperator"] = {place = 25},
    ["imperator2"] = {place = 25},
    ["imperator3"] = {place = 30},
    ["moonbeam"] = {place = 70},
    ["moonbeam2"] = {place = 70},


    ["PANAMERA17TURBO"] = {place = 35},
    ["370Z"] = {place = 20},
    ["A45"] = {place = 40},
    ["audiq8"] = {place = 50},
    ["17m760i"] = {place = 30},
    ["c63"] = {place = 30},
    ["CHARGERF8"] = {place = 10},
    ["CLS2015"] = {place = 25},
    ["demonhawk"] = {place = 55},
    ["pm19"] = {place = 40},
    ["S500W222"] = {place = 20},
    ["Templar"] = {place = 1},
    ["X6M"] = {place = 50},


    ["2020RS6"] = {place = 55},
    ["MLBRABUS"] = {place = 50},
    ["17bcs"] = {place = 25},
    ["911TURBOS"] = {place = 10},
    ["GTRC"] = {place = 10},
    ["APERTA"] = {place = 10},
    ["db11"] = {place = 13},
    ["aventadors"] = {place = 8},
    ["rmodi8mlb"] = {place = 15},
    ["divo"] = {place = 5},
    ["r8prior"] = {place = 12},
    ["F812"] = {place = 20},
    ["URUS"] = {place = 60},
    ["zentenario"] = {place = 5},
}


priceByClass = {
    [0] = {place = 1.0}, -- 0 Compacts
    [1] = {place = 1.2}, -- 1 Sedans
    [2] = {place = 1.6}, -- 2 SUVs
    [3] = {place = 2.3}, -- 3 Coupes
    [4] = {place = 2.4}, -- 4 Muscle
    [5] = {place = 3.5}, -- 5 Sports Classics
    [6] = {place = 4.0}, -- 6 Sports
    [7] = {place = 5.0}, -- 7 Super
    [8] = {place = 1.8}, -- 8 Motorcycles
    [9] = {place = 2.2}, -- 9 Off-Road
    [10] = {place = 3.5}, -- 10 Industrial
    [11] = {place = 4.5}, -- 11 Utility
    [12] = {place = 3.5}, -- 12 Vans
    [13] = {place = 0}, -- 13 Cycles
    [14] = {place = 0}, -- 14 Boats
    [15] = {place = 30.5}, -- 15 Helicopters
    [16] = {place = 30.0}, -- 16 Planes
    [17] = {place = 4.5}, -- 17 Service
    [18] = {place = 4.5}, -- 18 Emergency
    [19] = {place = 15.0}, -- 19 Military
    [20] = {place = 4.8}, -- 20 Commercial

}
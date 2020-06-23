
local channels = {
    {pos = vector3(-59.9586, -1282.996, 31.02416),channel = "sport", id = 479234},
    {pos = vector3(355.1666, -1410.056, 34.8163),channel = "hopital", id = 352986},
    {pos = vector3(-227.108, -1381.998, 34.10688),channel = "autoecole", id = 286660},
    {pos = vector3(-181.2944, -1624.298, 44.09548),channel = "families", id = 971919},
    {pos = vector3(-93.87772, -1806.61, 28.83462),channel = "mecano", id = 905244},
    {pos = vector3(102.473, -1939.208, 27.31482),channel = "balas", id = 507101},
    {pos = vector3(329.0712, -2034.648, 29.89156),channel = "vagos", id = 195540},
    {pos = vector3(134.3402, -1307.296, 37.51494),channel = "unicorn", id = 656640},
    {pos = vector3(45.20788, -1001.182, 33.92356),channel = "hotdog", id = 486260},
    {pos = vector3(282.2918, -972.6982, 30.14736),channel = "pizza", id = 657018},
    {pos = vector3(264.4412, -823.6008, 31.0151),channel = "curcialfix", id = 786022},
    {pos = vector3(378.6584, -827.1248, 30.49434),channel = "bestBuds", id = 916922},
    {pos = vector3(-1090.414, -838.2852, 20.06498),channel = "comico", id = 363598},
    {pos = vector3(-1071.232, -245.302, 45.9397),channel = "lifeinvaders", id = 919596},
    {pos = vector3(-555.4928, 287.2674, 82.68528),channel = "taquilala", id = 444264},
    {pos = vector3(252.848, 218.2476, 108.1226),channel = "banque", id = 751300},
    {pos = vector3(390.551, -355.1512, 53.02968),channel = "spawn", id = 280391},
    {pos = vector3(-294.6866, -2650.342, 11.7293),channel = "ls-livraison", id = 659980},
    {pos = vector3(1747.522, 2562.422, 64.27022),channel = "fédéral", id = 277049},
    {pos = vector3(2946.492, 2789.106, 53.58936),channel = "mine", id = 876229},
    {pos = vector3(2695.648, 3443.38, 66.94694),channel = "bc-stocks", id = 101386},
    {pos = vector3(1853.748, 3669.49, 46.31324),channel = "sandy-shores", id = 120509},
    {pos = vector3(1724.238, 4811.174, 59.44676),channel = "grapseed", id = 512054},
    {pos = vector3(-315.7006, 6153.022, 58.1219),channel = "paleto", id = 625886},
    {pos = vector3(-1593.094, 4415.43, 16.10018),channel = "chasse", id = 979404},
    {pos = vector3(-2250.182, 3221.794, 51.81096),channel = "militaire", id = 357881},
    {pos = vector3(-1882.864, 2069.114, 146.7366),channel = "vigneron", id = 971916},
    {pos = vector3(-1361.864, 242.7922, 89.52338),channel = "hotel-richman", id = 178830},
    {pos = vector3(-1654.534, -1062.08, 30.51108),channel = "del-pierro", id = 132537},
    {pos = vector3(-1116.128, -1442.98, 14.67848),channel = "haters", id = 135864},
    {pos = vector3(-469.4136, -978.894, 58.74388),channel = "chantier1", id = 182676},
    {pos = vector3(95.01526, -399.496, 52.1766),channel = "chantier2", id = 300021},
    {pos = vector3(-1222.09, -2702.478, 62.8311),channel = "aeroport", id = 844899},
    {pos = vector3(811.4224, -2285.112, 71.53666),channel = "usine", id = 815643},
    {pos = vector3(734.2332, 2519.73, 83.41516),channel = "radio", id = 328278},
    {pos = vector3(3558.02, 3744.978, 61.18428),channel = "labo", id = 696839},
    {pos = vector3(2404.556, 3103.894, 64.08288),channel = "decharge-nord", id = 276940},
    {pos = vector3(1995.872, 3054.996, 54.0171),channel = "Yellow-Jack", id = 572590},
    {pos = vector3(-330.3914, 2787.936, 69.91042),channel = "eglise-nord", id = 658044},
    {pos = vector3(-100.8498, -119.2698, 67.57262),channel = "rockford-plazza", id = 552588},
    {pos = vector3(312.1744, -583.1572, 44.0686),channel = "vieux-hopital", id = 891132},
    {pos = vector3(715.4614, -963.5574, 27.86614),channel = "lester", id = 315180},
    {pos = vector3(722.8518, -1220.388, 29.93282),channel = "skatepark-sous-le-pond", id = 220321},
    {pos = vector3(1271.67, -1726.128, 58.37294),channel = "quartier-lester", id = 297557},
    {pos = vector3(951.7684, -3068.018, 25.24886),channel = "docks", id = 115257},
    {pos = vector3(-1693.546, -192.2386, 66.0654),channel = "cimetiere", id = 685046},
    {pos = vector3(-1208.34, 77.2938, 70.25),channel = "golf", id = 256278},
    {pos = vector3(-244.2748, -667.744, 74.70492),channel = "arcadius", id = 857483},
    {pos = vector3(-223.1006, -1297.492, 43.73534),channel = "bennys", id = 344833},
    {pos = vector3(1591.424, -1943.938, 129.8188),channel = "petrol-ville", id = 103076},
    {pos = vector3(2508.092, -402.3086, 117.6744),channel = "gouv", id = 169899},
    {pos = vector3(199.2026, 1166.73, 229.5234),channel = "meeting", id = 458354},
    {pos = vector3(684.2956, 573.5798, 132.8348),channel = "amphi", id = 439197},
    {pos = vector3(2470.642, 3760.452, 58.36408),channel = "montagne-couleur", id = 939725},
    {pos = vector3(3393.138, 5158.688, 32.91716),channel = "phare", id = 623472},
    {pos = vector3(2245.972, 5573.48, 65.71318),channel = "graine-weed", id = 162795},
    {pos = vector3(-76.41104, 6252.846, 37.4331),channel = "poulet", id = 310767},
    {pos = vector3(130.2286, 6616.434, 38.72302),channel = "mecano-nord", id = 933162},
    {pos = vector3(473.567, 5523.928, 789.035),channel = "chiliad", id = 586920},
    {pos = vector3(1320.902, 4271.86, 48.92164),channel = "ponton-pèche", id = 997986},
    {pos = vector3(1569.676, 3602.234, 48.66934),channel = "hotel-sandy", id = 973889},
    {pos = vector3(76.9105, 3676.954, 72.12346),channel = "camp-biker", id = 482111},
    {pos = vector3(706.0416, 1346.962, 396.3548),channel = "paneau-vinewood", id = 376159},
    {pos = vector3(2704.214, 1528.16, 73.027),channel = "central-eletrique", id = 734823},
    {pos = vector3(16.75808, -1116.794, 30.29114),channel = "armurie-ville", id = 525020},
    {pos = vector3(-65.79666, 67.34456, 84.91714),channel = "concess", id = 999166},
    {pos = vector3(424.1106, -804.9404, 30.83352),channel = "shop-cloth-bestbuds", id = 248156},
    {pos = vector3(229.4266, -886.1542, 31.68242),channel = "tig-lspd", id = 607674},
    {pos = vector3(367.4598, -852.8516, 29.10276),channel = "devant-bestbuds", id = 340476},
    {pos = vector3(-52.14528, -1756.586, 30.0494),channel = "ltd-mecano", id = 511146},
}

function InitVoiceChat()
    Citizen.CreateThread(function()
        Citizen.Wait(500)
    
        local ActualChannel = 0
        local ClosetChannel = 0
        local ClosetDst = nil
        local ClosetChanName = ""
        while true do
            ClosetChannel = 0
            ClosetDst = nil
            ClosetChanName = ""

            local pCoords = GetEntityCoords(pPed)
            for k,v in pairs(channels) do
                if ActualChannel ~= v.channel then
                    local dst = #(pCoords - v.pos)
                    if ClosetDst == nil then
                        ClosetDst = dst
                        ClosetChannel = v.id
                        ClosetChanName = v.channel
                    else
                        if dst < ClosetDst then
                            ClosetDst = dst
                            ClosetChannel = v.id
                            ClosetChanName = v.channel
                        end
                    end
                end
            end

            --local player, dst = rUtils.GetClosestPlayer()
            --if dst ~= nil and dst < 10 then
            --    local sId = GetPlayerServerId(player)
            --    local pChannel = MumbleGetVoiceChannelFromServerId(sId)
            --    if pChannel ~= nil and pChannel ~= ActualChannel then
            --        ClosetChannel = pChannel
            --        print("^2VOICE: ^7Joueur proche en channel ["..pChannel.."] détécté, sync en cours ...")
            --    end
            --end

            if ClosetChannel ~= ActualChannel then
                ActualChannel = ClosetChannel
                NetworkClearVoiceChannel()
                NetworkSetVoiceChannel(ActualChannel)
                print("^2VOICE: ^7Changement de channel vocal en ["..ClosetChanName.."]")
            end

            Citizen.Wait(750)
        end
    end)
    rUtils.ImportantNotif("Vocal: ~g~Connecté avec succès")
end




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

            local player, dst = rUtils.GetClosestPlayer()
            if dst ~= nil and dst < 10 then
                local sId = GetPlayerServerId(player)
                local pChannel = MumbleGetVoiceChannelFromServerId(sId)
                if pChannel ~= nil and pChannel ~= ActualChannel then
                    ClosetChannel = pChannel
                    print("^2VOICE: ^7Joueur proche en channel ["..pChannel.."] détécté, sync en cours ...")
                end
            end

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



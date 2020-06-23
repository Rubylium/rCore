
local channels = {

}

function InitVoiceChat()
    Citizen.CreateThread(function()
        Citizen.Wait(500)
    
        local ActualChannel = 0
        local ClosetChannel = 0
        local ClosetDst = nil
        while true do
            ClosetChannel = 0
            ClosetDst = nil

            local pCoords = GetEntityCoords(pPed)
            for k,v in pairs(channels) do
                if ActualChannel ~= v.channel then
                    local dst = #(pCoords - v.pos)
                    if ClosetDst == nil then
                        ClosetDst = dst
                        ClosetChannel = v.channel
                    else
                        if dst < ClosetDst then
                            ClosetDst = dst
                            ClosetChannel = v.channel
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
                print("^2VOICE: ^7Changement de channel vocal en ["..ActualChannel.."]")
            end

            Citizen.Wait(750)
        end
    end)
    rUtils.ImportantNotif("Vocal: ~g~Connecté avec succès")
end



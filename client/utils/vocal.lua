
local channels = {

}

function InitVoiceChat()
    Citizen.CreateThread(function()
        Citizen.Wait(500)
    
        local ActualChannel = 0
        local ClosetChannel = 0
        local ClosetDst = nil
        while true do

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
            Citizen.Wait(250)
        end
    end)
    rUtils.ImportantNotif("Vocal: ~g~Connecté avec succès")
end



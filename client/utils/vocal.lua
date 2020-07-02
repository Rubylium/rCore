
function InitVoiceChat()
    
    
    Citizen.CreateThread(function()
        local channel = math.random(1,99999999)
        NetworkSetVoiceActive(true)
        NetworkClearVoiceChannel()
        NetworkSetVoiceChannel(1)
        while true do
            Wait(250)
            NetworkSetVoiceActive(false)
            NetworkSetVoiceChannel(channel)
        end
    end)
    
end

local IsAlive = false
inRadio = false

AddEventHandler("core:OnVoiceConnect", function()
    if not IsAlive then
        IsAlive = true
        rUtils.ImportantNotif("Vocal: ~g~Connecté avec succès")
    end
end)

AddEventHandler("core:OnVoiceDisconnect", function()
    IsAlive = false
end)

local TalkingToRadio = false
Citizen.CreateThread(function()
    while true do
        if not IsAlive then
            Wait(1)
            RageUI.Text({
                message = "Tu n'es pas connecté au Teamspeak ! Ceci est obligatoire pour jouer !"
            })
            DisableAllControlActions(0)
        else
            if IsControlPressed(1, 249) and not InAction then
                if inRadio then
                    if not TalkingToRadio then
                        rUtils.PlayAnim("random@arrests", "generic_radio_chatter", 49, 5.0, 5.0)
                        TalkingToRadio = true
                    end
                end
            else
                if TalkingToRadio and not InAction then
                    ClearPedTasks(pPed)
                    TalkingToRadio = false
                end
            end
            Wait(500)
        end
    end
end)
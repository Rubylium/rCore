
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

AddEventHandler("core:OnVoiceConnect", function()
    if not IsAlive then
        IsAlive = true
        rUtils.ImportantNotif("Vocal: ~g~Connecté avec succès")
    end
end)

AddEventHandler("core:OnVoiceDisconnect", function()
    IsAlive = false
end)


Citizen.CreateThread(function()
    while true do
        if not IsAlive then
            Wait(1)
            RageUI.Text({
                message = "Tu n'es pas connecté au Teamspeak ! Ceci est obligatoire pour jouer !"
            })
            DisableAllControlActions(0)
        else
            Wait(1000)
        end
    end
end)



RegisterCommand("radio", function(source, args, rawCommand)
    if args[1] == nil then 
        exports.saltychat:SetRadioChannel('', true)
        print("Radio reset")
    else
        exports.saltychat:SetRadioChannel(args[1], true)
        print("Radio: "..args[1])
    end
end, false)
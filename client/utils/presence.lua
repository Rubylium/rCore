

local presence = {
    ["default"] = {
        id = "717325070837481506",
        image = "redside",
        little = "v6",
        texte = "Joue sur avec "
    },
    ["chasse"] = {
        id = "717325070837481506",
        image = "hunt",
        little = "v6",
        texte = "Chasse avec "
    },
    ["sport"] = {
        id = "717325070837481506",
        image = "sport",
        little = "v6",
        texte = "Fait du sport avec "
    }
}

pPlayerNumber = math.random(50,150)
RegisterNetEvent("core:GetPlayersNumber")
AddEventHandler("core:GetPlayersNumber", function(num)
    pPlayerNumber = num
end)

local ActualPresence = "default"

Citizen.CreateThread(function()
    local pres = presence[ActualPresence]
	SetDiscordAppId(pres.id)
	SetDiscordRichPresenceAsset(pres.image)
    --SetDiscordRichPresenceAssetSmall(pres.little)
    while true do 
        while events.GetNumPlayers == nil do Wait(10) end
        TriggerServerEvent(events.GetNumPlayers, token)
        pres = presence[ActualPresence]
        SetRichPresence(pres.texte..pPlayerNumber.." joueurs.")
        Wait(60*1000)
    end
end)    



function UpdatePresence(type)
    if type == ActualPresence then return end
    print("^1Changing presence")
    ActualPresence = type
    local pres = presence[type]
	SetDiscordAppId(pres.id)
	SetDiscordRichPresenceAsset(pres.image)
    SetDiscordRichPresenceAssetSmall(pres.little)
    local r = math.random(1,5)
    SetRichPresence(pres.texte..r.." joueurs.")
end
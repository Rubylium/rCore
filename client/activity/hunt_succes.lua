Huntkills = 0

Citizen.CreateThread(function()
    Huntkills = GetResourceKvpInt("hunting")
    if Huntkills == nil then
        Huntkills = 0
    end
    print("Hunter kills "..Huntkills)
end)

local succes = {
    [1] = {
        texte = "Première chasse!"
    },
    [5] = {
        texte = "Amateur de chasse!"
    },
    [10] = {
        texte = "Néophyte de la chasse!"
    },
    [50] = {
        texte = "Chasseur aguerri!"
    },
    [100] = {
        texte = "Pro de la chasse!",
        suplementaire = "Tu as maintenant accès au fusil de précision de chasseur!",
    },
}




function CheckSucces()
    Huntkills = Huntkills + 1
    if succes[Huntkills] ~= nil then
        PlayUrl("SUCCES", "https://www.youtube.com/watch?v=VpwqsYA44JI", 1.0, false)
        Wait(1000)
        rUtils.ShowFreemodeMessage("~y~SUCCES!", succes[Huntkills].texte, 3.5)
        if succes[Huntkills].suplementaire ~= nil then
            rUtils.Notif("~y~SUCCES!\n~w~"..succes[Huntkills].suplementaire)
        end
    end
    SetResourceKvpInt("hunting", Huntkills)
end
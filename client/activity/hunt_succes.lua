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
    [20] = {
        texte = "20 bêtes tuées"
    },
    [30] = {
        texte = "30 bêtes tuées"
    },
    [40] = {
        texte = "40 bêtes tuées"
    },
    [50] = {
        texte = "Chasseur aguerri!"
    },
    [60] = {
        texte = "60 bêtes tuées"
    },
    [70] = {
        texte = "70 bêtes tuées"
    },
    [80] = {
        texte = "80 bêtes tuées"
    },
    [90] = {
        texte = "90 bêtes tuées"
    },
    [100] = {
        texte = "Pro de la chasse!",
        suplementaire = "Tu as maintenant accès au fusil de précision de chasseur!",
    },
}

Citizen.CreateThread(function()
    local Last10 = 100
    for i = 100, 1000 do
        if i == Last10 + 10 then
            succes[Last10] = {texte = Last10.." bêtes tuées"}
            Last10 = Last10 + 10
        end
    end
end)


function CheckSucces()
    Huntkills = Huntkills + 1
    if succes[Huntkills] ~= nil then
        PlayUrl("SUCCES", "https://www.youtube.com/watch?v=VpwqsYA44JI", 0.4, false)
        Wait(1000)
        SendNUIMessage({ 
            succes = true
        })
        --rUtils.ShowFreemodeMessage("~y~SUCCES!", succes[Huntkills].texte, 3.5)
        rUtils.Notif("~y~SUCCES!\n~w~"..succes[Huntkills].texte)
        if succes[Huntkills].suplementaire ~= nil then
            rUtils.Notif("~y~SUCCES!\n~w~"..succes[Huntkills].suplementaire)
        end
    end
    SetResourceKvpInt("hunting", Huntkills)
end
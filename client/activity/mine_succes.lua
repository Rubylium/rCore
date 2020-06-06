Mine = 0

Citizen.CreateThread(function()
    Mine = GetResourceKvpInt("Mine")
    if Mine == nil then
        Mine = 0
    end
end)

local succes = {
    [1] = {
        texte = "Première pierre cassée!"
    },
    [5] = {
        texte = "Amateur du minage!"
    },
    [10] = {
        texte = "Néophyte de la mine!"
    },
    [20] = {
        texte = "20 pierres minées!"
    },
    [30] = {
        texte = "30 pierres minées!"
    },
    [40] = {
        texte = "40 pierres minées!"
    },
    [50] = {
        texte = "Mineur aguerri!"
    },
    [60] = {
        texte = "60 pierres minées!"
    },
    [70] = {
        texte = "70 pierres minées!"
    },
    [80] = {
        texte = "80 pierres minées!"
    },
    [90] = {
        texte = "90 pierres minées!"
    },
    [100] = {
        texte = "Mineur pro!",
        suplementaire = "Tu vas maintenant miner plus rapidement grace à ton expérience! Bravo!",
    },
}

Citizen.CreateThread(function()
    local Last10 = 100
    for i = 100, 1000 do
        if i == Last10 + 10 then
            succes[Last10] = {texte = Last10.." pierres minées!"}
            Last10 = Last10 + 10
        end
    end
end)



function CheckMinerSucces()
    Mine = Mine + 1
    if succes[Mine] ~= nil then
        PlayUrl("SUCCES", "https://www.youtube.com/watch?v=VpwqsYA44JI", 0.4, false)
        Wait(1000)
        SendNUIMessage({ 
            succes = true
        })

        rUtils.Notif("~y~SUCCES!\n~w~"..succes[Mine].texte)
        if succes[Mine].suplementaire ~= nil then
            rUtils.Notif("~y~SUCCES!\n~w~"..succes[Mine].suplementaire)
        end
    end
    SetResourceKvpInt("Mine", Mine)
end
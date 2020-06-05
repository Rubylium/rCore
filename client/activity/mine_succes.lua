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
    [50] = {
        texte = "Mineur aguerri!"
    },
    [100] = {
        texte = "Mineur pro!",
        suplementaire = "Tu vas maintenant miner plus rapidement grace à ton expérience! Bravo!",
    },
}




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
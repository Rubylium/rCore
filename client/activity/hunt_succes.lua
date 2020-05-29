local kills = 0

Citizen.CreateThread(function()
    SetResourceKvpInt("hunting", 0)
    local kills = GetResourceKvpInt("hunting")
    if kills == nil then
        kills = 0
    end
end)

local succes = {
    [1] = {
        texte = "Première chasse!"
    },
    [5] = {
        texte = "Amateur de chasse!"
    },
    [10] = {
        texte = "La chasse n'a plus aucun secret!"
    },
}




function CheckSucces()
    kills = kills + 1
    if succes[kills] ~= nil then
        PlayUrl("SUCCES", "https://www.youtube.com/watch?v=VpwqsYA44JI", 1.0, false)
        Wait(1000)
        rUtils.Notif("~y~SUCCES!\n~w~"..succes[kills].texte)
    end
    SetResourceKvpInt("hunting", kills)
end
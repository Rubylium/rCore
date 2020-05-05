

Citizen.CreateThread(function()
    while true do
        if pJob == "mecano" then
            LoadMecanoData()
        end
        Wait(5000)
    end
end)
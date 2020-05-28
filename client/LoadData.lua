

function LoadData()
    Wait(5000)
    if pJob == "mecano" then
        LoadMecanoData()
    elseif pJob == "medecin" then
        LoadEmsData()
    elseif pJob == "police" then
        LoadPoliceData()
    end

    print("^2Loading "..pJob.." data.")
end
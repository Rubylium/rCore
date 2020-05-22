

function LoadData()
    if pJob == "mecano" then
        LoadMecanoData()
    elseif pJob == "medecin" then
        LoadEmsData()
    end

    print("^2Loading "..pJob.." data.")
end
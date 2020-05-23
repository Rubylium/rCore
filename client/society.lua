societyList = {
    {
        name = "Aucun",
        grade = {
            [0] = {label = "Sans job fix"},
        },
    },
    {
        name = "mecano",
        grade = {
            [0] = {label = "Débutant"},
            [1] = {label = "Avancé"},
            [2] = {label = "Expérimenté"},
            [3] = {label = "Patron"},
        },
    },
    {
        name = "medecin",
        grade = {
            [0] = {label = "Brancardier"},
            [1] = {label = "Apprentie medecin"},
            [2] = {label = "Medecin"},
            [3] = {label = "Urgentiste"},
            [4] = {label = "Chirurgien"},
            [5] = {label = "Patron"},
        },
    },
}


function GetSocietyLabels(society)
    for k,v in pairs(societyList) do
        if society == v.name then
            return v.grade
        end
    end
end

function GetGradeLabel(job, grade)
    if grade == nil then
        return "Sans emploi fix."
    end
    for k,v in pairs(societyList) do    
        if v.name == job then
            if grade <= #v.grade then
                local label = v.grade[grade].label
                if label == nil then
                    label = "Aucun label."
                end
                return label
            else
                return "Erreur de label."
            end
        end
    end
end


function IsPatron(job, grade)
    for k,v in pairs(societyList) do    
        if v.name == job then
            if grade <= #v.grade then
                local label = v.grade[grade].label
                if label == "Patron" then
                    return true
                else
                    return false
                end
            else
                return false
            end
        end
    end
end
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
    {
        name = "police",
        grade = {
            [0] = {label = "En formation"},
            [1] = {label = "Cadet"},
            [2] = {label = "Officier"},
            [3] = {label = "Caporal"},
            [4] = {label = "Sergeant"},
            [5] = {label = "Lieutenant"},
            [6] = {label = "Capitaine"},
            [7] = {label = "Major"},
            [8] = {label = "Lieutenant Colonel"},
            [9] = {label = "Inspecteur de division"},
            [10] = {label = "Patron"},
        },
    },
    {
        name = "concessionnaire",
        grade = {
            [0] = {label = "Vendeur"},
            [1] = {label = "Patron"},
        },
    },
    { 
        name = "sheriff",
        grade = {
            [0] = {label = "Junior"},
            [1] = {label = "Junior Confirmé"},
            [2] = {label = "Caporal"},
            [3] = {label = "Major"},
            [4] = {label = "Sous-Sheriff"},
            [5] = {label = "Patron"},
        },
    },
    {
        name = "bestbuds",
        grade = {
            [0] = {label = "Vendeur"},
            [1] = {label = "Fabriquant"},
            [2] = {label = "Gérant de production"},
            [3] = {label = "Patron"},
        },
    },
    {
        name = "drusilla",
        grade = {
            [0] = {label = "Transporteur"},
            [1] = {label = "Cuisinier"},
            [2] = {label = "Gérant de production"},
            [3] = {label = "Patron"},
        },
    },
    {
        name = "crucial",
        grade = {
            [0] = {label = "Transporteur"},
            [1] = {label = "Cuisinier"},
            [2] = {label = "Gérant de production"},
            [3] = {label = "Patron"},
        },
    },
    {
        name = "hotdogs",
        grade = {
            [0] = {label = "Transporteur"},
            [1] = {label = "Cuisinier"},
            [2] = {label = "Gérant de production"},
            [3] = {label = "Patron"},
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
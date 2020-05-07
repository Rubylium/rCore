societyList = {
    {
        name = "mecano",
        grade = {
            {label = "Débutant"},
            {label = "Avancé"},
            {label = "Expérimenté"},
            {label = "Patron"},
        }
    }
}
function GetSocietyLabels(society)
    for k,v in pairs(societyList) do
        if society == v.name then
            return v.grade
        end
    end
end
function GetGradeLabel(job, grade)
    for k,v in pairs(societyList) do    
        if v.name == job then
            local label = v.grade[grade].label
            if label == nil then
                label = "Aucun label."
            end
            return label
        end
    end
end

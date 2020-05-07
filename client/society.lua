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

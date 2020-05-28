local open = false

local VespucciLift = {
    [0] =  {pos = vector3(-1095.927, -850.7149, 05.00121), name = "-1 - Parking et cellule"},
    [1] =  {pos = vector3(-1095.927, -850.7149, 10.30121), name = "-2 - Laboratoire et saisie"},
    [2] =  {pos = vector3(-1095.927, -850.7149, 14.10121), name = "-3 - Garage et armurie"},
    [3] =  {pos = vector3(-1095.927, -850.7149, 19.00121), name = "0 - RDC"},
    [4] =  {pos = vector3(-1095.927, -850.7149, 23.00121), name = "1 - Petit salon"},
    [5] =  {pos = vector3(-1095.927, -850.7149, 27.00121), name = "2 - Salle de sport et salle de meating"},
    [6] =  {pos = vector3(-1095.927, -850.7149, 31.00121), name = "3 - Bureau"},
    [7] =  {pos = vector3(-1095.927, -850.7149, 34.00121), name = "4 - Bureau haut gradé"},
    [8] =  {pos = vector3(-1095.927, -850.7149, 38.30121), name = "5 - Toit"},
},


rUtils.RegisterActionZone({
    pos = vector3(-1095.927, -850.7149, 19.00121),
    zAxe = false,
    action = function()
        OpenVespLiftMenu()
    end,
})


RMenu.Add('core', 'vespucci_lift', RageUI.CreateMenu("LIFT", "Choisir un étage"))
RMenu:Get('core', 'vespucci_lift').Closed = function()
    open = false
end


function OpenVespLiftMenu()
    if open then return end
    open = true
    RageUI.Visible(RMenu:Get('core', 'vespucci_lift'), not RageUI.Visible(RMenu:Get('core', 'vespucci_lift')))
    Citizen.CreateThread(function()
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'vespucci_lift'), false, false, false, function()
                for k,v in pairs(VespucciLift) do
                    RageUI.ButtonWithStyle(v.name, nil, { }, true, function(Hovered, Active, Selected)
                        if Selected then
                            SetEntityCoordsNoOffset(pPed, v.pos, 0.0, 0.0, 0.0)
                            SetEntityHeading(pPed, 33.0)
                        end
                    end)
                end
            end, function()
                ---Panels
            end)


        end
    end)
end  
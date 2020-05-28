-- ############################################
-- --------------------------------------------
-- 3dme : /me command but its 3D printed
-- Author : Elio
-- Server side
-- --------------------------------------------
-- ############################################

-- --------------------------------------------
-- Functions
-- --------------------------------------------

-- OBJ : transform a table into a string (using spaces)
-- PARAMETERS :
--		- tab : the table to transform

-- --------------------------------------------
-- Commands
-- --------------------------------------------

RegisterNetEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(token, idsToSend, text, pPedSID)
    if exports.rFramework:CheckToken(token, source, "shareDisplay") then
        for k,v in pairs(idsToSend) do
            TriggerClientEvent("3dme:shareDisplay", v, text, pPedSID)
        end
    end
end)

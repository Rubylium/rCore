RMenu.Add('core', 'death_call', RageUI.CreateMenu("EMS", "~b~Ménu action EMS"))
RMenu:Get('core', 'death_call').Closable = false
RMenu:Get('core', 'death_call').Closed = function()

end

local LastDamage = 0
local FatalInjured = false
Citizen.CreateThread(function()
    exports['spawnmanager']:setAutoSpawn(false)
    while true do
        local pPed = GetPlayerPed(-1)
        if IsPedDeadOrDying(pPed, 1) then
            if not pDeath then
                pDeath = true
                local test, bone = GetPedLastDamageBone(pPed, 0)
                if test ~= false then 
                    LastDamage = bone 
                end
                SyncDeathWithPlayers()
            end
        end
        Wait(2*1000)
    end
end)

-- Injured with weapon "move_strafe@injured" "idle"

local FatalDamage = {12844, 31086, 35731, 39317, 65068}
local DidCall = false

local dict = "random@dealgonewrong"
local anim = "idle_a"
function SyncDeathWithPlayers()
    FatalInjured = false
    DidCall = false
    RageUI.CloseAll()
    RageUI.Visible(RMenu:Get('core', 'death_call'), not RageUI.Visible(RMenu:Get('core', 'death_call')))
    local pPed = GetPlayerPed(-1)
    local pCoords = GetEntityCoords(pPed)
    local heading GetEntityHeading(pPed)
    NetworkResurrectLocalPlayer(pCoords, heading, 0, 0)
    ClearPlayerWantedLevel(GetPlayerIndex())
    SetPedCurrentWeaponVisible(pPed, false, true, 1, 1)
    TriggerServerEvent("core:SetPlayerDeathStatus", FatalInjured)
    Citizen.CreateThread(function()
        while pDeath do
            local pPed = GetPlayerPed(-1)
            local test, bone = GetPedLastDamageBone(pPed, 0)

            if test ~= false then 
                LastDamage = bone 
            end
            if not FatalInjured then
                for k,v in pairs(FatalDamage) do
                    if LastDamage == v then
                        if not IsPedRagdoll(pPed) then
                            SetPedToRagdoll(pPed, 5000, 5000, 0, 0, 0, 0)
                            FatalInjured = true
                            TriggerServerEvent("core:SetPlayerDeathStatus", FatalInjured)
                            break
                        end
                    end 
                end
            end
            
            if not FatalInjured then
                SetPedCanRagdoll(pPed, true)
                if IsControlPressed(1, 32) then
                    if not IsEntityPlayingAnim(pPed, "move_injured_ground", "front_loop", 1) then
                        rUtils.PlayAnim("move_injured_ground", "front_loop", 1)
                    end
                elseif IsControlPressed(1, 31) then
                    if not IsEntityPlayingAnim(pPed, "move_injured_ground", "back_loop", 1) then
                        rUtils.PlayAnim("move_injured_ground", "back_loop", 1)
                    end
                elseif IsControlPressed(1, 34) then
                    if not IsEntityPlayingAnim(pPed, "move_injured_ground", "sidel_loop", 1) then
                        rUtils.PlayAnim("move_injured_ground", "sidel_loop", 1)
                    end
                elseif IsControlPressed(1, 35) then
                    if not IsEntityPlayingAnim(pPed, "move_injured_ground", "sider_loop", 1) then
                        rUtils.PlayAnim("move_injured_ground", "sider_loop", 1)
                    end
                elseif not IsEntityPlayingAnim(pPed, dict, anim, 1) then
                    rUtils.PlayAnim(dict, anim, 1)
                end
            else
                SetPedCanRagdoll(pPed, true)
                SetPedToRagdoll(pPed, 1000, 1000, 0, 0, 0, 0)

            end

            RageUI.IsVisible(RMenu:Get('core', 'death_call'), true, true, true, function()
    
                if not DidCall then
                    RageUI.Button("Demander un EMS.", nil, { }, true, function(Hovered, Active, Selected)
                        if Selected then
                            DidCall = true
                            TriggerServerEvent("core:RegisterCall", "medecin", "Demande de réanimation de citoyen.")
                        end
                    end)
                else
                    RageUI.Button("Appel envoyé aux secours.", nil, { }, true, function(Hovered, Active, Selected)
                    end)
                end
    
    
            end, function()
            end)

            if IsPedDeadOrDying(pPed, 1) then
                NetworkResurrectLocalPlayer(GetEntityCoords(pPed), heading, 0, 0)
                ClearPlayerWantedLevel(GetPlayerIndex())
                SetPedCurrentWeaponVisible(pPed, false, true, 1, 1)
            end

            RageUI.IsVisible(RMenu:Get('core', 'death_call'), true, true, true, function()
    
                RageUI.Button("Demander un EMS.", nil, { }, true, function(Hovered, Active, Selected)
                    if Selected then
                        TriggerServerEvent("core:SetServiceStatus", pJob)
                    end
                end)
    
    
            end, function()
            end)
            Wait(1)
        end

        NetworkResurrectLocalPlayer(GetEntityCoords(pPed), heading, 0, 0)
        ClearPlayerWantedLevel(GetPlayerIndex())
        SetPedCurrentWeaponVisible(pPed, false, true, 1, 1)
        RageUI.Visible(RMenu:Get('core', 'death_call'), false)
    end)
end

RegisterNetEvent("core:ResetDeathStatus")
AddEventHandler("core:ResetDeathStatus", function()
    pDeath = false
end)

function ResetDeathStatus()
    pDeath = false
end
RMenu.Add('core', 'death_call', RageUI.CreateMenu("Demande EMS", "~b~Demande de l'aide"))
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
        Wait(1*1000)
    end
end)

-- Injured with weapon "move_strafe@injured" "idle"

local FatalDamage = {12844, 31086, 35731, 39317, 65068}
local DidCall = false

local dict = "random@dealgonewrong"
local anim = "idle_a"
function SyncDeathWithPlayers()
    StartAudioScene("DEATH_SCENE")
    Wait(5000)
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
    TriggerServerEvent("core:SetPlayerDeathStatus", token, FatalInjured)
    Citizen.CreateThread(function()
        local LastMove = "front"
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
                            StartAudioScene("SWITCH_TO_MP_SCENE")
                            NetworkSetVoiceActive(false)
                            StartScreenEffect("DeathFailOut", -1, true)
                            TriggerServerEvent("core:SetPlayerDeathStatus", token, FatalInjured)
                            break
                        end
                    end 
                end
            end
            
            if not FatalInjured then
                SetPedCanRagdoll(pPed, true)
                if IsControlPressed(1, 32) then
                    if not IsEntityPlayingAnim(pPed, "move_injured_ground", "front_loop", 1) then
                        rUtils.PlayAnim("move_injured_ground", "front_loop", 1, 100.0)
                        LastMove = "front"
                    end
                elseif IsControlPressed(1, 31) then
                    if not IsEntityPlayingAnim(pPed, "move_injured_ground", "back_loop", 1) then
                        rUtils.PlayAnim("move_injured_ground", "back_loop", 1, 100.0)
                        LastMove = "back"
                    end
                elseif IsControlPressed(1, 34) then
                    if not IsEntityPlayingAnim(pPed, "move_injured_ground", "sidel_loop", 1) then
                        rUtils.PlayAnim("move_injured_ground", "sidel_loop", 1, 100.0)
                    end
                elseif IsControlPressed(1, 35) then
                    if not IsEntityPlayingAnim(pPed, "move_injured_ground", "sider_loop", 1) then
                        rUtils.PlayAnim("move_injured_ground", "sider_loop", 1, 100.0)
                    end
                elseif not IsEntityPlayingAnim(pPed, dict, anim, 1) then
                    if LastMove == "front" then
                        rUtils.PlayAnim(dict, anim, 1)
                    else
                        rUtils.PlayAnim("move_injured_ground", "back_outro", 1, 100.0)
                    end
                end
            else
                SetPedCanRagdoll(pPed, true)
                SetPedToRagdoll(pPed, 1000, 1000, 0, 0, 0, 0)

            end

            RageUI.IsVisible(RMenu:Get('core', 'death_call'), true, true, true, function()
    
                if not DidCall then
                    RageUI.ButtonWithStyle("Demander un EMS.", nil, { }, true, function(Hovered, Active, Selected)
                        if Selected then
                            DidCall = true
                            TriggerServerEvent("core:RegisterCall", token, "medecin", "Demande de réanimation de citoyen.")
                            print("Appel")
                        end
                    end)
                else
                    RageUI.ButtonWithStyle("Appel envoyé aux secours.", nil, { }, true, function(Hovered, Active, Selected)
                    end)
                end
    
    
            end, function()
            end)

            if IsPedDeadOrDying(pPed, 1) then
                FatalInjured = true
                StartAudioScene("MP_LEADERBOARD_SCENE")
                NetworkSetVoiceActive(false)
                StartScreenEffect("DeathFailOut", -1, true)
                NetworkResurrectLocalPlayer(GetEntityCoords(pPed), heading, 0, 0)
                ClearPlayerWantedLevel(GetPlayerIndex())
                SetPedCurrentWeaponVisible(pPed, false, true, 1, 1)
            end
            Wait(1)
        end

        NetworkSetVoiceActive(true)
        StopScreenEffect('DeathFailOut')
        StopAudioScenes()
        StopGameplayHint(true)
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
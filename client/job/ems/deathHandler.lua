local LastDamage = 0
local FatalInjured = false
Citizen.CreateThread(function()
    exports['spawnmanager']:setAutoSpawn(false)
    while true do
        local pPed = GetPlayerPed(-1)
        if IsPedDeadOrDying(pPed, 1) then
            if not pDeath then
                print("^1Death of the ped")
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

local dict = "random@dealgonewrong"
local anim = "idle_a"
function SyncDeathWithPlayers()
    FatalInjured = false
    print("^2Syncing death with players")
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
                SetPedCanRagdoll(pPed, false)
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

            if IsPedDeadOrDying(pPed, 1) then
                NetworkResurrectLocalPlayer(GetEntityCoords(pPed), heading, 0, 0)
                ClearPlayerWantedLevel(GetPlayerIndex())
                SetPedCurrentWeaponVisible(pPed, false, true, 1, 1)
            end
            Wait(10)
        end

        NetworkResurrectLocalPlayer(GetEntityCoords(pPed), heading, 0, 0)
        ClearPlayerWantedLevel(GetPlayerIndex())
        SetPedCurrentWeaponVisible(pPed, false, true, 1, 1)
    end)
end

RegisterNetEvent("core:ResetDeathStatus")
AddEventHandler("core:ResetDeathStatus", function()
    pDeath = false
end)

function ResetDeathStatus()
    pDeath = false
end
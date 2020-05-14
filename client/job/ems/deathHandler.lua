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
        Wait(5*1000)
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
                            break
                        end
                    end
                end
            end
            if not FatalInjured then
                if not IsEntityPlayingAnim(pPed, dict, anim, 1) then
                    rUtils.PlayAnim(dict, anim, 1)
                end
            else
                SetPedToRagdoll(pPed, 1000, 1000, 0, 0, 0, 0)
            end

            if IsPedDeadOrDying(pPed, 1) then
                NetworkResurrectLocalPlayer(pCoords, heading, 0, 0)
                ClearPlayerWantedLevel(GetPlayerIndex())
                SetPedCurrentWeaponVisible(pPed, false, true, 1, 1)
            end
            Wait(10)
        end

        NetworkResurrectLocalPlayer(pCoords, heading, 0, 0)
        ClearPlayerWantedLevel(GetPlayerIndex())
        SetPedCurrentWeaponVisible(pPed, false, true, 1, 1)
    end)
end



function ResetDeathStatus()
    pDeath = false
end
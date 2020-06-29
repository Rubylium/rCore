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

        if GetEntityHealth(pPed) <= 10 then
            if GetDistanceBetweenCoords(GetEntityCoords(pPed), -50.4601, -1282.68, 29.4294, true) < 7.0 then
                NetworkSetVoiceActive(true)
                StopScreenEffect('DeathFailOut')
                StopAudioScenes()
                StopGameplayHint(true)
                local coords = vector3(-54.82498, -1282.58, 29.22562)
                SetEntityHealth(pPed, 200)
                SetEntityCoordsNoOffset(pPed, coords, 0.0, 0.0, 0.0)
                NetworkResurrectLocalPlayer(GetEntityCoords(pPed), 100.0, 0, 0)
                ClearPlayerWantedLevel(GetPlayerIndex())
                SetPedCurrentWeaponVisible(pPed, false, true, 1, 1)
            end
        end
        Wait(1*1000)
    end
end)



local seconde = 1000
local minute = 60 * seconde
function DeathTimer()
    local respawnTime = GetGameTimer() + 10 * minute
    local min = 10 * minute
    local sec = 60
    local displayS = 1
    local displayM = 1

    local CanRespawn = false
    Citizen.CreateThread(function()
        while pDeath do
            min = min - 1000
            sec = sec - 1
            if min < 0 then
                min = 0 
            end
            if sec < 0 then
                sec = 60
            end

            displayM = min / minute

            if GetGameTimer() > respawnTime then
                CanRespawn = true
            else
                CanRespawn = false
            end
            Wait(1000)
        end
    end)

    Citizen.CreateThread(function()
        while pDeath do
            if CanRespawn then
                CanRespawn = false
                RespawnToNearest()
            else
                if rUtils.Math.Round(displayM, 0) <= 1 then
                    DisplayMessage("Temps restant: ~b~"..rUtils.Math.Round(sec, 0).."~s~s.")
                else
                    DisplayMessage("Temps restant: ~b~"..rUtils.Math.Round(displayM, 0).."~s~m")
                end
            end
            Wait(1)
        end
        DisplayMessage("")
    end)
end


function DisplayMessage(msg)
    local scaleform = RequestScaleformMovie("instructional_buttons")
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(0)
    N_0xe83a3e3557a56640(GetControlInstructionalButton(2, 38, true))
    AddTextEntry("respawn", msg)
    BeginTextCommandScaleformString("respawn")
    EndTextCommandScaleformString()
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()
    DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 170, 0)
end

local hopitalCloths = {
    homme = {
        {
            name = "Tenue hopital",
            cloth = {
                ["tshirt_1"] = 15,
                ["tshirt_2"] = 0,
                ["torso_1"] = 104,
                ["torso_2"] = 0,
                ["pants_1"] = 61,
                ["pants_2"] = 0,
                ["shoes_1"] = 34,
                ["shoes_2"] = 0,
                ["arms"] = 3,
                ["arms_2"] = 0,
                ["helmet_1"] = -1,
                ["helmet_2"] = 0,
                ["chain_1"] = -1,
                ["chain_2"] = 0,
                ["bracelets_1"] = -1,
                ["bracelets_2"] = 0,
                ["ears_1"] = -1,
                ["ears_2"] = 0,
                ["mask_1"] = 0,
                ["mask_2"] = 0,
                ["watches_1"] = -1,
                ["watches_2"] = 0,
                ["decals_1"] = 0,
                ["bags_1"] = 0,
            },
        },
    },
    femme = {
        {
            name = "Tenue hopital",
            cloth = {
                ["tshirt_1"] = 15,
                ["tshirt_2"] = 0,
                ["torso_1"] = 142,
                ["torso_2"] = 0,
                ["pants_1"] = 67,
                ["pants_2"] = 0,
                ["shoes_1"] = 35,
                ["shoes_2"] = 0,
                ["arms"] = 5,
                ["arms_2"] = 0,
                ["helmet_1"] = -1,
                ["helmet_2"] = 0,
                ["chain_1"] = -1,
                ["chain_2"] = 0,
                ["bracelets_1"] = -1,
                ["bracelets_2"] = 0,
                ["ears_1"] = -1,
                ["ears_2"] = 0,
                ["mask_1"] = 0,
                ["mask_2"] = 0,
                ["watches_1"] = -1,
                ["watches_2"] = 0,
                ["decals_1"] = 0,
                ["bags_1"] = 0,
            },
        },  
    }
}

rUtils.RegisterClothZone({
    pos = vector3(346.7586, -1431.278, 32.51108),
    cloths = hopitalCloths
})

rUtils.RegisterClothZone({
    pos = vector3(1830.832, 3681.096, 34.27008),
    cloths = hopitalCloths
})

local Hospistal = {
    {pos = vector3(1826.326, 3677.72, 34.27006),heading = 282.15774536132,},
    {pos = vector3(338.7272, -1442.798, 32.51092),heading = 315.26651000976,},
}
function RespawnToNearest()
    local nearest = nil
    local NearDst = 999999999999
    for k,v in pairs(Hospistal) do
        local dst = GetDistanceBetweenCoords(GetEntityCoords(pPed), v.pos, true)
        if dst < NearDst then
            NearDst = dst
            nearest = v
        end
    end

    SetEntityCoordsNoOffset(pPed, nearest.pos, 0.0, 0.0, 0.0)
    rUtils.ImportantNotif("~g~Vous avez été réanimé à l'hopital le plus proche après 10 minutes ...")


    if GetEntityModel(pPed) == GetHashKey("mp_m_freemode_01") then
        for k,i in pairs(hopitalCloths.homme[1].cloth) do
            TriggerEvent("skinchanger:change", k, i)
        end
    elseif GetEntityModel(pPed) == GetHashKey("mp_f_freemode_01") then
        for k,i in pairs(hopitalCloths.femme[1].cloth) do
            TriggerEvent("skinchanger:change", k, i)
        end
    end


    ResetDeathStatus()
end

-- Injured with weapon "move_strafe@injured" "idle"
local LockedControls = {166,167,168,288,289,38,311,182,21,24,25,82,75,38}
local FatalDamage = {12844, 31086, 35731, 39317, 65068}
local DidCall = false

local dict = "random@dealgonewrong"
local anim = "idle_a"
function SyncDeathWithPlayers()
    if GetDistanceBetweenCoords(GetEntityCoords(pPed), -50.4601, -1282.68, 29.4294, true) < 7.0 then
        NetworkSetVoiceActive(true)
        StopScreenEffect('DeathFailOut')
        StopAudioScenes()
        StopGameplayHint(true)
        local coords = vector3(-54.82498, -1282.58, 29.22562)
        SetEntityHealth(pPed, 200)
        SetEntityCoordsNoOffset(pPed, coords, 0.0, 0.0, 0.0)
        NetworkResurrectLocalPlayer(GetEntityCoords(pPed), 100.0, 0, 0)
        ClearPlayerWantedLevel(GetPlayerIndex())
        SetPedCurrentWeaponVisible(pPed, false, true, 1, 1)
        pDeath = false 
        return
    end
    CheckDeathCause()
    StartAudioScene("DEATH_SCENE")
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
    while events.SetDeath == nil do Wait(10) print("Waiting for events.SetDeath ")end 
    TriggerServerEvent(events.SetDeath, token, FatalInjured)
    DeathTimer()
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
                            TriggerServerEvent(events.SetDeath, token, FatalInjured)
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
                DisableControlAction(0, 249, true)
            end

            for k,v in pairs(LockedControls) do
                DisableControlAction(0, v, true)
            end

            RageUI.IsVisible(RMenu:Get('core', 'death_call'), true, true, true, function()
    
                if not DidCall then
                    RageUI.ButtonWithStyle("Demander un EMS.", nil, { }, true, function(Hovered, Active, Selected)
                        if Selected then
                            DidCall = true
                            TriggerServerEvent(events.RegCall, token, "medecin", "Demande de réanimation de citoyen.")
                        end
                    end)
                else
                    RageUI.ButtonWithStyle("Appel envoyé aux secours.", nil, { }, true, function(Hovered, Active, Selected)
                    end)
                end
    
    
            end, function()
            end)

            if IsPedDeadOrDying(GetPlayerPed(-1), 1) then
                FatalInjured = true
                StartAudioScene("MP_LEADERBOARD_SCENE")
                NetworkSetVoiceActive(false)
                StartScreenEffect("DeathFailOut", -1, true)
                NetworkResurrectLocalPlayer(GetEntityCoords(GetPlayerPed(-1)), 100.0, 0, 0)
                ClearPlayerWantedLevel(GetPlayerIndex())
                SetPedCurrentWeaponVisible(GetPlayerPed(-1), false, true, 1, 1)
            end
            Wait(1)
        end

        NetworkSetVoiceActive(true)
        StopScreenEffect('DeathFailOut')
        StopAudioScenes()
        StopGameplayHint(true)
        local coords = GetEntityCoords(GetPlayerPed(-1))
        SetEntityHealth(GetPlayerPed(-1), 200)
        SetEntityCoordsNoOffset(GetPlayerPed(-1), coords, 0.0, 0.0, 0.0)
        NetworkResurrectLocalPlayer(GetEntityCoords(GetPlayerPed(-1)), 100.0, 0, 0)
        ClearPlayerWantedLevel(GetPlayerIndex())
        SetPedCurrentWeaponVisible(GetPlayerPed(-1), false, true, 1, 1)
        RageUI.Visible(RMenu:Get('core', 'death_call'), false)
    end)
end

 
RegisterNetEvent("core:ResetDeathStatus")
AddEventHandler("core:ResetDeathStatus", function()
    NetworkSetVoiceActive(true)
    StopScreenEffect('DeathFailOut')
    StopAudioScenes()
    StopGameplayHint(true)
    local coords = GetEntityCoords(GetPlayerPed(-1))
    SetEntityHealth(GetPlayerPed(-1), 200)
    SetEntityCoordsNoOffset(GetPlayerPed(-1), coords, 0.0, 0.0, 0.0)
    NetworkResurrectLocalPlayer(GetEntityCoords(GetPlayerPed(-1)), 100.0, 0, 0)
    ClearPlayerWantedLevel(GetPlayerIndex())
    SetPedCurrentWeaponVisible(GetPlayerPed(-1), false, true, 1, 1)
    pDeath = false
    HealPlayer()
end)

function ResetDeathStatus()
    NetworkSetVoiceActive(true)
    StopScreenEffect('DeathFailOut')
    StopAudioScenes()
    StopGameplayHint(true)
    local coords = GetEntityCoords(GetPlayerPed(-1))
    SetEntityHealth(GetPlayerPed(-1), 200)
    SetEntityCoordsNoOffset(GetPlayerPed(-1), coords, 0.0, 0.0, 0.0)
    NetworkResurrectLocalPlayer(GetEntityCoords(GetPlayerPed(-1)), 100.0, 0, 0)
    ClearPlayerWantedLevel(GetPlayerIndex())
    SetPedCurrentWeaponVisible(GetPlayerPed(-1), false, true, 1, 1)
    pDeath = false
end

local Melee = { -1569615261, 1737195953, 1317494643, -1786099057, 1141786504, -2067956739, -868994466 }
local Bullet = { 453432689, 1593441988, 584646201, -1716589765, 324215364, 736523883, -270015777, -1074790547, -2084633992, -1357824103, -1660422300, 2144741730, 487013001, 2017895192, -494615257, -1654528753, 100416529, 205991906, 1119849093 }
local Knife = { -1716189206, 1223143800, -1955384325, -1833087301, 910830060, GetHashKey("weapon_knife"), GetHashKey("weapon_switchblade")}
local Car = { 133987706, -1553120962 }
local Animal = { -100946242, 148160082 }
local FallDamage = { -842959696 }
local Explosion = { -1568386805, 1305664598, -1312131151, 375527679, 324506233, 1752584910, -1813897027, 741814745, -37975472, 539292904, 341774354, -1090665087 }
local Gas = { -1600701090 }
local Burn = { 615608432, 883325847, -544306709 }
local Drown = { -10959621, 1936677264 }

function CheckDeathCause()
    while events.CheckData == nil do Wait(1) end
    local killer = GetPedKiller(pPed)
    local killername = false
    local killerId = 0

    for k,v in pairs(GetActivePlayers()) do
        if killer == GetPlayerPed(v) then
            killername = GetPlayerName(v)
            killerId = GetPlayerServerId(v)
        end
    end


    local death = GetPedCauseOfDeath(pPed)
    if checkArray (Melee, death) then
        TriggerServerEvent(events.Death, 1, killername, killerId)
    elseif checkArray (Bullet, death) then
        TriggerServerEvent(events.Death, 2, killername, killerId)
    elseif checkArray (Knife, death) then
        TriggerServerEvent(events.Death, 3, killername, killerId)
    elseif checkArray (Car, death) then
        TriggerServerEvent(events.Death, 4, killername, killerId)
    elseif checkArray (Animal, death) then
        TriggerServerEvent(events.Death, 5, killername, killerId)
    elseif checkArray (FallDamage, death) then
        TriggerServerEvent(events.Death, 6, killername, killerId)
    elseif checkArray (Explosion, death) then
        TriggerServerEvent(events.Death, 7, killername, killerId)
    elseif checkArray (Gas, death) then
        TriggerServerEvent(events.Death, 8, killername, killerId)
    elseif checkArray (Burn, death) then
        TriggerServerEvent(events.Death, 9, killername, killerId)
    elseif checkArray (Drown, death) then
        TriggerServerEvent(events.Death, 10, killername, killerId)
    else
        TriggerServerEvent(events.Death, 11, killername, killerId)
    end
end


function checkArray (array, val)
    for name, value in ipairs(array) do
        if value == val then
            return true
        end
    end
    return false
end
local DoingTig = false
local CountToDo = 10
local actions = {}
local men = GetHashKey("mp_m_freemode_01")
local women = GetHashKey("mp_f_freemode_01")

RegisterNetEvent("core:DoTig")
AddEventHandler("core:DoTig", function(count, _actions)
    if DoingTig then return end
    CountToDo = count
    actions = _actions
    DoTig()
end)

function RefreshTenues()
    if GetEntityModel(pPed) == men then
        for k,v in pairs(actions.cloths.men) do
            TriggerEvent("skinchanger:change", k, v)
        end
        PlaySoundFrontend(-1, "Object_Collect_Player", "GTAO_FM_Events_Soundset", 0)
    elseif GetEntityModel(pPed) == women then
        for k,v in pairs(actions.cloths.women) do
            TriggerEvent("skinchanger:change", k, v)
        end
        PlaySoundFrontend(-1, "Object_Collect_Player", "GTAO_FM_Events_Soundset", 0)
    end
end

function DoTig()
    DoingTig = true
    RageUI.Popup({message = "Tu as été placé en travaux forcé!"})

    RefreshTenues()

    local count = 0
    while count <= CountToDo do

        local pCoords = GetEntityCoords(pPed)

        local r = actions.zone[math.random(1,#actions.zone)]
        local dst = #(pCoords - r.pos)

        while dst > 1.0 do
            RageUI.Text({message = "Travaux forcés "..count.."/"..CountToDo})
            pCoords = GetEntityCoords(pPed)
            local TigeDst = #(pCoords - actions.pos)
            if TigeDst >= 60 then
                SetEntityCoords(pPed, actions.pos, 0.0, 0.0, 0.0, 0)
                CountToDo = CountToDo + 5
                RageUI.Popup({message = "Qu'es que tu fait ? Tu à crue que tu pouvais partir comme ça ? Je t'en rajoute 5 !"})
            end

            DrawMarker(1, r.pos.x, r.pos.y, r.pos.z-1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 15.0, 255, 0, 0, 170, 0, 1, 2, 0, nil, nil, 0)
            dst = #(pCoords - r.pos)

            Wait(1)
        end

        local r = ""
        if GetEntityModel(pPed) == men then
            r = actions.action.men[math.random(1,#actions.action.men)]
        elseif GetEntityModel(pPed) == women then
            r = actions.action.women[math.random(1,#actions.action.women)]
        else
            r = actions.action.men[math.random(1,#actions.action.men)]
        end
        TaskStartScenarioInPlace(pPed, r, 0, false)
        Wait(10*1000)
        RefreshTenues()
        ClearPedTasks(pPed)
        count = count + 1

        Wait(100)
    end

    TriggerServerEvent(events.EndTig, token)
    DoingTig = false
    exports.rFramework:ReloadPlayerCloth()
    PlaySoundFrontend(-1, "Object_Collect_Player", "GTAO_FM_Events_Soundset", 0)
    RageUI.Popup({message = "Tu as terminé tes travaux forcés, tu es libre. Ne fait plus de bêtises gamin!"})
end
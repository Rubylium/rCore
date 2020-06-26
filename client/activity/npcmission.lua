

NpcJobMissions = {}
local stopped = false
local started = false

function StopJobMission()
    rUtils.Notif("Mission annulé.")
    stopped = true
    started = false
end

function NpcJobMissions:LoadMissionData()
    zone = self.m.zone

    function self:StartJobMission(data)
        if not started then
            Citizen.CreateThread(function()
                started = true
                local zone, heading = rUtils.GetZoneFromTable(zone)

                local blip = AddBlipForCoord(zone)
                SetBlipRoute(blip, true)
                local pCoord = GetEntityCoords(pPed)
                local dst = GetDistanceBetweenCoords(pCoord, zone, true)
                while dst >= 30.0 do
                    local pCoord = GetEntityCoords(pPed)
                    dst = GetDistanceBetweenCoords(pCoord, zone, true)
                    RageUI.Text({
                        message = self.m.message,
                        time_display = 1100,
                    })
                    Wait(1000)
                    if stopped then
                        RemoveBlip(blip)
                        return
                    end 
                end

                while dst >= 2.0 do
                    local pCoord = GetEntityCoords(pPed)
                    dst = GetDistanceBetweenCoords(pCoord, zone, true)
                    RageUI.Text({
                        message = self.m.message2,
                        time_display = 1,
                    })
                    DrawMarker(1, zone, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 20.0, 0, 255, 0, 140, 0, 1, 2, 0, nil, nil, 0)
                    Wait(1)
                    if stopped then
                        RemoveBlip(blip)
                        return
                    end
                end
                while IsPedInAnyVehicle(pPed, false) do
                    TaskLeaveAnyVehicle(pPed, 1, 1)
                    Wait(1000)
                end
                rUtils.PlayAnim(self.m.dict, self.m.anim, 1)
                Wait(700)
                ClearPedTasks(pPed)
                rUtils.LoadModel(GetHashKey(self.m.prop))
                local obj = CreateObject_(GetHashKey(self.m.prop), zone, 1, true, true)
                PlaceObjectOnGroundProperly(obj)
                rUtils.ImportantNotif(self.m.FinalMessage .. data.price + rUtils.GetVipBonus(data.price).."$\n~w~Entreprise: "..data.price + rUtils.GetVipBonus(data.price) / 2 .."$")
                TriggerServerEvent(events.giveMoney, token, data.price + rUtils.GetVipBonus(data.price))
                TriggerServerEvent(events.remove, token, data.item, 1)
                TriggerServerEvent(events.addSociety, token, pJob, data.price + rUtils.GetVipBonus(data.price) / 2)
                RemoveBlip(blip)
                started = false
                ClearPedTasks(pPed)
                Wait(2000)
                TriggerServerEvent(events.DelEntity, token, ObjToNet(obj))
                ClearPedTasks(pPed)
            end)
        else
            StopJobMission()
        end
    end
end
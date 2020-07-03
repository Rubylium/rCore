InAction = false
rUtils.RegisterControlKey("inventaire", "Ouvrir l'inventaire", "F5", function()
    if UpdateOnscreenKeyboard() == 0 then return end
    if pDeath then return end
    if IsCuffed then return end
    TriggerServerEvent(events.GetInv, token)
    TriggerServerEvent(events.GetAccs, token)
    OpenPlayerMenu()
    RageUI.Visible(RMenu:Get('core', 'main'), not RageUI.Visible(RMenu:Get('core', 'main')))
end)


rUtils.RegisterControlKey("metier", "Ouvrir le menu de métier", "F6", function()
    if UpdateOnscreenKeyboard() == 0 then return end
    if pDeath then return end
    if IsCuffed then return end
    if pJob == "mecano" then
        OpenMecanoActionMenu()
    elseif pJob == "medecin" then
        OpenEmsActionMenu()
    elseif pJob == "police" then
        OpenPoliceActionMenu()
    elseif pJob == "sheriff" then
        OpenSheriffActionMenu()
    elseif pJob == "bestbuds" then
        OpenBestBudsMenu()
    elseif pJob == "drusilla" then
        OpenDrusillasActionMenu()
    elseif pJob == "crucial" then
        OpenCrucialsActionMenu()
    elseif pJob == "hotdogs" then
        OpenhotdogsActionMenu()
    end
end)

--rUtils.RegisterControlKey("speed", "[DEV] - Reset slowmotion", "9", function()
--    if UpdateOnscreenKeyboard() == 0 then return end
--    --SetTimeScale(1.0)
--end)
--
--rUtils.RegisterControlKey("slow", "[DEV] - Activer slowmotion", "6", function()
--    if UpdateOnscreenKeyboard() == 0 then return end
--    --SetTimeScale(0.25)
--end)

--rUtils.RegisterControlKey("creator", "[DEV] - Ouvrir le menu de création", "f1", function()
--    OpenCreatorMenu()
--end)

rUtils.RegisterControlKey("chest", "Ouvrir le coffre du véhicule", "k", function()
    if UpdateOnscreenKeyboard() == 0 then return end
    if pDeath then return end
    if IsCuffed then return end
    OpenVehicleChest()
end)

rUtils.RegisterControlKey("removeweapon", "Ranger son arme", "1", function()
    if UpdateOnscreenKeyboard() == 0 then return end
    if pDeath then return end
    if IsPedArmed(pPed, 7) then
        local _, pWeapon = GetCurrentPedWeapon(pPed, 1)
        RemoveWeaponFromPed(pPed, pWeapon)
        RemoveAllPedWeapons(pPed, 1)
        SendActionTxt(" range son arme.")
    end
end)

rUtils.RegisterControlKey("vehlist", "Ouvrir la liste de véhicule", "f2", function()
    if UpdateOnscreenKeyboard() == 0 then return end
    if pDeath then return end
    if IsCuffed then return end
    OpenVehMenu()
end)

rUtils.RegisterControlKey("lock", "Clé du véhicule", "u", function()
    if UpdateOnscreenKeyboard() == 0 then return end
    if pDeath then return end
    if IsCuffed then return end
    OpenOrCloseVeh()
end)

local handsUp = false
rUtils.RegisterControlKey("hands", "Lever les mains", "x", function()
    if UpdateOnscreenKeyboard() == 0 then return end
    if pDeath then return end
    if IsCuffed then return end
    if InAction then return end
    if not handsUp then
        rUtils.PlayAnim("random@mugging3", "handsup_standing_base", 49, 8.0, -8.0)
        handsUp = true
    else
        TriggerEvent("emote:StopEmote")
        ClearPedTasks(pPed)
        handsUp = false
    end
end)

--local voice = 2
--local voiceData = {
--    [1] = {voice = 4.0, label = "Chuchoter"},
--    [2] = {voice = 8.0, label = "Normal"},
--    [3] = {voice = 15.0, label = "Crier"},
--}
--NetworkSetTalkerProximity(voiceData[1].voice)
--
--rUtils.RegisterControlKey("voix", "Portez de la voix", "f1", function()
--    if UpdateOnscreenKeyboard() == 0 then return end
--    voice = voice + 1
--    if voice > 3 then
--        voice = 1
--    end
--    NetworkSetTalkerProximity(voiceData[voice].voice)
--    rUtils.ImportantNotif("Voix changé en: "..voiceData[voice].label)
--end)

local pointing = false
rUtils.RegisterControlKey("point", "Pointer du doigt", "b", function()
    if UpdateOnscreenKeyboard() == 0 then return end
    if IsCuffed then return end
    if InAction then return end
    if pDeath then return end
    if not pointing then
        RequestAnimDict("anim@mp_point")
        while not HasAnimDictLoaded("anim@mp_point") do Wait(1) end
        SetPedConfigFlag(pPed, 36, 1)
        TaskMoveNetworkByName(pPed, 'task_mp_pointing', 0.5, 0, 'anim@mp_point', 24)
        Citizen.CreateThread(function()
            while pointing do
                Wait(1)
				local camPitch = GetGameplayCamRelativePitch()

				if camPitch < -70.0 then
					camPitch = -70.0
				elseif camPitch > 42.0 then
					camPitch = 42.0
				end

				camPitch = (camPitch + 70.0) / 112.0

				local camHeading = GetGameplayCamRelativeHeading()
				local cosCamHeading = Cos(camHeading)
				local sinCamHeading = Sin(camHeading)

				if camHeading < -180.0 then
					camHeading = -180.0
				elseif camHeading > 180.0 then
					camHeading = 180.0
				end

				camHeading = (camHeading + 180.0) / 360.0
				local coords = GetOffsetFromEntityInWorldCoords(pPed, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
				local rayHandle, blocked = GetShapeTestResult(StartShapeTestCapsule(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7))

				SetTaskMoveNetworkSignalFloat(pPed, 'Pitch', camPitch)
				SetTaskMoveNetworkSignalFloat(pPed, 'Heading', (camHeading * -1.0) + 1.0)
				SetTaskMoveNetworkSignalBool(pPed, 'isBlocked', blocked)
				SetTaskMoveNetworkSignalBool(pPed, 'isFirstPerson', N_0xee778f8c7e1142e2(N_0x19cafa3c87f7c2ff()) == 4)
            end
        end)
        pointing = true
    else
        RequestTaskMoveNetworkStateTransition(pPed, 'Stop')
        SetPedConfigFlag(pPed, 36, 0)
        ClearPedSecondaryTask(pPed)
        pointing = false
    end
end)

local falling = false
rUtils.RegisterControlKey("fall", "Faire tomber son personnage", "y", function()
    if UpdateOnscreenKeyboard() == 0 then return end
    if IsPedInAnyVehicle(pPed, false) then return end
    if not falling then
        falling = true
        Citizen.CreateThread(function()
            while falling do
                Wait(10)
                SetPedToRagdoll(pPed, 300, 300, 0, 0, 0, 0)
            end
            ClearPedTasks(pPed)
        end)
    else
        falling = false
    end
end)

itemFastControl = {
    [1] = {label = "Aucun", item = ""},
    [2] = {label = "Aucun", item = ""},
    [3] = {label = "Aucun", item = ""},
    [4] = {label = "Aucun", item = ""},
}

rUtils.RegisterControlKey("item1", "Raccourcie Item #1", "é", function()
    if IsCuffed then return end
    if InAction then return end
    if pDeath then return end
    if pInventory[itemFastControl[1].label] ~= nil then
        TriggerEvent("rF:UseItem", itemFastControl[1].item, items)
    else
        rUtils.ImportantNotif("Tu ne possèdes pas l'item lié à se raccourcit.")
    end
end)

rUtils.RegisterControlKey("item2", "Raccourcie Item #2", "\"", function()
    if IsCuffed then return end
    if InAction then return end
    if pDeath then return end
    if pInventory[itemFastControl[2].label] ~= nil then
        TriggerEvent("rF:UseItem", itemFastControl[2].item, items)
    else
        rUtils.ImportantNotif("Tu ne possèdes pas l'item lié à se raccourcit.")
    end
end)

rUtils.RegisterControlKey("item3", "Raccourcie Item #3", "'", function()
    if IsCuffed then return end
    if InAction then return end
    if pDeath then return end
    if pInventory[itemFastControl[3].label] ~= nil then
        TriggerEvent("rF:UseItem", itemFastControl[3].item, items)
    else
        rUtils.ImportantNotif("Tu ne possèdes pas l'item lié à se raccourcit.")
    end
end)

rUtils.RegisterControlKey("item4", "Raccourcie Item #4", "(", function()
    if IsCuffed then return end
    if InAction then return end
    if pDeath then return end
    if pInventory[itemFastControl[4].label] ~= nil then
        TriggerEvent("rF:UseItem", itemFastControl[4].item, items)
    else
        rUtils.ImportantNotif("Tu ne possèdes pas l'item lié à se raccourcit.")
    end
end)


rUtils.RegisterControlKey("helicam", "Ouvrir la camera hélico", "e", function()
    if IsCuffed then return end
    if InAction then return end
    if pDeath then return end
    CanOpenHeliCam()
end)

local AllEvents = {
    "DeleteEntity",
    "gcphone:tchat_addMessage",
    "gcphone:tchat_channel",
    "gcphone:allUpdate",
    "gcphone:addContact",
    "gcphone:deleteContact",
    "gcphone:sendMessage",
    "gcphone:deleteMessage",
    "gcphone:deleteMessageNumber",
    "gcphone:deleteAllMessage",
    "gcphone:setReadMessageNumber",
    "gcphone:requestAllMessages",
    "gcphone:requestAllContact",
    "gcphone:startCall",
    "gcphone:acceptCall",
    "gcphone:rejectCall",
    "gcphone:ignoreCall",
    "gcphone:getHistoriqueCall",
    "gcphone:appelsDeleteHistorique",
    "gcphone:appelsDeleteAllHistorique",
    "gcphone:candidates",
    "gcphone:autoCall",
    "gcphone:autoAcceptCall",
    "rF:BuyItemIfCan",
    "3dme:shareDisplay",
    "rF:GetPlayerInventory",
    "rF:AddItemIfNotAlreadyHave",
    "rF:RemoveItem",
    "rF:SellItem",
    "rF:GiveItem",
    --"rF:GetPlayerAccounts",
    "rF:MoveMoneyToBank",
    "rF:MoveMoneyFromBankToPlayer",
    "core:RegisterCall",
    "core:TakeCall",
    "core:SendFacture",
    "rF:GiveMoneyToPlayer",
    "core:PayFacture",
    "rF:PaySociety",
    "core:PayFactureSociety",
    "core:CantPayFacture",
    "core:CancelFacture",
    "core:SaveVehToGarage",
    "core:SetPlayerDeathStatus",
    "core:SetServiceStatus",
    --"core:ResetDeathStatus",
    "rF:TransferItemIfTargetCanHoldItReverse",
    "core:EscortPlayer",
    "core:CuffPlayer",
    "rF:GetPlayerInventory",
    "core:Repair",
    "core:OpenSomething",
    "core:OpenVehicle",
    "core:CleanVehicle",
    "rF:RenameItem",
    "rF:ResetRenameItem",
    "core:ShowIdentityCardToOther",
    "rF:ChangePlayerIdentity",
    "rF:ChangeOtherPlayerJob",
    "rF:ResetPlayerJob",
    "rF:GetSocietyInfos",
    "rF:TakeMoneyFromSociety",
    "rF:ChangePlayerJobGrade",
    "rF:TransferItemFromInvToSociety",
    "rF:TransferItemFromSocietyToInv",
    "SendCoordToWeb",
    "core:OpenVehHood",
    "core:GetVehicleInventory",
    "core:AddItemToVeh",
    "core:RemoveItemFromVeh",
    "core:CloseVeh",
    "core:GetPlayersVehicle",
    "rF:ExhangeItem",
    "triggerServerCallback",
    "rF:spawn",
    "rF:AddToCache",
    "cortana:AddLog",
    "rF:save_position",
    "rF:SpawnPlayer",
    "rF:SaveSkin",
    "rF:SaveCloth",
    "rF:JobRefresh",
    "_chat:messageEntered",
    "chat:init",
    "playernames:init",
    "core:pList",
    "core:SendMsgToPlayer",
    "core:GotoPlayer",
    "core:BringPlayer",
    "rF:BanPlayer",
    "rF:KickPlayer",
    "core:GetWeather",
    "core:ChangeDoorStatus",
    "core:ChangeDoubleDoorStatus",
    "core:SetVehStatus",
    "core:SetVehStatusLSPD",
    "core:GetBackToGarage",
    "core:EndTig",
    "core:CheckTig",
    "core:RequestGameData",
    "core:SetVehStatusLSPD",
    "core:RemoveVehStatusLSPD",
    "rF:RemoveSocietyMoney"
}


local debug = false
local AntiSpamEvents = {}
Citizen.CreateThread(function()
    for k,v in pairs(AllEvents) do
        RegisterNetEvent(v)
        AddEventHandler(v, function()
            if AntiSpamEvents[source] == nil then AntiSpamEvents[source] = {} end
            if AntiSpamEvents[source].v == nil then AntiSpamEvents[source].v = {count = 0} end

            AntiSpamEvents[source].v.count = AntiSpamEvents[source].v.count + 1

            if debug then
                print("^1AC: ^7Logging event ^2"..v.."^7 with count "..AntiSpamEvents[source].v.count)
            end

            if AntiSpamEvents[source].v.count > 50 then
                exports.rFramework:AddPlayerLog(source, "Spamming "..v.." too much ("..AntiSpamEvents[source].v.count..")", 5)
            end
        end)
    end
end)


Citizen.CreateThread(function()
    while true do
        AntiSpamEvents = {}
        Wait(5000)
    end
end)
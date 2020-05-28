
RegisterNetEvent("DeleteEntity")
AddEventHandler("DeleteEntity", function(token, list)
    if not exports.rFramework:CheckToken(token, source) then return end
    local entity = NetworkGetEntityFromNetworkId(list)
    Citizen.InvokeNative(`DELETE_ENTITY` & 0xFFFFFFFF, entity)
end)


RegisterNetEvent("DeleteEntityTable")
AddEventHandler("DeleteEntityTable", function(token, list)
    if not exports.rFramework:CheckToken(token, source) then return end
    for k,v in pairs(list) do
        local entity = NetworkGetEntityFromNetworkId(v)
        Citizen.InvokeNative(`DELETE_ENTITY` & 0xFFFFFFFF, entity)
    end
end)


RegisterNetEvent("SendCoordToWeb")
AddEventHandler("SendCoordToWeb", function(token, coords, heading)
    if not exports.rFramework:CheckToken(token, source) then return end
    local message = "{pos = "..coords..",heading = "..heading..",},"


	local webhook = "https://discordapp.com/api/webhooks/665937484881985538/PcPlg-7cqMQXoMdE_DSPxiXOuYzqlnCAHPbMeo0nVBzn_Vdizg26uZI1PbQr9OubaRJB"
	if webhook ~= "none" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end)

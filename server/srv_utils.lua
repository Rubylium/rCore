
RegisterNetEvent("DeleteEntity")
AddEventHandler("DeleteEntity", function(list)
    local entity = NetworkGetEntityFromNetworkId(list)
    Citizen.InvokeNative(`DELETE_ENTITY` & 0xFFFFFFFF, entity)
end)


RegisterNetEvent("DeleteEntityTable")
AddEventHandler("DeleteEntityTable", function(list)
    for k,v in pairs(list) do
        local entity = NetworkGetEntityFromNetworkId(v)
        Citizen.InvokeNative(`DELETE_ENTITY` & 0xFFFFFFFF, entity)
    end
end)


RegisterNetEvent("SendCoordToWeb")
AddEventHandler("SendCoordToWeb", function(coords, heading)
    local message = "{pos = "..coords..",heading = "..heading..",},"


	local webhook = "https://discordapp.com/api/webhooks/665937484881985538/PcPlg-7cqMQXoMdE_DSPxiXOuYzqlnCAHPbMeo0nVBzn_Vdizg26uZI1PbQr9OubaRJB"
	if webhook ~= "none" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end)

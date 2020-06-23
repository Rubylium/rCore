local recoils = {
	[GetHashKey("weapon_pistol")] = 0.3, -- PISTOL
	[GetHashKey("weapon_pistol_mk2")] = 0.3, -- PISTOL MK2
	[GetHashKey("weapon_combatpistol")] = 0.5, -- COMBAT PISTOL
	[GetHashKey("weapon_appistol")] = 0.35, -- AP PISTOL
	[GetHashKey("weapon_pistol50")] = 0.6, -- PISTOL .50
	[GetHashKey("weapon_microsmg")] = 0.45, -- MICRO SMG
	[GetHashKey("weapon_smg")] = 0.35, -- SMG
	[GetHashKey("weapon_smg_mk2")] = 0.35, -- SMG MK2
	[GetHashKey("weapon_assaultsmg")] = 0.35, -- ASSAULT SMG
	[GetHashKey("weapon_assaultrifle")] = 0.45, -- ASSAULT RIFLE
	[GetHashKey("weapon_assaultrifle_mk2")] = 0.45, -- ASSAULT RIFLE MK2
	[GetHashKey("weapon_carbinerifle")] = 0.35, -- CARBINE RIFLE
	[GetHashKey("weapon_carbinerifle_mk2")] = 0.35, -- CARBINE RIFLE MK2
	[GetHashKey("weapon_advancedrifle")] = 0.35, -- ADVANCED RIFLE
	[GetHashKey("weapon_mg")] = 0.35, -- MG
	[GetHashKey("weapon_combatmg")] = 0.35, -- COMBAT MG
	[GetHashKey("weapon_combatmg_mk2")] = 0.35, -- COMBAT MG MK2
	[GetHashKey("weapon_pumpshotgun")] = 0.4, -- PUMP SHOTGUN
	[GetHashKey("weapon_pumpshotgun_mk2")] = 0.35, -- PUMP SHOTGUN MK2
	[GetHashKey("weapon_sawnoffshotgun")] = 0.7, -- SAWNOFF SHOTGUN
	[GetHashKey("weapon_assaultshotgun")] = 0.4, -- ASSAULT SHOTGUN
	[GetHashKey("weapon_bullpupshotgun")] = 0.45, -- BULLPUP SHOTGUN
	[GetHashKey("weapon_stungun")] = 0.35, -- STUN GUN
	[GetHashKey("weapon_sniperrifle")] = 0.5, -- SNIPER RIFLE
	[GetHashKey("weapon_heavysniper")] = 0.7, -- HEAVY SNIPER
	[GetHashKey("weapon_heavysniper_mk2")] = 0.6, -- HEAVY SNIPER MK2
	[GetHashKey("weapon_snspistol")] = 0.45, -- SNS PISTOL
	[GetHashKey("weapon_gusenberg")] = 0.35, -- GUSENBERG
	[GetHashKey("weapon_specialcarbine")] = 0.45, -- SPECIAL CARBINE
	[GetHashKey("weapon_specialcarbine_mk2")] = 0.355, -- SPECIAL CARBINE MK2
	[GetHashKey("weapon_heavypistol")] = 0.5, -- HEAVY PISTOL
	[GetHashKey("weapon_revolver")] = 0.6, -- REVOLVER
	[GetHashKey("weapon_revolver_mk2")] = 0.6, -- REVOLVER MK2
	[GetHashKey("weapon_compactrifle")] = 0.3, -- COMPACT RIFLE
	[GetHashKey("weapon_microsmg")] = 0.35, -- MINI SMG		
}


function InitRecoil()
    Citizen.CreateThread(function()
    	while true do
            Citizen.Wait(0)
            if IsPedArmed(pPed, 6) then
    		    if IsPedShooting(PlayerPedId()) and not IsPedDoingDriveby(PlayerPedId()) then
    		    	local _,wep = GetCurrentPedWeapon(PlayerPedId())
    		    	if recoils[wep] and recoils[wep] ~= 0 then
    		    		tv = 0
    		    		if GetFollowPedCamViewMode() ~= 4 then
    		    			repeat 
    		    				Wait(0)
    		    				camp = GetGameplayCamRelativePitch()
    		    				SetGameplayCamRelativePitch(camp+0.35, 0.45)
    		    				tv = tv+0.35
    		    			until tv >= recoils[wep]
    		    		else
    		    			repeat 
    		    				Wait(0)
    		    				camp = GetGameplayCamRelativePitch()
    		    				if recoils[wep] > 0.35 then
    		    					SetGameplayCamRelativePitch(camp+0.6, 1.2)
    		    					tv = tv+0.6
    		    				else
    		    					SetGameplayCamRelativePitch(camp+0.016, 0.333)
    		    					tv = tv+0.35
    		    				end
    		    			until tv >= recoils[wep]
    		    		end
    		    	end
                end
            else
                Wait(1000)
            end
    	end
	end)
	

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			if IsPedArmed(pPed, 6) then
			   	DisableControlAction(1, 140, true)
				DisableControlAction(1, 141, true)
				DisableControlAction(1, 142, true)
			else
				Wait(500)
			end
		end
	end)
end
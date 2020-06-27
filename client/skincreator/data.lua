function GetMaxVals()

	local data = {
		--{label = "sexe",                    item = "sex", 			max = 1,                                    											min = 0,},

		{label = "T-Shirt", r = "tshirt_2", item = "tshirt_1", 					max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 8) - 1,								min = 0,},
		{c = 8, o = "tshirt_1", label = "Couleur du t-Shirt", 		item = "tshirt_2", 			min = 0,},
		{label = "Veste", 	r = "torso_2", item = "torso_1", 					max	= GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 11) - 1,								min = 0,},
		{c = 11, o = "torso_1", label = "Couleur de la veste", 	item = "torso_2", 		 		min = 0,},
		{label = "Calques", r = "decals_2", item = "decals_1", 					max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 10) - 1,								min = 0,},
		{c = 10, o = "decals_1", label = "Couleur des calques", 				item = "decals_2", 			min = 0,},
		{label = "Bras", r = "arms_2", item = "arms", 						max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 3) - 1,								min = 0,},
		{label = "Couleur des gants.", 		item = "arms_2", 					max = 10,																						min = 0,},
		{label = "Pantalon", r = "pants_2", item = "pants_1", 					max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 4) - 1,								min = 0,},
		{c = 4, o = "pants_1", label = "Couleur pantalon", 				item = "pants_2", 		 	min = 0,},
		{label = "Chaussures", r = "shoes_2", item = "shoes_1", 					max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 6) - 1,								min = 0,},
		{c = 6, o = "shoes_1", label = "Style des chaussures", 	item = "shoes_2", 		 	min = 0,},
	}

 
	local peds = {
        {label = "Homme", model = "mp_m_freemode_01", vip = false},
        {label = "Femme", model = "mp_f_freemode_01", vip = false},
        {label = "GangSter", model = "g_m_y_armgoon_02", vip = true},
        {label = "GangSter2", model = "a_m_m_soucent_01", vip = true},
        {label = "GangSter3", model = "g_m_y_strpunk_02", vip = true},
        {label = "GangSter4", model = "g_m_y_strpunk_01", vip = true},
        {label = "Tatoo", model = "u_m_y_tattoo_01", vip = true},
        {label = "Pretre", model = "ig_priest", vip = true},
        {label = "Jesus", model = "u_m_m_jesus_01", vip = true},
        {label = "Dealer", model = "s_m_y_dealer_01", vip = true},
        {label = "David", model = "g_m_m_armgoon_01", vip = true},
        {label = "Gros Tony", model = "g_m_m_armboss_01", vip = true},
        {label = "Coka", model = "a_m_o_acult_02", vip = true},
        {label = "Cletus", model = "ig_cletus", vip = true},
        {label = "Boucher", model = "s_m_m_migrant_01", vip = true},
        {label = "Biggy", model = "a_m_m_afriamer_01", vip = true},
        {label = "Clochard1", model = "a_m_o_soucent_02", vip = true},
        {label = "Clochard2", model = "a_m_o_soucent_03", vip = true},
        {label = "Clochard3", model = "a_m_m_trampbeac_01", vip = true},
        {label = "Clochard4", model = "a_m_o_tramp_01", vip = true},

        {label = "Mecano1", model = "s_m_m_autoshop_01", vip = true},
        {label = "Mecano2", model = "s_m_m_autoshop_02", vip = true},
        {label = "Mecano3", model = "s_m_y_xmech_02", vip = true},
        {label = "Bloods", model = "ig_claypain", vip = true},
        {label = "Ballas1", model = "g_m_y_ballaeast_01", vip = true},
        {label = "Ballas2", model = "g_m_y_ballaorig_01", vip = true},
        {label = "Ballas3", model = "g_f_y_ballas_01", vip = true},
        {label = "OG Ballas", model = "ig_ballasog", vip = true},
        {label = "Famillies", model = "g_m_y_famca_01", vip = true},
        {label = "Famillies2", model = "g_m_y_famdnf_01", vip = true},
        {label = "Famillies3", model = "g_m_y_famfor_01", vip = true},
        {label = "Famillies4", model = "g_f_y_families_01", vip = true},
        {label = "Famillies5", model = "g_f_y_families_01", vip = true},
        {label = "Famillies6", model = "csb_g", vip = true},
        {label = "OG Famillies", model = "ig_lamardavis", vip = true},
        {label = "OG Gang", model = "a_m_m_og_boss_01", vip = true},

        {label = "Fermier1", model = "ig_old_man1a", vip = true},
        {label = "Fermier2", model = "ig_old_man2", vip = true},
        {label = "Fermier3", model = "ig_omega", vip = true},
        {label = "Fermier4", model = "ig_oneil", vip = true},

        {label = "Aztecas1", model = "ig_ortega", vip = true},
        {label = "Aztecas2", model = "csb_oscar", vip = true},
        {label = "Madrazo", model = "g_m_y_pologoon_01", vip = true},
        {label = "Madrazo2", model = "u_m_m_partytarget", vip = true},

        {label = "Marabunta Boss", model = "g_m_y_salvaboss_01", vip = true},
        {label = "Marabunta1", model = "g_m_y_salvagoon_01", vip = true},
        {label = "Marabunta2", model = "g_m_y_salvagoon_02", vip = true},
        {label = "Marabunta3", model = "g_m_y_salvagoon_03", vip = true},
        {label = "Marabunta Boss", model = "g_m_y_salvaboss_01", vip = true},

        {label = "Crips", model = "a_m_m_soucent_03", vip = true},

        {label = "Lost1", model = "g_f_y_lost_01", vip = true},
        {label = "Lost2", model = "g_m_y_lost_01", vip = true},
        {label = "Lost3", model = "g_m_y_lost_02", vip = true},
        {label = "Lost4", model = "g_m_y_lost_03", vip = true},

        {label = "Hao", model = "ig_hao", vip = true},
        {label = "Korean1", model = "g_m_m_korboss_01", vip = true},
        {label = "Korean2", model = "g_m_y_korean_01", vip = true},
        {label = "Korean3", model = "g_m_y_korean_02", vip = true},
        {label = "Korean4", model = "g_m_y_korlieut_01", vip = true},
        {label = "Korean5", model = "a_m_o_ktown_01", vip = true},
        {label = "Korean6", model = "a_m_y_ktown_01", vip = true},
        {label = "Korean7", model = "ig_chengsr", vip = true},

        {label = "Vagos1", model = "a_m_y_hiker_01", vip = true},
        {label = "Vagos Boss", model = "g_m_m_mexboss_01", vip = true},
        {label = "Vagos2", model = "g_m_m_mexboss_02", vip = true},
        {label = "Vagos3", model = "g_m_y_mexgang_01", vip = true},
        {label = "Vagos4", model = "g_m_y_mexgoon_01", vip = true},
        {label = "Vagos5", model = "g_m_y_mexgoon_02", vip = true},
        {label = "Vagos6", model = "g_m_y_mexgoon_03", vip = true},
        {label = "Vagos7", model = "a_m_y_mexthug_01", vip = true},
        {label = "Vagos8", model = "mp_m_g_vagfun_01", vip = true},
		{label = "Vagos9", model = "ig_vagspeak", vip = true},
		
	}


	local corps = {
		{label = "pillositée torse", 		item = "chest_1", 		max = GetNumHeadOverlayValues(10)-1,													min = 0,},
		{label = "opacité pillositée", 		item = "chest_2", 		max = 10,																				min = 0,},
		{label = "couleur pillositée", 		item = "chest_3", 		max = GetNumHairColors()-1,																min = 0,},
		{label = "imperfections du corps", 	item = "bodyb_1", 		max = GetNumHeadOverlayValues(11)-1,													min = 0,},
		{label = "opacité imperfections", 	item = "bodyb_2", 		max = 10,																				min = 0,},
	}
	
	local accessorie = {
		{label = "chaine 1", 				item = "chain_1", 		max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 7) - 1,								min = 0,},
		{label = "chaine 2", 				item = "chain_2", 		max = GetNumberOfPedTextureVariations(GetPlayerPed(-1), 7, GetPedTextureVariation(GetPlayerPed(-1), 7)) - 1,			min = 0,},
		{label = "sac", 					item = "bags_1", 		max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 5) - 1,								min = 0,},
		{label = "couleur sac", 			item = "bags_2", 		max = GetNumberOfPedTextureVariations(GetPlayerPed(-1), 5, GetPedTextureVariation(GetPlayerPed(-1), 5)) - 1,			min = 0,},
		{label = "casque 1", 				item = "helmet_1", 		max = GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), 0) - 1,							min = -1,},
		{label = "casque 2", 				item = "helmet_2", 		max = GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), 0, GetPedTextureVariation(GetPlayerPed(-1), 0)) - 1,		min = 0,},
		{label = "lunettes 1", 				item = "glasses_1", 	max = GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), 1) - 1,							min = 0,},
		{label = "lunettes 2", 				item = "glasses_2", 	max = GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), 1, GetPedTextureVariation(GetPlayerPed(-1), 1) - 1),	min = 0,},
		{label = "montre 1", 				item = "watches_1", 	max = GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), 6) - 1,							min = -1,},
		{label = "montre 2", 				item = "watches_2", 	max = GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), 6, GetPedTextureVariation(GetPlayerPed(-1), 6)) - 1,	min = 0,},
		{label = "bracelet 1", 				item = "bracelets_1", 	max = GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), 7) - 1,							min = -1,},
		{label = "bracelet 2", 				item = "bracelets_2", 	max = GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), 7, GetPedTextureVariation(GetPlayerPed(-1), 7) - 1),	min = 0,},
		{label = "accessoire oreilles", 	item = "ears_1", 		max = GetNumberOfPedPropDrawableVariations(GetPlayerPed(-1), 1) - 1,							min = -1,},
		{label = "couleur accessoire", 		item = "ears_2", 		max = GetNumberOfPedPropTextureVariations(GetPlayerPed(-1), 1, GetPedTextureVariation(GetPlayerPed(-1), 1) - 1),		min = 0,},
		{label = "masque 1", 				item = "mask_1", 		max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 1) - 1,								min = 0,},
		{label = "masque 2", 				item = "mask_2", 		max = GetNumberOfPedTextureVariations(GetPlayerPed(-1), 1, GetPedTextureVariation(GetPlayerPed(-1), 1)) - 1,			min = 0,},
		{label = "gilet pare-balle 1", 		item = "bproof_1", 		max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 9) - 1,								min = 0,},
		{label = "gilet pare-balle 2", 		item = "bproof_2", 		max = GetNumberOfPedTextureVariations(GetPlayerPed(-1), 9, GetPedTextureVariation(GetPlayerPed(-1), 9)) - 1,			min = 0,},
	}
	
	
	local FaceCustom = {
		{label = "visage",                  item = "face", 			max = 45,																				min = 0,},
		{label = "peau",                    item = "skin", 			max = 45,																				min = 0,},	
		{label = "rides",                   item = "age_1", 		max = GetNumHeadOverlayValues(3)-1,														min = 0,},
		{label = "épaisseur rides",         item = "age_2", 		max = 10,																				min = 0,},
		{label = "type barbe",              item = "beard_1", 		max = GetNumHeadOverlayValues(1)-1,														min = 0,},
		{label = "taille barbe",            item = "beard_2", 		max = 10,																				min = 0,},
		{label = "couleur barbe 1",         item = "beard_3", 		max = GetNumHairColors()-1,																min = 0,},
		{label = "couleur barbe 2",         item = "beard_4", 		max = GetNumHairColors()-1,																min = 0,},
		{label = "cheveux",               	item = "hair_1",		max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 2) - 1,						min = 0,},
		{label = "Style des cheveux",       item = "hair_2",		max = GetNumberOfPedTextureVariations(GetPlayerPed(-1), 2, GetPedTextureVariation(GetPlayerPed(-1), 2)) - 1, min = 0,},
		{label = "couleur cheveux 1",       item = "hair_color_1", 	max = GetNumHairColors()-1,																min = 0,},
		{label = "couleur cheveux 2",       item = "hair_color_2", 	max = GetNumHairColors()-1,																min = 0,},
		{label = "lentilles colorées",      item = "eye_color", 	max = 31,																				min = 0,},
		{label = "type sourcils",           item = "eyebrows_1", 	max = GetNumHeadOverlayValues(2)-1,														min = 0,},
		{label = "taille sourcils",         item = "eyebrows_2", 	max = 10,																				min = 0,},
		{label = "couleur sourcils 1", 		item = "eyebrows_3", 	max = GetNumHairColors()-1,																min = 0,},
		{label = "couleur sourcils 2", 		item = "eyebrows_4", 	max = GetNumHairColors()-1,																min = 0,},
		{label = "type maquillage", 		item = "makeup_1", 		max = GetNumHeadOverlayValues(4)-1,														min = 0,},
		{label = "épaisseur maquillage", 	item = "makeup_2", 		max = 10,																				min = 0,},
		{label = "couleur maquillage 1", 	item = "makeup_3", 		max = GetNumHairColors()-1,																min = 0,},
		{label = "couleur maquillage 2", 	item = "makeup_4", 		max = GetNumHairColors()-1,																min = 0,},
		{label = "type lipstick", 			item = "lipstick_1", 	max = GetNumHeadOverlayValues(8)-1,														min = 0,},
		{label = "épaisseur lipstick", 		item = "lipstick_2", 	max = 10,																				min = 0,},
		{label = "couleur lipstick 1", 		item = "lipstick_3", 	max = GetNumHairColors()-1,																min = 0,},
		{label = "couleur lipstick 2", 		item = "lipstick_4", 	max = GetNumHairColors()-1,																min = 0,},
		{label = "Boutons", 				item = "blemishes_1", 	max = GetNumHeadOverlayValues(0)-1,														min = 0,},
		{label = "opacité des boutons", 	item = "blemishes_2", 	max = 10,																				min = 0,},
		{label = "rougeur", 				item = "blush_1", 		max = GetNumHeadOverlayValues(5)-1,														min = 0,},
		{label = "opacité rougeur", 		item = "blush_2", 		max = 10,																				min = 0,},
		{label = "couleur rougeur", 		item = "blush_3", 		max = GetNumHairColors()-1,																min = 0,},
		{label = "teint", 					item = "complexion_1", 	max = GetNumHeadOverlayValues(6)-1,														min = 0,},
		{label = "opacité teint", 			item = "complexion_2", 	max = 10,																				min = 0,},
		{label = "dommages UV", 			item = "sun_1", 		max = GetNumHeadOverlayValues(7)-1,														min = 0,},
		{label = "opacité dommages UV", 	item = "sun_2", 		max = 10,																				min = 0,},
		{label = "taches de rousseur", 		item = "moles_1", 		max = GetNumHeadOverlayValues(9)-1,														min = 0,},
		{label = "opacité rousseur", 		item = "moles_2", 		max = 10,																				min = 0,},
	}

	return data, peds, corps, accessorie, FaceCustom
end


function GetValue(key)
	local value = nil
	local returning = 0
	TriggerEvent("skinchanger:GetKeyValue", key, function(_value)
		value = _value
	end)
	for i = 0, GetNumberOfPedDrawableVariations(GetPlayerPed(-1), value) - 1 do				
		if IsPedComponentVariationValid(GetPlayerPed(-1), value, i, 2) then
			returning = returning + 1
		end
	end
	return returning
end



local CamOffset = {
	{item = "default", 		cam = {0.0, 3.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "default_face", cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 35.0},
	{item = "face",			cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 20.0},
	{item = "skin", 		cam = {0.0, 2.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 30.0},
	{item = "tshirt_1", 	cam = {0.0, 2.0, 0.35}, lookAt = {0.0, 0.0, 0.35}, fov = 30.0},
	{item = "tshirt_2", 	cam = {0.0, 2.0, 0.35}, lookAt = {0.0, 0.0, 0.35}, fov = 30.0},
	{item = "torso_1", 		cam = {0.0, 2.0, 0.35}, lookAt = {0.0, 0.0, 0.35}, fov = 30.0},
	{item = "torso_2", 		cam = {0.0, 2.0, 0.35}, lookAt = {0.0, 0.0, 0.35}, fov = 30.0},
	{item = "decals_1", 	cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "decals_2", 	cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "arms", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "arms_2", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "pants_1", 		cam = {0.0, 2.0, -0.35}, lookAt = {0.0, 0.0, -0.4}, fov = 35.0},
	{item = "pants_2", 		cam = {0.0, 2.0, -0.35}, lookAt = {0.0, 0.0, -0.4}, fov = 35.0},
	{item = "shoes_1", 		cam = {0.0, 2.0, -0.5}, lookAt = {0.0, 0.0, -0.6}, fov = 40.0},
	{item = "shoes_2", 		cam = {0.0, 2.0, -0.5}, lookAt = {0.0, 0.0, -0.6}, fov = 25.0},
	{item = "age_1",			cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "age_2",			cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "beard_1", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "beard_2", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "beard_3", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "beard_4", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "hair_1",		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "hair_2",		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "hair_color_1",	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "hair_color_2",	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "eye_color", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "eyebrows_1", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "eyebrows_2", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "eyebrows_3", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "eyebrows_4", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "makeup_1", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "makeup_2", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "makeup_3", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "makeup_4", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "lipstick_1", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "lipstick_2", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "lipstick_3", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "lipstick_4", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "blemishes_1",	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "blemishes_2",	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "blush_1", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "blush_2", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "blush_3", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "complexion_1",	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "complexion_2",	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "sun_1", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "sun_2", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "moles_1", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "moles_2", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "chest_1", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "chest_2", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "chest_3", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "bodyb_1", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "bodyb_2", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "ears_1", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 35.0},
	{item = "ears_2", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 35.0},
	{item = "mask_1", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 20.0},
	{item = "mask_2", 		cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 20.0},
	{item = "bproof_1", 	cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "bproof_2", 	cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "chain_1", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "chain_2", 		cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "bags_1", 		cam = {0.0, -2.0, 0.35}, lookAt = {0.0, 0.0, 0.35}, fov = 30.0},
	{item = "bags_2", 		cam = {0.0, -2.0, 0.35}, lookAt = {0.0, 0.0, 0.35}, fov = 30.0},
	{item = "helmet_1", 	cam = {0.0, 1.0, 0.73}, lookAt = {0.0, 0.0, 0.68}, fov = 20.0},
	{item = "helmet_2", 	cam = {0.0, 1.0, 0.73}, lookAt = {0.0, 0.0, 0.68}, fov = 20.0},
	{item = "glasses_1", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "glasses_2", 	cam = {0.0, 1.0, 0.7}, lookAt = {0.0, 0.0, 0.65}, fov = 25.0},
	{item = "watches_1", 	cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "watches_2", 	cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "bracelets_1",	cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
	{item = "bracelets_2",	cam = {0.0, 2.0, 0.0}, lookAt = {0.0, 0.0, 0.0}, fov = 40.0},
}


local animMen = {
	{dict = "mp_character_creation@customise@male_a", anim = "drop_clothes_a"},
	{dict = "mp_character_creation@customise@male_a", anim = "drop_clothes_b"},
	{dict = "mp_character_creation@customise@male_a", anim = "drop_clothes_c"},
}

local animGirl = {
	{dict = "mp_character_creation@customise@female_a", anim = "drop_clothes_a"},
	{dict = "mp_character_creation@customise@female_a", anim = "drop_clothes_b"},
	{dict = "mp_character_creation@customise@female_a", anim = "drop_clothes_c"},
}

function PlayRandomClothAnim()
	if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_f_freemode_01") then
		local r = math.random(1,#animGirl)
		rUtils.PlayAnim(animGirl[r].dict, animGirl[r].anim, 1)
	elseif GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then
		local r = math.random(1,#animMen)
		rUtils.PlayAnim(animMen[r].dict, animMen[r].anim, 1)
	else
		local r = math.random(1,#animMen)
		rUtils.PlayAnim(animMen[r].dict, animMen[r].anim, 1)
	end
end


function GetCamOffset(type)
	for k,v in pairs(CamOffset) do
		if v.item == type then
			return v
		end
	end
end
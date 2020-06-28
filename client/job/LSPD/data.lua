

function LoadPoliceData()

    SetWeaponDamageModifier(GetHashKey("weapon_carbinerifle"), 2.0)
    SetWeaponDamageModifier(GetHashKey("weapon_combatpistol"), 1.9)

    local LspdCloths = {
        homme = {
            {
                name = "LSPD STAND-BY HOMME    ",
                cloth = {
                    ["tshirt_1"] = 42,        
                    ["tshirt_2"] = 0,        
                    ["torso_1"] = 93,        
                    ["torso_2"] = 0,        
                    ["decals_1"] = 0,        
                    ["decals_2"] = 0,        
                    ["arms"] = 19,        
                    ["arms_2"] = 0,        
                    ["pants_1"] = 59,        
                    ["pants_2"] = 1,        
                    ["shoes_1"] = 25,        
                    ["shoes_2"] = 0,        
                    ["mask_1"] = -1,        
                    ["mask_2"] = 0,        
                    ["bproof_1"] = 0,        
                    ["bproof_2"] = 0,        
                    ["chain_1"] =3,        
                    ["chain_2"] = 0,        
                    ["helmet_1"] = -1,        
                    ["helmet_2"] = 0,        
                    ["bags_1"] = 0,        
                    ["glasses_1"] = -1,        
                    ["glasses_2"] = 0,        
                    ["bracelets_1"] = -1,        
                    ["bracelets_2"] = 0,        
                    ["ears_1"] = -1,        
                    ["ears_2"] = 0,        
                    ["watches_1"] = -1,        
                    ["watches_2"] = 0,
                },
            },
            {
                name = "SWAT STAND-BY  HOMME",
                cloth = {
                    ["tshirt_1"] = 42,        
                    ["tshirt_2"] = 0,        
                    ["torso_1"] = 93,        
                    ["torso_2"] = 1,        
                    ["decals_1"] = 0,        
                    ["decals_2"] = 0,        
                    ["arms"] = 19,        
                    ["arms_2"] = 0,        
                    ["pants_1"] = 59,        
                    ["pants_2"] = 0,        
                    ["shoes_1"] = 25,        
                    ["shoes_2"] = 0,        
                    ["mask_1"] = -1,        
                    ["mask_2"] = 0,        
                    ["bproof_1"] = 0,        
                    ["bproof_2"] = 0,        
                    ["chain_1"] =3,        
                    ["chain_2"] = 0,        
                    ["helmet_1"] = -1,        
                    ["helmet_2"] = 0,        
                    ["bags_1"] = 0,        
                    ["glasses_1"] = -1,        
                    ["glasses_2"] = 0,        
                    ["bracelets_1"] = -1,        
                    ["bracelets_2"] = 0,        
                    ["ears_1"] = -1,        
                    ["ears_2"] = 0,        
                    ["watches_1"] = -1,        
                    ["watches_2"] = 0,  
                },
            },
            {
                name = "LSPD sport HOMME",
                cloth = {
                    ["tshirt_1"] = 15,        
                    ["tshirt_2"] = 0,        
                    ["torso_1"] = 208,        
                    ["torso_2"] = 13,        
                    ["decals_1"] = 0,        
                    ["decals_2"] = 0,        
                    ["arms"] = 19,        
                    ["arms_2"] = 0,        
                    ["pants_1"] = 12,        
                    ["pants_2"] = 2,        
                    ["shoes_1"] = 2,        
                    ["shoes_2"] = 0,        
                    ["mask_1"] = -1,        
                    ["mask_2"] = 0,        
                    ["bproof_1"] = 0,        
                    ["bproof_2"] = 0,        
                    ["chain_1"] = 0,        
                    ["chain_2"] = 0,        
                    ["helmet_1"] = -1,        
                    ["helmet_2"] = 0,        
                    ["bags_1"] = 0,        
                    ["glasses_1"] = -1,        
                    ["glasses_2"] = 0,        
                    ["bracelets_1"] = -1,        
                    ["bracelets_2"] = 0,        
                    ["ears_1"] = -1,        
                    ["ears_2"] = 0,        
                    ["watches_1"] = -1,        
                    ["watches_2"] = 0, 
                },
            },
            {
                name = "LSPD HOMME NOIR MANCHE LONGUE",
                cloth = {
                    ["tshirt_1"] = 56,
                    ["tshirt_2"] = 1,
                    ["torso_1"] = 101,
                    ["torso_2"] = 1,
                    ["pants_1"] = 59,
                    ["pants_2"] =0 ,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 20,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 3,
                    ["chain_2"] = 0,
                    ["bracelets_1"] = -1,
                    ["bracelets_2"] = 0,
                    ["ears_1"] = 0,
                    ["ears_2"] = 0,
                    ["mask_1"] = 0,
                    ["mask_2"] = 0,
                    ["watches_1"] = -1,
                    ["watches_2"] = 0,
                    ["decals_1"] = 0,
                    ["bags_1"] = 0,
                },
            },
            {
                name = "LSPD HOMME NOIR MANCHE COURTE",
                cloth = {
                    ["tshirt_1"] = 56,
                    ["tshirt_2"] = 1,
                    ["torso_1"] = 102,
                    ["torso_2"] = 0,
                    ["pants_1"] = 59,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 19,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 3,
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
            {
                name = "LSPD HOMME BLEU MANCHE LONGUE",
                cloth = {
                    ["tshirt_1"] = 56,
                    ["tshirt_2"] = 1,
                    ["torso_1"] = 193,
                    ["torso_2"] = 0,
                    ["pants_1"] = 59,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 20,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 3,
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
            {
                name = "LSPD HOMME BLEU MANCHE COURTE",
                cloth = {
                    ["tshirt_1"] = 56,
                    ["tshirt_2"] = 1,
                    ["torso_1"] = 190,
                    ["torso_2"] = 0,
                    ["pants_1"] = 59,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 19,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 3,
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
            {
                name = "LSPD HOMME CEREMONIE",
                cloth = {

                    ["tshirt_1"] = 56,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 200,
                    ["torso_2"] = 0,
                    ["pants_1"] = 35,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 82,
                    ["arms_2"] = 0,
                    ["helmet_1"] = 1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 0,
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
            {
                name = "LSPD HOMME SWAT",
                cloth = {
                    ["tshirt_1"] = 15,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 49,
                    ["torso_2"] = 2,
                    ["pants_1"] = 31,
                    ["pants_2"] = 2,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 17,
                    ["arms_2"] = 0,
                    ["helmet_1"] = 39,
                    ["helmet_2"] = 2,
                    ["chain_1"] = 3,
                    ["chain_2"] = 0,
                    ["bracelets_1"] = -1,
                    ["bracelets_2"] = 0,
                    ["ears_1"] = -1,
                    ["ears_2"] = 0,
                    ["mask_1"] = 52,
                    ["mask_2"] = 0,
                    ["watches_1"] = 16,
                    ["watches_2"] = 0,
                    ["decals_1"] = 3,
                    ["decals_2"] = 0,
                    ["bags_1"] = 0,
                },
            },
            {
                name = "LSPD HOMME SWAT PLONGEE",
                cloth = {
                    ["tshirt_1"] = 123,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 243,
                    ["torso_2"] = 0,
                    ["pants_1"] = 94,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 67,
                    ["shoes_2"] = 0,
                    ["arms"] = 35,
                    ["arms_2"] = 0,
                    ["helmet_1"] = 117,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 0,
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
                    ["glasses_1"] = 22,
                    ["glasses_1"] = 0,
                },
            },
            {
                name = "LSPD HOMME UNITE MARY",
                cloth = {
                    ["tshirt_1"] = 56,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 190,
                    ["torso_2"] = 0,
                    ["pants_1"] = 32,
                    ["pants_2"] = 1,
                    ["shoes_1"] = 13,
                    ["shoes_2"] = 0,
                    ["arms"] = 19,
                    ["arms_2"] = 0,
                    ["helmet_1"] = 17,
                    ["helmet_2"] = 1,
                    ["chain_1"] = 3,
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
            {
                name = "LSPD HOMME UNITE HENRY",
                cloth = {
                    ["tshirt_1"] = 116,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 54,
                    ["torso_2"] = 0,
                    ["pants_1"] = 41,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 17,
                    ["arms_2"] = 0,
                    ["helmet_1"] = 19,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 3,
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
            {
                name = "LSPD HOMME UNITE SAHP",
                cloth = {
                    ["tshirt_1"] = 56,
                    ["tshirt_2"] = 1,
                    ["torso_1"] = 32,
                    ["torso_2"] = 3,
                    ["pants_1"] = 59,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 20,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 3,
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
            {
                name = "LSPD HOMME UNITE DOA 2",
                cloth = {
                    ["tshirt_1"] = 38,
                    ["tshirt_2"] = 1,
                    ["torso_1"] = 95,
                    ["torso_2"] = 1,
                    ["pants_1"] = 59,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 26,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 3,
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
                    ["bproof_1"] = 7,
                    ["bproof_2"] = 4,
                },
            },
            {
                name = "LSPD HOMME UNITE DOA 1",
                cloth = {
                    ["tshirt_1"] = 21,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 35,
                    ["torso_2"] = 2,
                    ["pants_1"] = 59,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 17,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 3,
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
                    ["bproof_1"] = 21,
                    ["bproof_2"] = 4, 
                },
            },
        },
        femme = {
            {
                name = "LSPD sport FEMME  ",
                cloth = {
                    ["tshirt_1"] = 15,        
                    ["tshirt_2"] = 0,        
                    ["torso_1"] = 224,        
                    ["torso_2"] = 1,        
                    ["decals_1"] = 0,        
                    ["decals_2"] = 0,        
                    ["arms"] = 31,        
                    ["arms_2"] = 0,        
                    ["pants_1"] = 82,        
                    ["pants_2"] = 2,        
                    ["shoes_1"] = 10,        
                    ["shoes_2"] = 0,        
                    ["mask_1"] = -1,        
                    ["mask_2"] = 0,        
                    ["bproof_1"] = 0,        
                    ["bproof_2"] = 0,        
                    ["chain_1"] = 0,        
                    ["chain_2"] = 0,        
                    ["helmet_1"] = -1,        
                    ["helmet_2"] = 0,        
                    ["bags_1"] = 0,        
                    ["glasses_1"] = -1,        
                    ["glasses_2"] = 0,        
                    ["bracelets_1"] = -1,        
                    ["bracelets_2"] = 0,        
                    ["ears_1"] = -1,        
                    ["ears_2"] = 0,        
                    ["watches_1"] = -1,        
                    ["watches_2"] = 0, 
                },
            },
            {
                name = "LSPD STAND-BY FEMME",
                cloth = {
                    ["tshirt_1"] = 8,        
                    ["tshirt_2"] = 0,        
                    ["torso_1"] = 84,        
                    ["torso_2"] = 0,        
                    ["decals_1"] = 0,        
                    ["decals_2"] = 0,        
                    ["arms"] = 31,        
                    ["arms_2"] = 0,        
                    ["pants_1"] = 61,        
                    ["pants_2"] = 0,        
                    ["shoes_1"] = 25,        
                    ["shoes_2"] = 0,        
                    ["mask_1"] = -1,        
                    ["mask_2"] = 0,        
                    ["bproof_1"] = 0,        
                    ["bproof_2"] = 0,        
                    ["chain_1"] = 1,        
                    ["chain_2"] = 0,        
                    ["helmet_1"] = -1,        
                    ["helmet_2"] = 0,        
                    ["bags_1"] = 0,        
                    ["glasses_1"] = -1,        
                    ["glasses_2"] = 0,        
                    ["bracelets_1"] = -1,        
                    ["bracelets_2"] = 0,        
                    ["ears_1"] = -1,        
                    ["ears_2"] = 0,        
                    ["watches_1"] = -1,        
                    ["watches_2"] = 0, 
                },
            },
            {
                name = "LSPD FEMME NOIR MANCHE LONGUE",
                cloth = {
                    ["tshirt_1"] = 35,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 92,
                    ["torso_2"] = 0,
                    ["pants_1"] = 61,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 26,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 1,
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
            {
                name = "LSPD FEMME NOIR MANCHE COURTE",
                cloth = {
                    ["tshirt_1"] = 35,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 93,
                    ["torso_2"] = 0,
                    ["pants_1"] = 61,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 31,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 1,
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
            {
                name = "LSPD FEMME BLEU MANCHE COURTE",
                cloth = {
                    ["tshirt_1"] = 35,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 192,
                    ["torso_2"] = 0,
                    ["pants_1"] = 61,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 31,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 1,
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
            {
                name = "LSPD FEMME BLEU MANCHE LONGUE",
                cloth = {
                    ["tshirt_1"] = 35,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 195,
                    ["torso_2"] = 0,
                    ["pants_1"] = 61,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 26,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 1,
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
            {
                name = "LSPD FEMME CEREMONIE",
                cloth = {
                    ["tshirt_1"] = 33,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 202,
                    ["torso_2"] = 0,
                    ["pants_1"] = 34,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 55,
                    ["shoes_2"] = 0,
                    ["arms"] = 88,
                    ["arms_2"] = 0,
                    ["helmet_1"] = 1,
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
            {
                name = "LSPD FEMME SWAT",
                cloth = {
                    ["tshirt_1"] = 80,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 42,
                    ["torso_2"] = 2,
                    ["pants_1"] = 30,
                    ["pants_2"] = 2,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 35,
                    ["arms_2"] = 0,
                    ["helmet_1"] = 38,
                    ["helmet_2"] = 2,
                    ["chain_1"] = 1,
                    ["chain_2"] = 0,
                    ["bracelets_1"] = -1,
                    ["bracelets_2"] = 0,
                    ["ears_1"] = -1,
                    ["ears_2"] = 0,
                    ["mask_1"] = 52,
                    ["mask_2"] = 0,
                    ["watches_1"] = -1,
                    ["watches_2"] = 0,
                    ["decals_1"] = 3,
                    ["decals_2"] = 0,
                    ["bags_1"] = 0,
                },
            },
            {
                name = "LSPD FEMME SWAT PLONGEE",
                cloth = {
                    ["tshirt_1"] = 153,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 251,
                    ["torso_2"] = 0,
                    ["pants_1"] = 97,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 70,
                    ["shoes_2"] = 0,
                    ["arms"] = 44,
                    ["arms_2"] = 0,
                    ["helmet_1"] = 116,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 0,
                    ["chain_2"] = 0,
                    ["bracelets_1"] = -1,
                    ["bracelets_2"] = 0,
                    ["ears_1"] = -1,
                    ["ears_2"] = 0,
                    ["mask_1"] = 52,
                    ["mask_2"] = 0,
                    ["watches_1"] = -1,
                    ["watches_2"] = 0,
                    ["decals_1"] = 0,
                    ["bags_1"] = 0,
                    ["glasses_1"] = 28,
                    ["glasses_2"] = 0,
                },
            },
            {
                name = "LSPD FEMME UNITE MARY",
                cloth = {
                    ["tshirt_1"] = 33,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 192,
                    ["torso_2"] = 0,
                    ["pants_1"] = 31,
                    ["pants_2"] = 1,
                    ["shoes_1"] = 9,
                    ["shoes_2"] = 0,
                    ["arms"] = 31,
                    ["arms_2"] = 0,
                    ["helmet_1"] = 17,
                    ["helmet_2"] = 1,
                    ["chain_1"] = 1,
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
            {
                name = "LSPD FEMME UNITE HENRY",
                cloth = {
                    ["tshirt_1"] = 80,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 47,
                    ["torso_2"] = 0,
                    ["pants_1"] = 42,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 28,
                    ["arms_2"] = 0,
                    ["helmet_1"] = 19,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 1,
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
            {
                name = "LSPD FEMME UNITE SAHP",
                cloth = {
                    ["tshirt_1"] = 33,
                    ["tshirt_2"] = 1,
                    ["torso_1"] = 31,
                    ["torso_2"] = 0,
                    ["pants_1"] = 61,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 26,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 1,
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
            {
                name = "LSPD FEMME UNITE DOA 1",
                cloth = {
                    ["tshirt_1"] = 38,
                    ["tshirt_2"] = 2,
                    ["torso_1"] = 179,
                    ["torso_2"] = 2,
                    ["pants_1"] = 61,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 27,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 1,
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
                    ["bproof_1"] = 20,
                    ["bproof_2"] = 4,
                },
            },
            {
                name = "LSPD FEMME UNITE DOA 2",
                cloth = {
                    ["tshirt_1"] = 33,
                    ["tshirt_2"] = 0,
                    ["torso_1"] = 86,
                    ["torso_2"] = 1,
                    ["pants_1"] = 61,
                    ["pants_2"] = 0,
                    ["shoes_1"] = 25,
                    ["shoes_2"] = 0,
                    ["arms"] = 31,
                    ["arms_2"] = 0,
                    ["helmet_1"] = -1,
                    ["helmet_2"] = 0,
                    ["chain_1"] = 1,
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
                    ["bproof_1"] = 0,
                    ["bproof_2"] = 0,
                },
            },
        },
    }

    rUtils.RegisterClothZone({
        pos = vector3(-1098.269, -831.6808, 14.28278),
        cloths = LspdCloths
    })

    rUtils.RegisterGarageZone({
        pos = vector3(-1102.03, -837.1118, 37.69914),
        spawns = {
            {pos = vector3(-1096.732, -832.7906, 37.69968),heading = 308.35607910156,},
        },
        vehs = {
            {spawn = "polmav", nom = "Hélico"},
        },
    })


    rUtils.RegisterGarageZone({
        pos = vector3(-1077.151, -857.4, 5.0),
        spawns = {
            {pos = vector3(-1052.552, -846.5878, 4.43216),heading = 216.08404541016,},
            {pos = vector3(-1047.697, -846.5561, 4.432549),heading = 217.1958770752,},
            {pos = vector3(-1039.836, -855.3243, 4.443726),heading = 56.36937713623,},
            {pos = vector3(-1042.467, -858.2819, 4.450675),heading = 58.252021789551,},
            {pos = vector3(-1045.338, -861.4882, 4.481732),heading = 58.001258850098,},
            {pos = vector3(-1048.484, -864.561, 4.571898),heading = 59.926246643066,},
            {pos = vector3(-1051.888, -866.9875, 4.687532),heading = 58.566833496094,},
            {pos = vector3(-1069.624, -878.1849, 4.410971),heading = 31.558645248413,},
            {pos = vector3(-1073.018, -880.007, 4.328514),heading = 28.419841766357,},
            {pos = vector3(-1076.364, -881.9647, 4.247827),heading = 28.69091796875,},
            {pos = vector3(-1079.562, -884.1489, 4.165996),heading = 31.136232376099,},
        },
        vehs = {
            {spawn = "chargleg2", nom = "Dodge charger SRT"},
            {spawn = "chargleg4", nom = "Dodge charger k9"},
            {spawn = "f250leg", nom = "Ford 250 Raptor"},
            {spawn = "fpiuleg3", nom = "Ford SUV interceptor"},
            {spawn = "sierraleg", nom = "GMC Sierra"},
            {spawn = "taholeg", nom = "Tahoe"},
            {spawn = "taholeg3", nom = "Tahoe K9"},
            {spawn = "tarleg", nom = "Ford sedan interceptor"},
            {spawn = "bikeleg", nom = "Moto police"},
            {spawn = "bikeleg2", nom = "Moto police 2"},
        },
    })


    rUtils.RegisterActionZone({
        pos = vector3(-1087.789, -813.3109, 11.03693),
        action = function()
            OpenSocietyInvMenu()
        end,
    })

    rUtils.RegisterActionZone({
        pos = vector3(-1086.47, -832.2222, 5.479732),
        action = function()
            OpenSocietyInvMenu()
        end,
    })

    rUtils.RegisterActionZone({
        pos = vector3(-1102.956, -829.2413, 14.28279),
        action = function()
            OpenPoliceArmorie()
        end,
    })


    rUtils.RegisterActionZone({
        pos = vector3(865.4838, -1350.26, 26.33804),
        action = function()
            OpenPoliceFourriere()
        end,
    })

    local fourrierePos = {
        {pos = vector3(860.104, -1342.632, 26.25522),heading = 92.973426818848,},
        {pos = vector3(844.1086, -1334.342, 26.33368),heading = 245.68185424804,},
        {pos = vector3(844.3082, -1340.52, 26.2928),heading = 247.03131103516,},
        {pos = vector3(843.8372, -1346.368, 26.30108),heading = 244.4429473877,},
        {pos = vector3(844.2156, -1352.662, 26.31114),heading = 246.79895019532,},
    }

    RMenu.Add('core', 'lspd_fourriere', RageUI.CreateMenu("POLICE", "~b~Menu action fourrière LSPD"))
    RMenu:Get('core', 'lspd_fourriere').Closed = function()
        open = false
    end

    function OpenPoliceFourriere() 
        if open then return end
        open = true
        exports.rFramework:TriggerServerCallback(events.fourriereLspdVehCb, function(vehs)
            RageUI.Visible(RMenu:Get('core', 'lspd_fourriere'), not RageUI.Visible(RMenu:Get('core', 'lspd_fourriere')))
            Citizen.CreateThread(function()
                while open do
                    Wait(1)
                    RageUI.IsVisible(RMenu:Get('core', 'lspd_fourriere'), true, true, true, function()
                        for k,v in pairs(vehs) do
                            RageUI.ButtonWithStyle("~b~["..v.plate.."] - ~o~"..GetDisplayNameFromVehicleModel(v.props.model), nil, { }, true, function(Hovered, Active, Selected)
                                if Selected then
                                    local pos, heading = rUtils.GetZoneFromTable(fourrierePos)
                                    if pos ~= false then
                                        rUtils.SpawnVehicle(v.props.model, pos, heading, v.props, function(veh)
                                            local veh = AddBlipForEntity(veh)
                                            SetBlipScale(veh, 0.50)
                                            SetBlipSprite(veh, 225)
                                            DecorSetBool(veh, "OWNED_VEH", true)
                                        end)
                                    else
                                        rUtils.ImportantNotif("Aucun point de sortie disponible.")
                                    end
                                end
                            end)
                        end
                    end, function()
                        ---Panels
                    end)
                end
            end)
        end)    
    end

    local inCoolDown = false
    function RadioCooldown()
        if not inCoolDown then
            Citizen.CreateThread(function()
                inCoolDown = true
                Wait(5000)
                inCoolDown = false
            end)
            return true
        else
            return false
        end
    end

    RMenu.Add('core', 'lspd_main', RageUI.CreateMenu("POLICE", "~b~Menu action LSPD"))
    RMenu:Get('core', 'lspd_main').Closed = function()
        open = false
    end
    RMenu.Add('core', 'lspd_radio', RageUI.CreateSubMenu(RMenu:Get('core', 'lspd_main'), "Fouille", "~b~Fouille"))
    RMenu:Get('core', 'lspd_radio').Closed = function()end

    RMenu.Add('core', 'lspd_citizen', RageUI.CreateSubMenu(RMenu:Get('core', 'lspd_main'), "Véhicule", "~b~Véhicule"))
    RMenu:Get('core', 'lspd_citizen').Closed = function()
        open = true
    end

    RMenu.Add('core', 'lspd_divers', RageUI.CreateSubMenu(RMenu:Get('core', 'lspd_main'), "Fouille", "~b~Fouille"))
    RMenu:Get('core', 'lspd_divers').Closed = function()end

    RMenu.Add('core', 'lspd_fouille', RageUI.CreateSubMenu(RMenu:Get('core', 'lspd_citizen'), "Fouille", "~b~Fouille"))
    RMenu:Get('core', 'lspd_fouille').Closed = function()end

    RMenu.Add('core', 'lspd_citizen_menotte', RageUI.CreateSubMenu(RMenu:Get('core', 'lspd_citizen'), "Véhicule", "~b~Véhicule"))
    RMenu:Get('core', 'lspd_citizen_menotte').Closed = function()end

    RMenu.Add('core', 'lspd_veh', RageUI.CreateSubMenu(RMenu:Get('core', 'lspd_main'), "Véhicule", "~b~Véhicule"))
    RMenu:Get('core', 'lspd_veh').Closed = function()end

    RMenu.Add('core', 'lspd_veh_confirme', RageUI.CreateSubMenu(RMenu:Get('core', 'lspd_veh'), "Véhicule", "~b~Véhicule"))
    RMenu:Get('core', 'lspd_veh_confirme').Closed = function()end
    

    local TargetInv = {}
    local TargetWeight = 0
    local TargetMoney = 0
    local TargetBlackMoney = 0
    local TargetID = 0
    local ShieldOut = false
    function OpenPoliceActionMenu()
        if open then open = false return end
        open = true
        RageUI.Visible(RMenu:Get('core', 'lspd_main'), not RageUI.Visible(RMenu:Get('core', 'lspd_main')))
        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'lspd_fouille'), true, true, true, function()
                    RageUI.ButtonWithStyle("Argent de poche: ~g~"..TargetMoney+TargetBlackMoney.."~w~$", nil, { }, true, function(Hovered, Active, Selected)
                        if Selected then
                            
                        end
                    end)
                    RageUI.Separator("Poids: "..TargetWeight.."/50.0")
                    for k,v in pairs(TargetInv) do
                        RageUI.ButtonWithStyle(v.olabel.." ~g~("..v.count..")", nil, { }, true, function(Hovered, Active, Selected)
                            if Selected then
                                local amount = CustomAmount()
                                if amount ~= nil and amount ~= 0 and amount <= v.count then
                                    TriggerServerEvent(events.TransferReverse, token, TargetID, v.name, amount, v.label, v.count)
                                    if v.count - amount <= 0 then
                                        TargetInv[k] = nil
                                    else
                                        TargetInv[k].count = TargetInv[k].count - amount
                                    end
                                end
                            end
                        end) 
                    end

                end, function()
                    ---Panels
                end)

                RageUI.IsVisible(RMenu:Get('core', 'lspd_radio'), true, true, true, function()
                    for k,v in pairs(JobsData.lspd.radio) do
                        RageUI.Button("["..v.code.."] "..v.label, nil, true, function(Hovered, Active, Selected)
                            if Selected then
                                if RadioCooldown() then
                                    SendActionTxt(" effectue un "..v.code.." sur sa radio")
                                    TriggerServerEvent(events.radioCall, token, pJob, v.code, v.label, v.pos, pPrenom, pNom)
                                    Citizen.CreateThread(function()
                                        ExecuteCommand("e radio")
                                        Wait(3000)
                                        ClearPedTasks(pPed)
                                    end)
                                end
                            end
                        end)  
                    end
                end, function()
                    ---Panels
                end)

                RageUI.IsVisible(RMenu:Get('core', 'lspd_veh'), true, true, true, function()

                    RageUI.ButtonWithStyle("Mettre en fourrière LSPD.", "Met en fourrière LSPD le véhicule le plus proche, attention, le joueur ne pourra plus le sortir de son garage!", { }, true, function(Hovered, Active, Selected)
                        if Active then 
                            ClosetVehWithDisplay() 
                        end
                    end, RMenu:Get('core', 'lspd_veh_confirme'))

                    RageUI.ButtonWithStyle("Retirer de la fourrière LSPD.", "Retire le véhicule le plus proche de la fourrière LSPD", { }, true, function(Hovered, Active, Selected)
                        if Selected then
                            local veh = rUtils.GetClosestVehicle(GetEntityCoords(pPed))
                            local plate = GetVehicleNumberPlateText(veh)
                            TriggerServerEvent(events.rmvStatusLSPD, token, plate, VehToNet(veh))
                        end
                        if Active then 
                            ClosetVehWithDisplay() 
                        end
                    end)

                    RageUI.Button("Vérifier la plaque.", nil, true, function(Hovered, Active, Selected)
                        if Selected then
                            rUtils.ImportantNotif("Vous demandez une vérification de plaque au central ...")
                            ExecuteCommand("e cop3")
                            Wait(10000)
                            local veh = rUtils.GetClosestVehicle(GetEntityCoords(pPed))
                            local plate = GetVehicleNumberPlateText(veh)
                            TriggerServerEvent(events.checkPlate, token, plate)
                            ClearPedTasks(pPed)
                        end
                        if Active then 
                            ClosetVehWithDisplay() 
                        end
                    end)

                    RageUI.Button("Vérifier la plaque (CID).", nil, true, function(Hovered, Active, Selected)
                        if Selected then
                            local plate = CustomString()
                            if plate ~= nil then
                                rUtils.ImportantNotif("Vous demandez une vérification de plaque au central ...")
                                ExecuteCommand("e cop3")
                                Wait(10000)
                                TriggerServerEvent(events.checkPlate, token, plate)
                                ClearPedTasks(pPed)
                            end
                        end
                    end)

                end, function()
                    ---Panels
                end)

                RageUI.IsVisible(RMenu:Get('core', 'lspd_veh_confirme'), true, true, true, function()

                    RageUI.ButtonWithStyle("~g~Confirmer la mise en fourrière", "Met en fourrière LSPD le véhicule le plus proche, attention, le joueur ne pourra plus le sortir de son garage!", { }, true, function(Hovered, Active, Selected)
                        if Selected then
                            local veh = rUtils.GetClosestVehicle(GetEntityCoords(pPed))
                            local plate = GetVehicleNumberPlateText(veh)
                            TriggerServerEvent(events.statusLSPD, token, plate, VehToNet(veh))
                        end
                        if Active then 
                            ClosetVehWithDisplay() 
                        end
                    end)

                    RageUI.ButtonWithStyle("~r~Annuler", nil, { }, true, function(Hovered, Active, Selected)
                        if Selected then
                            RageUI.GoBack()
                        end
                    end)

                end, function()
                    ---Panels
                end)

                RageUI.IsVisible(RMenu:Get('core', 'lspd_citizen'), true, true, true, function()

                    RageUI.ButtonWithStyle("Menotte", nil, {RightLabel = "→"}, true, function(_,h,s)
                    end, RMenu:Get('core', 'lspd_citizen_menotte'))

                    RageUI.Button("Récupérer l'identité de la personne", "~r~HRP: Permet de prendre de force l'identité de la personne, à ne pas utiliser quand vous demandez juste l'identité de la personne.", true, function(Hovered, Active, Selected)
                        if Selected then
                            local closet, dst = rUtils.GetClosestPlayer(GetEntityCoords(pPed))
                            if dst < 2.0 then
                                local target = GetPlayerServerId(closet)
                                TriggerServerEvent(events.askId, token, target)
                            end
                        end
                    end)

                    RageUI.ButtonWithStyle("Fouiller la personne", nil, {}, true, function(_,h,s)
                        if s then 
                            local closet, dst = rUtils.GetClosestPlayer(GetEntityCoords(pPed))
                            TargetInv = {}
                            TargetWeight = 0
                            TargetMoney = 0
                            TargetBlackMoney = 0
                            TargetID = 0
                            if dst < 2.0 then
                                SendActionTxt(" fouille la personne")
                                local target = GetPlayerServerId(closet)
                                exports.rFramework:TriggerServerCallback(events.OtherPdata, function(inv, weight, money, black)
                                    TargetInv = inv
                                    TargetWeight = weight
                                    TargetMoney = money
                                    TargetBlackMoney = black
                                    TargetID = target
                                end, target)
                            else
                                rUtils.Notif("Aucun joueur proche.")
                            end
                        end
                        if h then
                            rUtils.DisplayClosetPlayer()
                        end
                    end, RMenu:Get('core', 'lspd_fouille'))
                    
                    RageUI.ButtonWithStyle("Donner une amende", nil, { RightBadge = RageUI.BadgeStyle.Cash }, true, function(Hovered, Active, Selected)
                        if Selected then
                            RageUI.CloseAll()
                            OpenBillCreation()
                        end
                    end)

                    RageUI.ButtonWithStyle("Escorter la personne", nil, {}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local closet, dst = rUtils.GetClosestPlayer(GetEntityCoords(pPed))
                            if dst < 2.0 then
                                local sID = GetPlayerServerId(closet)
                                TriggerServerEvent(events.escort, token, sID)
                            end
                        end
                        if Active then
                            rUtils.DisplayClosetPlayer()
                        end
                    end)

                    RageUI.ButtonWithStyle("Mettre dans le véhicule", nil, {}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local closet, dst = rUtils.GetClosestPlayer(GetEntityCoords(pPed))
                            if dst < 2.0 then
                                local sID = GetPlayerServerId(closet)
                                TriggerServerEvent(events.inVeh, token, sID)
                            end
                        end
                        if Active then
                            rUtils.DisplayClosetPlayer()
                        end
                    end)

                    RageUI.ButtonWithStyle("Sortir du véhicule", nil, {}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local closet, dst = rUtils.GetClosestPlayer(GetEntityCoords(pPed))
                            if dst < 2.0 then
                                local sID = GetPlayerServerId(closet)
                                TriggerServerEvent(events.outVeh, token, sID)
                            end
                        end
                        if Active then
                            rUtils.DisplayClosetPlayer()
                        end
                    end)

                end, function()
                    ---Panels
                end)

                RageUI.IsVisible(RMenu:Get('core', 'lspd_citizen_menotte'), true, true, true, function()

                    RageUI.ButtonWithStyle("Menotter la personne", nil, {}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local closet, dst = rUtils.GetClosestPlayer(GetEntityCoords(pPed))
                            if dst < 2.0 then
                                local sID = GetPlayerServerId(closet)
                                TriggerServerEvent(events.cuff, token, sID, true, true)
                                rUtils.PlayAnim("mp_arresting", "a_uncuff", 1, 1.0, 1.0, nil, 3000)
                            end
                        end
                        if Active then
                            rUtils.DisplayClosetPlayer()
                        end
                    end)


                    RageUI.ButtonWithStyle("Menotter la personne (Laisser bouger)", nil, {}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local closet, dst = rUtils.GetClosestPlayer(GetEntityCoords(pPed))
                            if dst < 2.0 then
                                local sID = GetPlayerServerId(closet)
                                TriggerServerEvent(events.cuff, token, sID, true, false)
                                rUtils.PlayAnim("mp_arresting", "a_uncuff", 1, 1.0, 1.0, nil, 3000)
                            end
                        end
                        if Active then
                            rUtils.DisplayClosetPlayer()
                        end
                    end)

                    RageUI.ButtonWithStyle("Retirer les menottes", nil, {}, true, function(Hovered, Active, Selected)
                        if Selected then
                            local closet, dst = rUtils.GetClosestPlayer(GetEntityCoords(pPed))
                            if dst < 2.0 then
                                local sID = GetPlayerServerId(closet)
                                TriggerServerEvent(events.cuff, token, sID, false, false)
                                rUtils.PlayAnim("mp_arresting", "a_uncuff", 1, 100.0, nil, nil, 5800)
                            end
                        end
                        if Active then
                            rUtils.DisplayClosetPlayer()
                        end
                    end)

                end, function()
                    ---Panels
                end)

                RageUI.IsVisible(RMenu:Get('core', 'lspd_main'), true, true, true, function()

                    RageUI.ButtonWithStyle("Changer son status de service.", nil, { }, true, function(Hovered, Active, Selected)
                        if Selected then
                            TriggerServerEvent(events.Service, token, pJob)
                        end
                    end) 

                    RageUI.ButtonWithStyle("Action sur citoyen", nil, {RightLabel = "→"}, true, function(_,h,s)
                    end, RMenu:Get('core', 'lspd_citizen'))

                    RageUI.ButtonWithStyle("Code radio", nil, {RightLabel = "→"}, true, function(_,h,s)
                    end, RMenu:Get('core', 'lspd_radio'))

                    RageUI.ButtonWithStyle("Action sur véhicule", nil, {RightLabel = "→"}, true, function(_,h,s)
                    end, RMenu:Get('core', 'lspd_veh'))

                    RageUI.ButtonWithStyle("Divers", nil, {RightLabel = "→"}, true, function(_,h,s)
                    end, RMenu:Get('core', 'lspd_divers'))

                end, function()
                    ---Panels
                end)

                RageUI.IsVisible(RMenu:Get('core', 'lspd_divers'), true, true, true, function()

                    RageUI.Checkbox("Sortir un bouclier balistique", nil, ShieldOut, { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                        ShieldOut = Checked;
                    end, function()
                        SendActionTxt(" sort un bouclier balistique")
                        EnableShield()
                    end, function()
                        DisableShield()
                    end)

                end, function()
                    ---Panels
                end)


            end
        end)
    end 


    local weapons = {
        {
            name = "Matraque",
            item = "matraque",
            grade = 0,
        },
        {
            name = "Tazer",
            item = "tazer",
            grade = 0,
        },
        {
            name = "Arme de poing",
            item = "pistoletlspd",
            grade = 2,
        },
        {
            name = "Fusils d'assault LSPD",
            item = "m4",
            grade = 3,
        },
    }


    local gilet = {
        {label = "gilet pare-balle 1", item = "bproof_1", max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 9) - 1,								min = 0,},
        {label = "Variante gilet", o="bproof_1",c=9, item = "bproof_2", max = GetNumberOfPedTextureVariations(GetPlayerPed(-1), 9, GetPedTextureVariation(GetPlayerPed(-1), 9)) - 1,			min = 0,},
    }
    function UpadteGilet()
        local _gilet = {
            {label = "gilet pare-balle 1", item = "bproof_1", max = GetNumberOfPedDrawableVariations(GetPlayerPed(-1), 9) - 1,								min = 0,},
            {label = "Variante gilet", o="bproof_1",c=9, item = "bproof_2", max = GetNumberOfPedTextureVariations(GetPlayerPed(-1), 9, GetPedTextureVariation(GetPlayerPed(-1), 9)) - 1,			min = 0,},
        }
        gilet = _gilet
    end

    RMenu.Add('core', 'lspd_armorie', RageUI.CreateMenu("POLICE", "~b~Menu action LSPD"))
    RMenu:Get('core', 'lspd_armorie').Closed = function()
        open = false
    end

    for k,v in pairs(gilet) do
        RMenu.Add('core', v.item.."1", RageUI.CreateSubMenu(RMenu:Get('core', 'lspd_armorie'), "Gilet", "~b~Géstion des gilets de votre personnage."))
        RMenu:Get('core', v.item.."1").Closed = function()
        end
    end

    local NotSpamming = {}

    function OpenPoliceArmorie()
        open = true
        UpadteGilet()
        TriggerServerEvent(events.GetInv, token)
        RageUI.Visible(RMenu:Get('core', 'lspd_armorie'), not RageUI.Visible(RMenu:Get('core', 'lspd_armorie')))
        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'lspd_armorie'), true, true, true, function()
                    RageUI.ButtonWithStyle("Déposer ses armes de services.", nil, { }, true, function(Hovered, Active, Selected)
                        if Selected then
                            for k,v in pairs(pInventory) do
                                if v.name == "matraque" or v.name == "tazer" or v.name == "pistoletlspd" or v.name == "m4" then
                                    TriggerServerEvent(events.remove, token, v.label, v.count)
                                end
                            end
                        end
                    end)

                    for k,v in pairs(weapons) do
                        RageUI.ButtonWithStyle(v.name, nil, { }, v.grade <= pJob_Grade, function(Hovered, Active, Selected)
                            if Selected then
                                TriggerServerEvent(events.AddIf, token, v.item, 1)
                            end
                        end)
                    end

                    for k,v in pairs(gilet) do
                        RageUI.ButtonWithStyle(v.label, nil, { RightLabel = "→→" }, true, function(_,_,s)
                        end, RMenu:Get('core', v.item.."1"))
                    end


                end, function()
                    ---Panels
                end)

                for k,v in pairs(gilet) do
                    RageUI.IsVisible(RMenu:Get('core', v.item.."1"), true, true, true, function()

                        if v.item == "bproof_1" then
                            for i = v.min, v.max do
                                if NotSpamming[k] == nil then NotSpamming[k] = i end
    
                                RageUI.ButtonWithStyle(v.label.." "..i, nil, { RightLabel = "→ équiper " }, not usingVipPed, function(_,h,s)
                                   if s then
                                       TriggerEvent("skinchanger:change", v.item, i)
                                       SetPedArmour(pPed, 100.0)
                                   end
                                   if h then
                                       if NotSpamming[k] ~= i then
                                           TriggerEvent("skinchanger:change", v.item, i)
                                           TriggerEvent("skinchanger:change", v.o, 0)
                                           NotSpamming[k] = i
                                       end
                                   end
                                end) 
                            end
                        elseif v.item == "bproof_2" then
    
                            local value = exports.rFramework:GetKeyValue(v.o)
                            for i = v.min, GetNumberOfPedTextureVariations(GetPlayerPed(-1), v.c, value) - 1 do
                                if NotSpamming[k] == nil then NotSpamming[k] = i end
                                RageUI.ButtonWithStyle(v.label.." "..i, nil, { RightLabel = "→ équiper " }, not usingVipPed, function(_,h,s)
                                   if s then
                                       TriggerEvent("skinchanger:change", v.item, i)
                                   end
                                   if h then
                                        if NotSpamming[k] ~= i then
                                           TriggerEvent("skinchanger:change", v.item, i)
                                           NotSpamming[k] = i
                                        end
                                   end
                                end) 
                            end
                        end
    
                    end, function()
                        ---Panels
                    end)
                end

            end
        end)
    end

    local color = {
        {nom = "Black", index = 0},
        {nom = "Carbon Black", index  = 147},
        {nom = "Graphite", index  = 1},
        {nom = "Anhracite Black", index  = 11},
        {nom = "Black Steel", index  = 2},
        {nom = "Dark Steel", index  = 3},
        {nom = "Silver", index  = 4},
        {nom = "Bluish Silver", index  = 5},
        {nom = "Rolled Steel", index  = 6},
        {nom = "Shadow Silver", index  = 7},
        {nom = "Stone Silver", index  = 8},
        {nom = "Midnight Silver", index  = 9},
        {nom = "Cast Iron Silver", index  = 10},
        {nom = "Red", index  = 27},
        {nom = "Torino Red", index  = 28},
        {nom = "Formula Red", index  = 29},
        {nom = "Lava Red", index  = 150},
        {nom = "Blaze Red", index  = 30},
        {nom = "Grace Red", index  = 31},
        {nom = "Garnet Red", index  = 32},
        {nom = "Sunset Red", index  = 33},
        {nom = "Cabernet Red", index  = 34},
        {nom = "Wine Red", index  = 143},
        {nom = "Candy Red", index  = 35},
        {nom = "Hot Pink", index  = 135},
        {nom = "Pfsiter Pink", index  = 137},
        {nom = "Salmon Pink", index  = 136},
        {nom = "Sunrise Orange", index  = 36},
        {nom = "Orange", index  = 38},
        {nom = "Bright Orange", index  = 138},
        {nom = "Gold", index  = 99},
        {nom = "Bronze", index  = 90},
        {nom = "Yellow", index  = 88},
        {nom = "Race Yellow", index  = 89},
        {nom = "Dew Yellow", index  = 91},
        {nom = "Dark Green", index  = 49},
        {nom = "Racing Green", index  = 50},
        {nom = "Sea Green", index  = 51},
        {nom = "Olive Green", index  = 52},
        {nom = "Bright Green", index  = 53},
        {nom = "Gasoline Green", index  = 54},
        {nom = "Lime Green", index  = 92},
        {nom = "Midnight Blue", index  = 141},
        {nom = "Galaxy Blue", index  = 61},
        {nom = "Dark Blue", index  = 62},
        {nom = "Saxon Blue", index  = 63},
        {nom = "Blue", index  = 64},
        {nom = "Mariner Blue", index  = 65},
        {nom = "Harbor Blue", index  = 66},
        {nom = "Diamond Blue", index  = 67},
        {nom = "Surf Blue", index  = 68},
        {nom = "Nautical Blue", index  = 69},
        {nom = "Racing Blue", index  = 73},
        {nom = "Ultra Blue", index  = 70},
        {nom = "Light Blue", index  = 74},
        {nom = "Chocolate Brown", index  = 96},
        {nom = "Bison Brown", index  = 101},
        {nom = "Creeen Brown", index  = 95},
        {nom = "Feltzer Brown", index  = 94},
        {nom = "Maple Brown", index  = 97},
        {nom = "Beechwood Brown", index  = 103},
        {nom = "Sienna Brown", index  = 104},
        {nom = "Saddle Brown", index  = 98},
        {nom = "Moss Brown", index  = 100},
        {nom = "Woodbeech Brown", index  = 102},
        {nom = "Straw Brown", index  = 99},
        {nom = "Sandy Brown", index  = 105},
        {nom = "Bleached Brown", index  = 106},
        {nom = "Schafter Purple", index  = 71},
        {nom = "Spinnaker Purple", index  = 72},
        {nom = "Midnight Purple", index  = 142},
        {nom = "Bright Purple", index  = 145},
        {nom = "Cream", index  = 107},
        {nom = "Ice White", index  = 111},
        {nom = "Frost White", index  = 112},
        
        --Matte:
        {nom = "Black", index  = 12},
        {nom = "Gray", index  = 13},
        {nom = "Light Gray", index  = 14},
        {nom = "Ice White", index  = 131},
        {nom = "Blue" , index = 83},
        {nom = "Dark Blue", index  = 82},
        {nom = "Midnight Blue" , index = 84},
        {nom = "Midnight Purple", index  = 149},
        {nom = "Schafter Purple", index = 148},
        {nom = "Red" , index = 39},
        {nom = "Dark Red", index  = 40},
        {nom = "Orange", index  = 41},
        {nom = "Yellow", index  = 42},
        {nom = "Lime Green" , index = 55},
        {nom = "Green" , index = 128},
        {nom = "Forest Green", index  = 151},
        {nom = "Foliage Green" , index = 155},
        {nom = "Olive Darb", index  = 152},
        {nom = "Dark Earth" , index = 153},
        {nom = "Desert Tan", index  = 154},
        
        --Metals:
        {nom = "Brushed Steel", index  = 117},
        {nom = "Brushed Black Steel" , index = 118},
        {nom = "Brushed Aluminum", index  = 119},
        {nom = "Pure Gold" , index = 158},
        {nom = "Brushed Gold" , index = 159},
    }

    rUtils.RegisterActionZone({
        pos = vector3(-1077.752, -845.9848, 4.884186),
        action = function()
            OpenPoliceGarage()
        end,
    })

    RMenu.Add('core', 'lspd_garage', RageUI.CreateMenu("POLICE", "~b~Garage LSPD"))
    RMenu:Get('core', 'lspd_garage').Closed = function()
        open = false
        SetVehicleEngineOn(pVeh, true, true, true)
    end

    RMenu.Add('core', 'lspd_garage_color', RageUI.CreateSubMenu(RMenu:Get('core', 'lspd_garage'), "POLICE", "~b~Garage LSPD"))
    RMenu:Get('core', 'lspd_garage_color').Closed = function()end
    RMenu.Add('core', 'lspd_garage_extra', RageUI.CreateSubMenu(RMenu:Get('core', 'lspd_garage'), "POLICE", "~b~Garage LSPD"))
    RMenu:Get('core', 'lspd_garage_extra').Closed = function()end

    function OpenPoliceGarage()
        open = true
        if not IsPedInAnyVehicle(pPed, false) then rUtils.ImportantNotif("Tu n'est pas en véhicule") return end
        SetVehicleEngineOn(pVeh, false, true, true)
        RageUI.Visible(RMenu:Get('core', 'lspd_garage'), not RageUI.Visible(RMenu:Get('core', 'lspd_garage')))
        Citizen.CreateThread(function()
            while open do
                Wait(1)
                RageUI.IsVisible(RMenu:Get('core', 'lspd_garage'), true, true, true, function()

                    RageUI.ButtonWithStyle("Changer la couleur du véhicule", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                    end, RMenu:Get('core', 'lspd_garage_color'))
                    RageUI.ButtonWithStyle("Changer les extra", nil, { RightLabel = "→" }, true, function(Hovered, Active, Selected)
                    end, RMenu:Get('core', 'lspd_garage_extra'))

                    local liverie = GetVehicleLiveryCount(pVeh)

                    if liverie ~= -1 then
                        for i = 1, liverie do
                            RageUI.Button("~o~Liverie: "..i.." - ", nil, true, function(Hovered, Active, Selected)
                                if (Selected) then
                                    SetVehicleLivery(pVeh, i)
                                end
                            end)
                        end
                    end

                end, function()
                    ---Panels
                end)

                RageUI.IsVisible(RMenu:Get('core', 'lspd_garage_color'), true, true, true, function()

                    for k,v in ipairs(color) do
                        RageUI.Button(v.nom, nil, true, function(Hovered, Active, Selected)
                            if (Selected) then
                                SetVehicleColours(pVeh, v.index, v.index)
                            end
                        end)
                    end

                end, function()
                    ---Panels
                end)

                RageUI.IsVisible(RMenu:Get('core', 'lspd_garage_extra'), true, true, true, function()
                    
                    for i = 1,9 do
                        RageUI.Checkbox("Extra "..i, "Do you wish to add ketchup ?", IsVehicleExtraTurnedOn(pVeh, i), { Style = RageUI.CheckboxStyle.Tick }, function(Hovered, Selected, Active, Checked)
                        end, function()
                            SetVehicleExtra(pVeh, i, false)
                        end, function()
                            SetVehicleExtra(pVeh, i, true)
                        end)
                    end

                end, function()
                    ---Panels
                end)


            end
        end)
    end

end


RMenu.Add('core', 'lspd_tige', RageUI.CreateMenu("POLICE", "~b~Traveaux forcé LSPD"))
RMenu:Get('core', 'lspd_tige').Closed = function()
    open = false
end


local tige = {
    {titre = "TIG - 10",count = 10,},
    {titre = "TIG - 20",count = 20,},
    {titre = "TIG - 30",count = 30,},
    {titre = "TIG - 40",count = 40,},
    {titre = "TIG - 50",count = 50,},
    {titre = "TIG - 60",count = 60,},
    {titre = "TIG - 70",count = 70,},
    {titre = "TIG - 80",count = 80,},
    {titre = "TIG - 90",count = 90,},
    {titre = "TIG - 100",count = 100,},
    {titre = "TIG - 110",count = 110,},
    {titre = "TIG - 120",count = 120,},
    {titre = "TIG - 130",count = 130,},
    {titre = "TIG - 150",count = 150,},
    {titre = "TIG - 160",count = 160,},
    {titre = "TIG - 170",count = 170,},
    {titre = "TIG - 180",count = 180,},
    {titre = "TIG - 190",count = 190,},
    {titre = "TIG - 200",count = 200,},
}

local tigeAction = {
    zone = {
        {pos = vector3(233.4071, -883.4329, 30.49208),heading = 229.6169128418,},
        {pos = vector3(242.4984, -876.6624, 30.49209),heading = 307.85906982422,},
        {pos = vector3(228.459, -866.3788, 30.29225),heading = 43.696475982666,},
        {pos = vector3(218.4143, -893.0405, 30.692),heading = 144.77279663086,},
        {pos = vector3(229.272, -899.5583, 30.69216),heading = 254.54541015625,},
        {pos = vector3(216.3795, -903.4084, 30.69236),heading = 87.864738464355,},
        {pos = vector3(217.33, -913.0722, 30.69217),heading = 180.90344238281,},
    },
    action = {
        men = {
            "WORLD_HUMAN_JANITOR",
            "WORLD_HUMAN_GARDENER_LEAF_BLOWER",
            "WORLD_HUMAN_BUM_WASH",
        },
        women = {
            "WORLD_HUMAN_JANITOR",
        }
    },
    pos = vector3(229.4736, -882.8559, 30.4921),
    cloths = {
        men = {
            ["tshirt_1"] = 15,
            ["tshirt_2"] = 0,
            ["torso_1"] = 153,
            ["torso_2"] = 0,
            ["pants_1"] = 36,
            ["pants_2"] = 0,
            ["shoes_1"] = 27,
            ["shoes_2"] = 0,
            ["arms"] = 72,
            ["arms_2"] = 0,
            ["helmet_1"] = 25,
            ["helmet_2"] = 0,
            ["chain_1"] = 0,
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
            ["bproof_1"] = 3,
            ["bproof_2"] = 0,
        },
        women = {
            ["tshirt_1"] = 16,
            ["tshirt_2"] = 0,
            ["torso_1"] = 150,
            ["torso_2"] = 0,
            ["pants_1"] = 35,
            ["pants_2"] = 0,
            ["shoes_1"] = 26,
            ["shoes_2"] = 0,
            ["arms"] = 73,
            ["arms_2"] = 0,
            ["helmet_1"] = 53,
            ["helmet_2"] = 0,
            ["chain_1"] = 0,
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
            ["bproof_1"] = 5,
            ["bproof_2"] = 0,
        }
    }
}

function OpenTigeLspdMenu()
    if pJob ~= "police" then RageUI.Popup({message = "Désolé, je ne parle qu'avec des agents de police."}) return end
    if open then return end
    open = true
    RageUI.Visible(RMenu:Get('core', 'lspd_tige'), not RageUI.Visible(RMenu:Get('core', 'lspd_tige')))
    Citizen.CreateThread(function()
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'lspd_tige'), true, true, true, function()
                for k,v in pairs(tige) do
                    RageUI.Button(v.titre, "Met la personne la plus proche en "..v.titre, true, function(Hovered, Active, Selected)
                        if Selected then
                            local closet, dst = rUtils.GetClosestPlayer()
                            if dst ~= nil and dst < 2.0 then
                                local sID = GetPlayerServerId(closet)
                                TriggerServerEvent(events.tig, token, sID, v.count, tigeAction)
                            end
                        end
                        if Active then
                            rUtils.DisplayClosetPlayer()
                        end
                    end)
                end

            end, function()
                ---Panels
            end)

            

        end
    end)
end
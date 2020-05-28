RMenu.Add('core', 'props', RageUI.CreateMenu("Civil Props", " "))
RMenu:Get('core', 'props'):SetSubtitle("props Controls")
RMenu:Get('core', 'props').EnableMouse = false
RMenu:Get('core', 'props').Closed = function()
    open = false
end;

 

local propsList = {
    {
        nom = "Civil",
        props = {
            {nom = "Chaise", prop = "apa_mp_h_din_chair_12"},
            {nom = "Outils", prop = "prop_cs_trolley_01"},
            {nom = "Carton", prop = "prop_cardbordbox_04a"},
            {nom = "Outils mecano", prop = "prop_carcreeper"},
            {nom = "Sac", prop = "prop_cs_heist_bag_02"},
            {nom = "Table", prop = "apa_mp_h_din_table_06"},
            {nom = "Chaise", prop = "bkr_prop_clubhouse_chair_01"},
            {nom = "Ordinateur", prop = "bkr_prop_clubhouse_laptop_01a"},
            {nom = "Chaise Bureau", prop = "bkr_prop_clubhouse_offchair_01a"},
            {nom = "Lit Bunker", prop = "gr_prop_bunker_bed_01"},
            {nom = "Lit Biker", prop = "gr_prop_gr_campbed_01"},
            {nom = "Chaise Peche", prop = "hei_prop_hei_skid_chair"},
        }
    },
    {
        nom = "Gang",
        props = {
            {nom = "Chaise", prop = "bkr_prop_weed_chair_01a"},
            {nom = "Sac pour arme", prop = "prop_gun_case_01"},
            {nom = "Prop meth", prop = "bkr_prop_meth_pseudoephedrine"},
            {nom = "Sac de meth ouvert", prop = "bkr_prop_meth_openbag_01a"},
            {nom = "Gros sac de meth", prop = "bkr_prop_meth_bigbag_04a"},
            {nom = "Gros sac de weed", prop = "bkr_prop_weed_bigbag_03a"},
            {nom = "Weed plante", prop = "bkr_prop_weed_01_small_01a"},
            {nom = "Weed", prop = "bkr_prop_weed_dry_02b"},
            {nom = "Table de weed", prop = "bkr_prop_weed_table_01a"},
            {nom = "Cash", prop = "hei_prop_cash_crate_half_full"},
            {nom = "Valise de cash", prop = "prop_cash_case_02"},
            {nom = "Petite pile de cash", prop = "prop_cash_crate_01"},
            {nom = "Poubelle", prop = "prop_cs_dumpster_01a"},
            {nom = "Canapé", prop = "v_tre_sofa_mess_c_s"},
            {nom = "Canapé 2", prop = "v_res_tre_sofa_mess_a"},
            {nom = "Pile de cash", prop = "bkr_prop_bkr_cashpile_04"},
            {nom = "Pile de cash 2", prop = "bkr_prop_bkr_cashpile_05"},
            {nom = "Block de coke", prop = "bkr_prop_coke_block_01a"},
            {nom = "Coke en bouteille", prop = "bkr_prop_coke_bottle_01a"},
            {nom = "Coke coupé", prop = "bkr_prop_coke_cut_01"},
            {nom = "Bol de coke", prop = "bkr_prop_coke_fullmetalbowl_02"},
        }
    },
    {
        nom = "Drogues",
        props = {
            {nom = "Cocaine Block", prop = "bkr_prop_coke_block_01a"},
            {nom = "Cocaine Pallet", prop = "bkr_prop_coke_pallet_01a"},
            {nom = "Balance Cocaine", prop = "bkr_prop_coke_scale_01"},
            {nom = "Spatule Cocaine", prop = "bkr_prop_coke_spatula_04"},
            {nom = "Table Cocaine", prop = "bkr_prop_coke_table01a"},
            {nom = "Caisse", prop = "bkr_prop_crate_set_01a"},
            {nom = "Palette Weed", prop = "bkr_prop_fertiliser_pallet_01a"},
            {nom = "Palette 1", prop = "bkr_prop_fertiliser_pallet_01b"},
            {nom = "Palette 2", prop = "bkr_prop_fertiliser_pallet_01c"},
            {nom = "Palette 3", prop = "bkr_prop_fertiliser_pallet_01d"},
            {nom = "Acetone Meth", prop = "bkr_prop_meth_acetone"},
            {nom = "Bidon Meth", prop = "bkr_prop_meth_ammonia"},
            {nom = "Bac Meth", prop = "bkr_prop_meth_bigbag_01a"},
            {nom = "Bac Meth 2", prop = "bkr_prop_meth_bigbag_02a"},
            {nom = "Bac Meth 3", prop = "bkr_prop_meth_bigbag_03a"},
            {nom = "Lithium Meth", prop = "bkr_prop_meth_lithium"},
            {nom = "Phosphorus Meth", prop = "bkr_prop_meth_phosphorus"},
            {nom = "Pseudoephedrine", prop = "bkr_prop_meth_pseudoephedrine"},
            {nom = "Meth Smash", prop = "bkr_prop_meth_smashedtray_01"},
            {nom = "Machine a sous", prop = "bkr_prop_money_counter"},
            {nom = "Acetone Meth", prop = "bkr_prop_meth_acetone"},
            {nom = "Pot Weed", prop = "bkr_prop_weed_01_small_01b"},
            {nom = "Packet Weed", prop = "bkr_prop_weed_bigbag_03a"},
            {nom = "Packet Weed Ouvert", prop = "bkr_prop_weed_bigbag_open_01a"},
            {nom = "Pot Weed 2", prop = "bkr_prop_weed_bucket_01d"},
            {nom = "Weed", prop = "bkr_prop_weed_drying_01a"},
            {nom = "Weed Plante", prop = "bkr_prop_weed_lrg_01b"},
            {nom = "Weed Plante 2", prop = "bkr_prop_weed_med_01b"},
            {nom = "Table Weed", prop = "bkr_prop_weed_drying_01a"},
            {nom = "Weed Pallet", prop = "hei_prop_heist_weed_pallet"},
            {nom = "Coke", prop = "imp_prop_impexp_boxcoke_01"},
        }
    },
    {
        nom = "Armes",
        props = {
            {nom = "Malette Armes", prop = "bkr_prop_biker_gcase_s"},
            {nom = "Caisse Batteuses", prop = "ex_office_swag_guns04"},
            {nom = "Caisse Armes", prop = "ex_prop_crate_ammo_bc"},
            {nom = "Caisse Batteuses 2", prop = "ex_prop_crate_ammo_sc"},
            {nom = "Caisse Fermé", prop = "ex_prop_adv_case_sm_03"},
            {nom = "Petite Caisse", prop = "ex_prop_adv_case_sm_flash"},
            {nom = "Caisse Explosif", prop = "ex_prop_crate_expl_bc"},
            {nom = "Caisse Vetements", prop = "ex_prop_crate_expl_sc"},
            {nom = "Caisse Chargeurs", prop = "gr_prop_gr_crate_mag_01a"},
            {nom = "Grosse Caisse Armes", prop = "gr_prop_gr_crates_rifles_01a"},
            {nom = "Grosse Caisse Armes 2", prop = "gr_prop_gr_crates_weapon_mix_01a"},
        }
    },
    {
        nom = "LSPD",
        props = {
            {nom = "Cone", prop = "prop_roadcone02a"},
            {nom = "Barrière", prop = "prop_barrier_work05"},
            {nom = "Gros carton", prop = "prop_boxpile_07d"},
            {nom = "Gazebo", prop = "prop_gazebo_02"},
        }
    },
    {
        nom = "EMS",
        props = {
            {nom = "Sac mortuaire", prop = "xm_prop_body_bag"},
            {nom = "Trousse médical 1", prop = "xm_prop_smug_crate_s_medical"},
            {nom = "Trousse médical 2", prop = "xm_prop_x17_bag_med_01a"},
        }
    },
}


local categorie = {}
Citizen.CreateThread(function()
    for k,v in pairs(propsList) do
        RMenu.Add('core', v.nom, RageUI.CreateSubMenu(RMenu:Get('core', 'props'), "Props", "~b~Pose d'objets"))
        RMenu:Get('core', v.nom).Closed = function()end
        table.insert(categorie, v.nom)
    end
end)



function OpenPropsMenu()
    open = true
    Citizen.CreateThread(function()
        while open do
            Wait(1)
            RageUI.IsVisible(RMenu:Get('core', 'props'), true, true, true, function()
                for k,v in pairs(categorie) do
                    RageUI.ButtonWithStyle(v, nil, { RightLabel = "→→→"  }, true, function(Hovered, Active, Selected)
                    end, RMenu:Get('core', v))
                end
            end, function()
                ---Panels
            end)

            for k,v in pairs(categorie) do
                RageUI.IsVisible(RMenu:Get('core', v), true, true, true, function()
                    for _,i in pairs(propsList) do
                        if i.nom == v then
                            for _,j in pairs(i.props) do
                                RageUI.ButtonWithStyle(j.nom, nil, {}, true, function(Hovered, Active, Selected)
                                    if (Selected) then
                                        SpawnObj(j.prop)
                                    end
                                end)
                            end
                        end
                    end
                end, function()
                    ---Panels
                end)
            end
        end
    end)
end

RegisterNetEvent("core:OpenMenu")
AddEventHandler("core:OpenMenu", function()
    RageUI.Visible(RMenu:Get('core', 'props'), true)
end)

RegisterCommand('props', function()
    RageUI.Visible(RMenu:Get('core', 'props'), true)
end, false)
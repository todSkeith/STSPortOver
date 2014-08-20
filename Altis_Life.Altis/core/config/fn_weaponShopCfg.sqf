#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			default
			{
				["Altis Cop Shop",
					[
						["arifle_sdar_F","Taser Rifle",10000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["16Rnd_9x21_Mag","Stun Pistol Magazine",50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles_OPFOR",nil,2000],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300]
					]
				];
			};
		};
	};

	case "cop_gun":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			
			case (__GETC__(life_adminlevel) > 0):
			{
				["Altis Admin Shop",
					[
						["arifle_MXM_F",nil,0],
						["arifle_MX_F",nil,0],
						["arifle_MXM_Black_F",nil,0],
						["arifle_MX_Black_F",nil,0],
						["arifle_MX_SW_Black_F",nil,0],
						["arifle_MXC_Black_F",nil,0],
						["SMG_01_F",nil,0],
						["arifle_MK20C_F",nil,0],
						["arifle_MK20_F",nil,0],
						["arifle_Katiba_F",nil,0],
						["arifle_Katiba_C_F",nil,0],
						["hgun_ACPC2_F",nil,0],
						["hgun_P07_snds_F","Stun Pistol",0],
						["arifle_sdar_F","Taser Rifle",0],
						["hgun_Pistol_heavy_01_MRD_F",nil,0],
						["optic_MRCO",nil,0],
						["optic_Arco",nil,0],
						["optic_Holosight",nil,0],
						["optic_Holosight_smg",nil,0],
						["optic_Hamr",nil,0],
						["acc_pointer_IR",nil,0],
						["acc_flashlight",nil,0],
						["H_HelmetB_black",nil,0],
						["H_HelmetB_snakeskin",nil,0],
						["ItemGPS",nil,0],
						["ToolKit",nil,0],
						["FirstAidKit",nil,0],
						["Medikit",nil,0],
						["30Rnd_65x39_caseless_mag",nil,0],
						["30Rnd_45ACP_Mag_SMG_01",nil,0],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",0],
						["30Rnd_556x45_Stanag",nil,0],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,0],
						["30Rnd_556x45_Stanag_Tracer_Green",nil,0],
						["30Rnd_556x45_Stanag_Tracer_Yellow",nil,0],
						["30Rnd_65x39_caseless_green",nil,0],
						["9Rnd_45ACP_Mag",nil,0],
						["11Rnd_45ACP_Mag",nil,0],
						["16Rnd_9x21_Mag",nil,0],
						["30Rnd_9x21_Mag",nil,0],
						["NVGoggles_OPFOR",nil,2000],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,0],
						["Chemlight_green",nil,0],
						["Chemlight_blue",nil,0],
						["20Rnd_762x51_mag","Sell This To Give Comp",0]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 1):
			{
				["Recruit Shop",
					[
						["arifle_sdar_F","Taser Rifle",10000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["hgun_P07_F",nil,7500],
						["SMG_02_F",nil,15000],
						["muzzle_snds_L",nil,650],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125],
						["30Rnd_9x21_Mag",nil,60]
					]
				];
			};

			case (__GETC__(life_coplevel) == 2):
			{
				["Altis Patrol Officer Shop",
					[
						["arifle_MX_Black_F",nil,15000],
						["arifle_MXM_Black_F",nil,15000],
						["arifle_MXC_Black_F",nil,15000],
						["SMG_01_F",nil,15000],
						["SMG_02_F",nil,15000],
						["arifle_sdar_F","Taser Rifle",10000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["acc_flashlight",nil,750],
						["optic_Holosight",nil,1200],
						["optic_Holosight_smg",nil,1200],
						["optic_Arco",nil,2500],
						["optic_Hamr",nil,4000],
						["30Rnd_65x39_caseless_mag",nil,130],
						["30Rnd_45ACP_Mag_SMG_01",nil,150],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125],
						["30Rnd_9x21_Mag",nil,60]
					]
				];
			};

			case (__GETC__(life_coplevel) == 3):
			{
				["Altis Senior Patrol Officer Shop",
					[
						["arifle_MX_Black_F",nil,15000],
						["arifle_MXM_Black_F",nil,15000],
						["arifle_MXC_Black_F",nil,15000],
						["SMG_01_F",nil,15000],
						["SMG_02_F",nil,15000],
						["arifle_sdar_F","Taser Rifle",10000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["acc_flashlight",nil,750],
						["optic_Arco",nil,2500],
						["optic_Holosight",nil,1200],
						["optic_Holosight_smg",nil,1200],
						["optic_Hamr",nil,2500],
						["30Rnd_65x39_caseless_mag",nil,300],
						["30Rnd_45ACP_Mag_SMG_01",nil,150],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125],
						["30Rnd_9x21_Mag",nil,60]
					]
				];
			};

			case (__GETC__(life_coplevel) == 4):
			{
				["Altis Corporal Shop",
					[
						["arifle_MX_Black_F",nil,15000],
						["arifle_MXM_Black_F",nil,15000],
						["arifle_MXC_Black_F",nil,15000],
						["SMG_01_F",nil,15000],
						["SMG_02_F",nil,15000],
						["arifle_sdar_F","Taser Rifle",10000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["acc_flashlight",nil,750],
						["acc_pointer_IR",nil,5000],
						["optic_Arco",nil,2500],
						["optic_Holosight",nil,1200],
						["optic_Holosight_smg",nil,1200],
						["optic_Hamr",nil,2000],
						["30Rnd_65x39_caseless_mag",nil,300],
						["30Rnd_45ACP_Mag_SMG_01",nil,150],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125],
						["30Rnd_9x21_Mag",nil,60]
					]
				];
			};

			case (__GETC__(life_coplevel) == 5):
			{
				["Altis Sergeant Shop",
					[
						["arifle_MX_Black_F",nil,15000],
						["arifle_MXM_Black_F",nil,15000],
						["arifle_MXC_Black_F",nil,15000],
						["SMG_01_F",nil,15000],
						["SMG_02_F",nil,20000],
						["arifle_sdar_F","Taser Rifle",10000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["hgun_ACPC2_F",nil,17500],
						["optic_Arco",nil,2500],
						["optic_Holosight",nil,1200],
						["optic_Holosight_smg",nil,1200],
						["optic_Hamr",nil,2000],
						["acc_pointer_IR",nil,2500],
						["30Rnd_65x39_caseless_mag",nil,300],
						["30Rnd_45ACP_Mag_SMG_01",nil,150],
						["9Rnd_45ACP_Mag",nil,200],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125],
						["30Rnd_9x21_Mag",nil,60]
					]
				];
			};

			case (__GETC__(life_coplevel) == 6):
			{
				["Altis Lieutenant Shop",
					[
						["arifle_MX_Black_F",nil,15000],
						["arifle_MXM_Black_F",nil,15000],
						["arifle_MXC_Black_F",nil,15000],
						["SMG_01_F",nil,15000],
						["SMG_02_F",nil,15000],
						["arifle_sdar_F","Taser Rifle",10000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["hgun_ACPC2_F",nil,17500],
						["optic_Arco",nil,2500],
						["optic_Holosight",nil,1200],
						["optic_Holosight_smg",nil,1200],
						["optic_Hamr",nil,2000],
						["acc_pointer_IR",nil,2500],
						["30Rnd_65x39_caseless_mag",nil,300],
						["30Rnd_45ACP_Mag_SMG_01",nil,150],
						["9Rnd_45ACP_Mag",nil,200],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125],
						["30Rnd_9x21_Mag",nil,60]
					]
				];
			};

			case (__GETC__(life_coplevel) == 7):
			{
				["Altis Captain Shop",
					[
						["arifle_MX_Black_F",nil,15000],
						["arifle_MXM_Black_F",nil,15000],
						["arifle_MXC_Black_F",nil,15000],
						["SMG_01_F",nil,15000],
						["SMG_02_F",nil,15000],
						["arifle_sdar_F","Taser Rifle",10000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["hgun_ACPC2_F",nil,17500],
						["optic_Arco",nil,2500],
						["optic_Holosight",nil,1200],
						["optic_Holosight_smg",nil,1200],
						["optic_Hamr",nil,2000],
						["acc_pointer_IR",nil,2500],
						["30Rnd_65x39_caseless_mag",nil,300],
						["30Rnd_45ACP_Mag_SMG_01",nil,150],
						["9Rnd_45ACP_Mag",nil,200],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125],
						["30Rnd_9x21_Mag",nil,60]
					]
				];
			};

			case (__GETC__(life_coplevel) == 8):
			{
				["Altis Superintendent Shop",
					[
						["arifle_MXM_Black_F",nil,15000],
						["arifle_MX_Black_F",nil,15000],
						["arifle_MX_SW_Black_F",nil,15000],
						["arifle_MXC_Black_F",nil,15000],
						["SMG_01_F",nil,15000],
						["SMG_02_F",nil,15000],
						["arifle_sdar_F","Taser Rifle",10000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["hgun_ACPC2_F",nil,17500],
						["optic_Arco",nil,2500],
						["optic_Holosight",nil,1200],
						["optic_Holosight_smg",nil,1200],
						["optic_Hamr",nil,2000],
						["acc_pointer_IR",nil,2500],
						["30Rnd_65x39_caseless_mag",nil,300],
						["30Rnd_45ACP_Mag_SMG_01",nil,150],
						["9Rnd_45ACP_Mag",nil,200],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125],
						["30Rnd_9x21_Mag",nil,60]
					]
				];
			};

			case (__GETC__(life_coplevel) == 9):
			{
				["Altis Chief Shop",
					[
						["arifle_MXM_Black_F",nil,15000],
						["arifle_MX_Black_F",nil,15000],
						["arifle_MX_SW_Black_F",nil,15000],
						["arifle_MXC_Black_F",nil,15000],
						["SMG_01_F",nil,15000],
						["SMG_02_F",nil,15000],
						["arifle_sdar_F","Taser Rifle",10000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["hgun_ACPC2_F",nil,17500],
						["optic_Arco",nil,2500],
						["optic_Holosight",nil,1200],
						["optic_Holosight_smg",nil,1200],
						["optic_Hamr",nil,1500],
						["acc_pointer_IR",nil,2500],
						["30Rnd_65x39_caseless_mag",nil,300],
						["30Rnd_45ACP_Mag_SMG_01",nil,150],
						["9Rnd_45ACP_Mag",nil,200],
						["16Rnd_9x21_Mag",nil,50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125],
						["30Rnd_9x21_Mag",nil,60]
					]
				];
			};
		};
	};
	
	case "medic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"You are not an EMS Medic"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["Medikit",nil,100],
						["FirstAidKit",nil,150],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			case (__GETC__(life_adminlevel) > 0):
			{
				["STS Admin Shop",
					[
						["Binocular",nil,0],
						["arifle_Katiba_F",nil,0],
						["arifle_Katiba_C_F",nil,0],
						["arifle_TRG20_F",nil,0],
						["arifle_TRG21_F",nil,0],
						["arifle_Mk20_F",nil,0],
						["arifle_Mk20C_F",nil,0],
						["arifle_SDAR_F",nil,0],						
						["hgun_P07_snds_F","Stun Pistol",0],
						["hgun_ACPC2_F",nil,0],
						["hgun_Pistol_heavy_01_F",nil,0],
						["hgun_Pistol_heavy_02_F",nil,0],						
						["hgun_PDW2000_F",nil,0],
						["SMG_01_F",nil,0],
						["SMG_02_F",nil,0],		
						["hgun_signal_pistol_F",nil,0],						
						["optic_ACO_grn_smg",nil,0],
						["optic_ACO_grn",nil,0],
						["optic_ACO",nil,0],
						["optic_Arco",nil,0],
						["optic_MRCO",nil,0],
						["optic_Hamr",nil,0],
						["optic_MRD",nil,0],
						["optic_Yorris",nil,0],
						["optic_Holosight",nil,0],
						["optic_Holosight_smg",nil,0],
						["acc_flashlight",nil,0],
						["acc_pointer_IR",nil,0],						
						["NVGoggles",nil,0],
						["ToolKit",nil,0],
						["itemgps",nil,0],
						["itemmap",nil,0],
						["FirstAidKit",nil,0],
						["MiniGrenade","Flashbang",0],						
						["9Rnd_45ACP_Mag ",nil,0],
						["16Rnd_9x21_Mag",nil,0],
						["11Rnd_45ACP_Mag",nil,0],
						["6Rnd_45ACP_Cylinder",nil,0],
						["30Rnd_65x39_caseless_green",nil,0],
						["30Rnd_556x45_Stanag",nil,0],
						["30Rnd_65x39_caseless_mag",nil,0],
						["30Rnd_45ACP_Mag_SMG_01",nil,0],
						["30Rnd_65x39_caseless_green",nil,0],
						["20Rnd_556x45_UW_mag",nil,0],
						["6Rnd_Green_Signal_F",nil,0],
						["6Rnd_Red_Signal_F",nil,0],						
						["H_Bandanna_camo",nil,0],
						["H_Bandanna_cbr",nil,0],
						["H_Bandanna_gry",nil,0],
						["H_Bandanna_khk",nil,0],
						["H_Bandanna_khk_hs",nil,0],
						["H_Bandanna_mcamo",nil,0],
						["H_Bandanna_surfer",nil,0],
						["H_Beret_blk",nil,0],
						["H_Beret_brn_SF",nil,0],
						["H_Beret_grn_SF",nil,0],
						["H_Beret_red",nil,0],
						["H_Booniehat_dgtl",nil,0],
						["H_Booniehat_grn",nil,0],
						["H_Booniehat_mcamo",nil,0],
						["H_Booniehat_tan",nil,0],
						["H_Cap_blk",nil,0],
						["H_Cap_blk_Raven",nil,0],
						["H_Cap_headphones",nil,0],
						["H_CrewHelmetHeli_B",nil,0],
						["H_CrewHelmetHeli_I",nil,0],
						["H_Hat_blue",nil,0],
						["H_Hat_brown",nil,0],
						["H_Hat_checker",nil,0],
						["H_HelmetB",nil,0],
						["H_HelmetB_black",nil,0],
						["H_HelmetB_plain_blk",nil,0],
						["H_HelmetB_plain_mcamo",nil,0],
						["H_HelmetCrew_B",nil,0],
						["H_HelmetCrew_I",nil,0],
						["H_HelmetIA",nil,0],
						["H_HelmetLeaderO_ocamo",nil,0],
						["H_HelmetLeaderO_oucamo",nil,0],
						["H_HelmetSpecB",nil,0],
						["H_HelmetSpecO_blk",nil,0],
						["H_MilCap_dgtl",nil,0],
						["H_PilotHelmetFighter_B",nil,0],
						["H_PilotHelmetFighter_O",nil,0],
						["H_Shemag_khk",nil,0],
						["H_Shemag_olive",nil,0],
						["H_Shemag_tan",nil,0],
						["H_Watchcap_blk",nil,0],
						["H_Watchcap_camo",nil,0],
						["H_Watchcap_khk",nil,0],
						["H_Watchcap_sgg",nil,0],						
						["U_C_Poloshirt_blue","Poloshirt STS",0],
						["U_C_Poloshirt_burgundy","Poloshirt Burgundy",0],
						["U_C_Poloshirt_redwhite","Poloshirt Red/White",0],
						["U_C_Poloshirt_salmon","Poloshirt 70s",0],
						["U_C_Poloshirt_stripped","Poloshirt stripped",0],
						["U_C_Poloshirt_tricolour","Poloshirt Tricolor",0],
						["U_C_Poor_2","Rag tagged clothes",0],
						["U_C_HunterBody_grn","Green Hunter",0],
						["U_IG_Guerilla2_2","Green stripped shirt & Pants",0], 
						["U_IG_Guerilla3_1","Brown Jacket & Pants",0],
						["U_IG_Guerilla2_3","The Outback Rangler",0],
						["U_OG_Guerilla3_2","Tie Suite",0],
						["U_C_WorkerCoveralls","Mechanic Coveralls",0],
						["U_OrestesBody","Surfing On Land",0],
						["U_C_Scientist","Mechanic Blue",0],
						["U_NikosBody","Badass Uniform",0],
						["U_C_Journalist","Journalist Clothes",0],
						["U_NikosAgedBody","Business Casual",0],
						["U_C_Driver_1_black",nil,0],
						["U_C_Driver_1_blue",nil,0],
						["U_C_Driver_1_red",nil,0],
						["U_C_Driver_1_orange",nil,0],
						["U_C_Driver_1_green",nil,0],
						["U_C_Driver_1_white",nil,0],
						["U_C_Driver_1_yellow",nil,0],
						["U_C_Driver_2",nil,0],
						["U_C_Driver_1",nil,0],
						["U_C_Driver_3",nil,0],
						["U_C_Driver_4",nil,0],
						["U_IG_Guerilla1_1",nil,0],
						["U_I_G_Story_Protagonist_F",nil,0],
						["U_I_G_resistanceLeader_F",nil,0],
						["U_O_SpecopsUniform_ocamo",nil,0],
						["U_O_PilotCoveralls",nil,0],
						["U_IG_leader","Guerilla Leader",0],
						["U_O_OfficerUniform_ocamo",nil,0],
						["U_O_CombatUniform_oucamo",nil,0],
						["U_I_CombatUniform",nil,0],
						["U_I_CombatUniform_shortsleeve",nil,0],
						["U_O_GhillieSuit",nil,0],
						["U_I_GhillieSuit",nil,0],
						["U_B_HeliPilotCoveralls",nil,0],
						["U_B_Wetsuit",nil,0],
						["U_O_Wetsuit",nil,0],
						["U_I_Wetsuit",nil,0],
						["U_B_PilotCoveralls",nil,0],						
						["V_BandollierB_blk",nil,0],
						["V_BandollierB_cbr",nil,0],
						["V_BandollierB_rgr",nil,0],
						["V_Chestrig_blk",nil,0],
						["V_Chestrig_khk",nil,0],
						["V_HarnessO_brn",nil,0],
						["V_HarnessOGL_brn",nil,0],
						["V_PlateCarrier1_rgr",nil,0],
						["V_PlateCarrier3_rgr",nil,0],
						["V_PlateCarrierGL_rgr",nil,0],
						["V_PlateCarrierIA1_dgtl",nil,0],
						["V_PlateCarrierIA2_dgtl",nil,0],
						["V_PlateCarrierIAGL_dgtl",nil,0],
						["V_Rangemaster_belt",nil,0],
						["V_RebreatherB",nil,0],
						["V_RebreatherIA",nil,0],
						["V_RebreatherIR",nil,0],
						["V_TacVest_blk",nil,0],
						["V_TacVest_blk_POLICE",nil,0],
						["V_TacVest_brn",nil,0],
						["V_TacVest_camoe",nil,0],
						["V_TacVestCamo_khk",nil,0],						
						["B_AssaultPack_blk",nil,0],
						["B_AssaultPack_cbr",nil,0],
						["B_AssaultPack_dgtl",nil,0],
						["B_AssaultPack_khk",nil,0],
						["B_AssaultPack_mcamo",nil,0],
						["B_AssaultPack_ocamo",nil,0],
						["B_AssaultPack_rgr",nil,0],
						["B_AssaultPack_sgg",nil,0],
						["B_Carryall_cbr",nil,0],
						["B_Carryall_khk",nil,0],
						["B_Carryall_mcamo",nil,0],
						["B_Carryall_ocamo",nil,0],
						["B_Carryall_oli",nil,0],
						["B_Carryall_oucamo",nil,0],
						["B_FieldPack_blk",nil,0],
						["B_FieldPack_cbr",nil,0],
						["B_FieldPack_khk",nil,0],
						["B_FieldPack_ocamo",nil,0],
						["B_FieldPack_oli",nil,0],
						["B_FieldPack_oucamo",nil,0],
						["B_Kitbag_cbr",nil,0],
						["B_Kitbag_mcamo",nil,0],
						["B_Kitbag_rgr",nil,0],
						["B_Kitbag_sgg",nil,0],
						["B_Parachute",nil,0],
						["B_TacticalPack_blk",0],
						["B_TacticalPack_mcamo",nil,0],
						["B_TacticalPack_ocamo",nil,0],
						["B_TacticalPack_oli",nil,0],
						["B_TacticalPack_rgr",nil,0]
						
					]
				];
			};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["arifle_MK20C_F",nil,20000],
						["arifle_MK20_F",nil,25000],
						["arifle_Katiba_F",nil,35000],
						["arifle_Katiba_C_F",nil,30000],
						["arifle_SDAR_F",nil,20000],
						["SMG_01_F",nil,20000],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3600],
						["optic_Holosight_smg",nil,3600],
						["optic_Arco",nil,2500],
						["acc_flashlight",nil,1000],
						["optic_Hamr",nil,7500],
						["NVGoggles_INDEP",nil,2000],
						["30Rnd_9x21_Mag",nil,200],
						["20Rnd_556x45_UW_mag",nil,125],
						["30Rnd_556x45_Stanag",nil,300],
						["30Rnd_65x39_caseless_green",nil,275],
						["30Rnd_45ACP_Mag_SMG_01",nil,150]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			case (__GETC__(life_adminlevel) > 0):
			{
				["STS Admin Shop",
					[
						["Binocular",nil,0],
						["arifle_Katiba_F",nil,0],
						["arifle_Katiba_C_F",nil,0],
						["arifle_TRG20_F",nil,0],
						["arifle_TRG21_F",nil,0],
						["arifle_Mk20_F",nil,0],
						["arifle_Mk20C_F",nil,0],
						["arifle_SDAR_F",nil,0],						
						["hgun_P07_snds_F","Stun Pistol",0],
						["hgun_ACPC2_F",nil,0],
						["hgun_Pistol_heavy_01_F",nil,0],
						["hgun_Pistol_heavy_02_F",nil,0],						
						["hgun_PDW2000_F",nil,0],
						["SMG_01_F",nil,0],
						["SMG_02_F",nil,0],		
						["hgun_signal_pistol_F",nil,0],						
						["optic_ACO_grn_smg",nil,0],
						["optic_ACO_grn",nil,0],
						["optic_ACO",nil,0],
						["optic_Arco",nil,0],
						["optic_MRCO",nil,0],
						["optic_Hamr",nil,0],
						["optic_MRD",nil,0],
						["optic_Yorris",nil,0],
						["optic_Holosight",nil,0],
						["optic_Holosight_smg",nil,0],
						["acc_flashlight",nil,0],
						["acc_pointer_IR",nil,0],						
						["NVGoggles",nil,0],
						["ToolKit",nil,0],
						["itemgps",nil,0],
						["itemmap",nil,0],
						["FirstAidKit",nil,0],
						["MiniGrenade","Flashbang",0],						
						["9Rnd_45ACP_Mag ",nil,0],
						["16Rnd_9x21_Mag",nil,0],
						["11Rnd_45ACP_Mag",nil,0],
						["6Rnd_45ACP_Cylinder",nil,0],
						["30Rnd_65x39_caseless_green",nil,0],
						["30Rnd_556x45_Stanag",nil,0],
						["30Rnd_65x39_caseless_mag",nil,0],
						["30Rnd_45ACP_Mag_SMG_01",nil,0],
						["30Rnd_65x39_caseless_green",nil,0],
						["20Rnd_556x45_UW_mag",nil,0],
						["6Rnd_Green_Signal_F",nil,0],
						["6Rnd_Red_Signal_F",nil,0],						
						["H_Bandanna_camo",nil,0],
						["H_Bandanna_cbr",nil,0],
						["H_Bandanna_gry",nil,0],
						["H_Bandanna_khk",nil,0],
						["H_Bandanna_khk_hs",nil,0],
						["H_Bandanna_mcamo",nil,0],
						["H_Bandanna_surfer",nil,0],
						["H_Beret_blk",nil,0],
						["H_Beret_brn_SF",nil,0],
						["H_Beret_grn_SF",nil,0],
						["H_Beret_red",nil,0],
						["H_Booniehat_dgtl",nil,0],
						["H_Booniehat_grn",nil,0],
						["H_Booniehat_mcamo",nil,0],
						["H_Booniehat_tan",nil,0],
						["H_Cap_blk",nil,0],
						["H_Cap_blk_Raven",nil,0],
						["H_Cap_headphones",nil,0],
						["H_CrewHelmetHeli_B",nil,0],
						["H_CrewHelmetHeli_I",nil,0],
						["H_Hat_blue",nil,0],
						["H_Hat_brown",nil,0],
						["H_Hat_checker",nil,0],
						["H_HelmetB",nil,0],
						["H_HelmetB_black",nil,0],
						["H_HelmetB_plain_blk",nil,0],
						["H_HelmetB_plain_mcamo",nil,0],
						["H_HelmetCrew_B",nil,0],
						["H_HelmetCrew_I",nil,0],
						["H_HelmetIA",nil,0],
						["H_HelmetLeaderO_ocamo",nil,0],
						["H_HelmetLeaderO_oucamo",nil,0],
						["H_HelmetSpecB",nil,0],
						["H_HelmetSpecO_blk",nil,0],
						["H_MilCap_dgtl",nil,0],
						["H_PilotHelmetFighter_B",nil,0],
						["H_PilotHelmetFighter_O",nil,0],
						["H_Shemag_khk",nil,0],
						["H_Shemag_olive",nil,0],
						["H_Shemag_tan",nil,0],
						["H_Watchcap_blk",nil,0],
						["H_Watchcap_camo",nil,0],
						["H_Watchcap_khk",nil,0],
						["H_Watchcap_sgg",nil,0],						
						["U_C_Poloshirt_blue","Poloshirt STS",0],
						["U_C_Poloshirt_burgundy","Poloshirt Burgundy",0],
						["U_C_Poloshirt_redwhite","Poloshirt Red/White",0],
						["U_C_Poloshirt_salmon","Poloshirt 70s",0],
						["U_C_Poloshirt_stripped","Poloshirt stripped",0],
						["U_C_Poloshirt_tricolour","Poloshirt Tricolor",0],
						["U_C_Poor_2","Rag tagged clothes",0],
						["U_C_HunterBody_grn","Green Hunter",0],
						["U_IG_Guerilla2_2","Green stripped shirt & Pants",0], 
						["U_IG_Guerilla3_1","Brown Jacket & Pants",0],
						["U_IG_Guerilla2_3","The Outback Rangler",0],
						["U_OG_Guerilla3_2","Tie Suite",0],
						["U_C_WorkerCoveralls","Mechanic Coveralls",0],
						["U_OrestesBody","Surfing On Land",0],
						["U_C_Scientist","Mechanic Blue",0],
						["U_NikosBody","Badass Uniform",0],
						["U_C_Journalist","Journalist Clothes",0],
						["U_NikosAgedBody","Business Casual",0],
						["U_C_Driver_1_black",nil,0],
						["U_C_Driver_1_blue",nil,0],
						["U_C_Driver_1_red",nil,0],
						["U_C_Driver_1_orange",nil,0],
						["U_C_Driver_1_green",nil,0],
						["U_C_Driver_1_white",nil,0],
						["U_C_Driver_1_yellow",nil,0],
						["U_C_Driver_2",nil,0],
						["U_C_Driver_1",nil,0],
						["U_C_Driver_3",nil,0],
						["U_C_Driver_4",nil,0],
						["U_IG_Guerilla1_1",nil,0],
						["U_I_G_Story_Protagonist_F",nil,0],
						["U_I_G_resistanceLeader_F",nil,0],
						["U_O_SpecopsUniform_ocamo",nil,0],
						["U_O_PilotCoveralls",nil,0],
						["U_IG_leader","Guerilla Leader",0],
						["U_O_OfficerUniform_ocamo",nil,0],
						["U_O_CombatUniform_oucamo",nil,0],
						["U_I_CombatUniform",nil,0],
						["U_I_CombatUniform_shortsleeve",nil,0],
						["U_O_GhillieSuit",nil,0],
						["U_I_GhillieSuit",nil,0],
						["U_B_HeliPilotCoveralls",nil,0],
						["U_B_Wetsuit",nil,0],
						["U_O_Wetsuit",nil,0],
						["U_I_Wetsuit",nil,0],
						["U_B_PilotCoveralls",nil,0],						
						["V_BandollierB_blk",nil,0],
						["V_BandollierB_cbr",nil,0],
						["V_BandollierB_rgr",nil,0],
						["V_Chestrig_blk",nil,0],
						["V_Chestrig_khk",nil,0],
						["V_HarnessO_brn",nil,0],
						["V_HarnessOGL_brn",nil,0],
						["V_PlateCarrier1_rgr",nil,0],
						["V_PlateCarrier3_rgr",nil,0],
						["V_PlateCarrierGL_rgr",nil,0],
						["V_PlateCarrierIA1_dgtl",nil,0],
						["V_PlateCarrierIA2_dgtl",nil,0],
						["V_PlateCarrierIAGL_dgtl",nil,0],
						["V_Rangemaster_belt",nil,0],
						["V_RebreatherB",nil,0],
						["V_RebreatherIA",nil,0],
						["V_RebreatherIR",nil,0],
						["V_TacVest_blk",nil,0],
						["V_TacVest_blk_POLICE",nil,0],
						["V_TacVest_brn",nil,0],
						["V_TacVest_camoe",nil,0],
						["V_TacVestCamo_khk",nil,0],						
						["B_AssaultPack_blk",nil,0],
						["B_AssaultPack_cbr",nil,0],
						["B_AssaultPack_dgtl",nil,0],
						["B_AssaultPack_khk",nil,0],
						["B_AssaultPack_mcamo",nil,0],
						["B_AssaultPack_ocamo",nil,0],
						["B_AssaultPack_rgr",nil,0],
						["B_AssaultPack_sgg",nil,0],
						["B_Carryall_cbr",nil,0],
						["B_Carryall_khk",nil,0],
						["B_Carryall_mcamo",nil,0],
						["B_Carryall_ocamo",nil,0],
						["B_Carryall_oli",nil,0],
						["B_Carryall_oucamo",nil,0],
						["B_FieldPack_blk",nil,0],
						["B_FieldPack_cbr",nil,0],
						["B_FieldPack_khk",nil,0],
						["B_FieldPack_ocamo",nil,0],
						["B_FieldPack_oli",nil,0],
						["B_FieldPack_oucamo",nil,0],
						["B_Kitbag_cbr",nil,0],
						["B_Kitbag_mcamo",nil,0],
						["B_Kitbag_rgr",nil,0],
						["B_Kitbag_sgg",nil,0],
						["B_Parachute",nil,0],
						["B_TacticalPack_blk",0],
						["B_TacticalPack_mcamo",nil,0],
						["B_TacticalPack_ocamo",nil,0],
						["B_TacticalPack_oli",nil,0],
						["B_TacticalPack_rgr",nil,0]
						
					]
				];
			};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["hgun_pistol_heavy_01_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["optic_ACO_grn_smg",nil,2500],
						["optic_Arco",nil,2500],
						["optic_Hamr",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["V_Press_F",nil,30000],
						["NVGoggles",nil,2000],
						["16Rnd_9x21_Mag",nil,25],
						["6Rnd_45ACP_Cylinder",nil,50],
						["11Rnd_45ACP_Mag",nil,85],
						["9Rnd_45ACP_Mag",nil,45],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150],
				["ItemMap",nil,15],
				["ItemGPS",nil,100],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
};

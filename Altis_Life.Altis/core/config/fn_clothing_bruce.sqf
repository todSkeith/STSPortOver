/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Bruce's Outback Outfits"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_Marshal","Marshal Uniform", 1000],
			["U_C_Poloshirt_blue","Poloshirt STS",250],
			["U_C_Poloshirt_burgundy","Poloshirt Burgundy",275],
			["U_C_Poloshirt_redwhite","Poloshirt Red/White",150],
			["U_C_Poloshirt_salmon","Poloshirt 70s",175],
			["U_C_Poloshirt_stripped","Poloshirt stripped",125],
			["U_C_Poloshirt_tricolour","Poloshirt Tricolor",350],
			["U_C_Poor_2","Rag tagged clothes",250],
			["U_C_HunterBody_grn","Green Hunter",1500],
			["U_IG_Guerilla2_2","Green stripped shirt & Pants",650],																												
			["U_IG_Guerilla3_1","Brown Jacket & Pants",735],
			["U_IG_Guerilla2_3","The Outback Rangler",1200],
			["U_OG_Guerilla3_2","Tie Suite",5000],
			["U_C_WorkerCoveralls","Mechanic Coveralls",2500],
			["U_OrestesBody","Surfing On Land",1100],
			["U_C_Scientist","Mechanic Blue",3000],	
			["U_NikosBody","Badass Uniform",5000],
			["U_C_Journalist","Journalist Clothes",5000],
			["U_NikosAgedBody","Business Casual",5000],
			["U_C_Driver_1_black",nil,1500],
	 		["U_C_Driver_1_blue",nil,1500],
	 		["U_C_Driver_1_red",nil,1500],
	 		["U_C_Driver_1_orange",nil,1500],
	 		["U_C_Driver_1_green",nil,1500],
	 		["U_C_Driver_1_white",nil,1500],
	 		["U_C_Driver_1_yellow",nil,1500],
	 		["U_C_Driver_2",nil,3500],
	 		["U_C_Driver_1",nil,3600],
	 		["U_C_Driver_3",nil,3700],
	 		["U_C_Driver_4",nil,3700]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Cap_marshal","Marshal Hat",175],
			["H_Bandanna_camo","Camo Bandanna",120],
			["H_Bandanna_surfer","Surfer Bandanna",130],
			["H_Bandanna_gry","Grey Bandanna",150],
			["H_Bandanna_cbr",nil,165],
			["H_Bandanna_surfer",nil,135],
			["H_Bandanna_khk","Khaki Bandanna",145],
			["H_Bandanna_sgg","Sage Bandanna",160],
			["H_StrawHat","Straw Fedora",225],
			["H_BandMask_blk","Hat & Bandanna",300],
			["H_Booniehat_tan",nil,425],
			["H_Hat_blue",nil,310],
			["H_Hat_brown",nil,276],
			["H_Hat_checker",nil,340],
			["H_Hat_grey",nil,280],
			["H_Hat_tan",nil,265],
			["H_Cap_blu",nil,150],
			["H_Cap_grn",nil,150],
			["H_Cap_grn_BI",nil,150],
			["H_Cap_oli",nil,150],
			["H_Cap_red",nil,150],
			["H_Cap_tan",nil,150],
			["H_Cap_blk_CMMG","Black Cap",200],
			["H_Cap_headphones","HeadPhones Cap",800],
			["H_Cap_press","Press Cap",800],
			["H_Cap_tan",nil,150],
			["H_RacingHelmet_1_black_F",nil,1000],
 			["H_RacingHelmet_1_red_F",nil,1000],
 			["H_RacingHelmet_1_white_F",nil,1000],
 			["H_RacingHelmet_1_blue_F",nil,1000],
 			["H_RacingHelmet_1_yellow_F",nil,1000],
 			["H_RacingHelmet_1_green_F",nil,1000],
 			["H_RacingHelmet_1_F",nil,2500],
 			["H_RacingHelmet_2_F",nil,2500],
 			["H_RacingHelmet_3_F",nil,2500],
 			["H_RacingHelmet_4_F",nil,2500]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Bandanna_aviator","Aviator Bandanna",500],
			["G_Bandanna_beast","Beast Bandanna",500],
			["G_Bandanna_blk","Black Bandanna",500],
			["G_Bandanna_khk","Khaki Bandanna",500],
			["G_Bandanna_oli","Olive Bandanna",500],
			["G_Bandanna_shades","Bandanna with Shades",500],
			["G_Bandanna_sport","Sport Bandanna",500],
			["G_Bandanna_tan","Tan Bandanna",500],
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Aviator",nil,100],
			["G_Lady_Mirror",nil,150],
			["G_Lady_Dark",nil,150],
			["G_Lady_Blue",nil,150],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55],
			["G_Goggles_VR",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		[
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_FieldPack_ocamo",nil,1250],
			["B_Kitbag_rgr",nil,3000],
			["B_Kitbag_sgg",nil,3000],
			["B_Kitbag_cbr",nil,3000],
			["B_Kitbag_mcamo",nil,3000],
			["B_Bergen_sgg",nil,3000],
			["B_Carryall_oli",nil,3000],
			["B_Carryall_ocamo",nil,3000],
			["B_Carryall_oucamo",nil,3000],
			["B_Carryall_mcamo",nil,3000],
			["B_Carryall_cbr",nil,3000],
			["B_Carryall_khk",nil,4000]
		];
	};
};
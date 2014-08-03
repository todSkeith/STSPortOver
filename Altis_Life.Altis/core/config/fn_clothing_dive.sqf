/*
	File: fn_clothing_dive.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Altis Diving Shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Steve's Diving Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_O_Wetsuit","Camo Wetsuit",2000],
			["U_I_Wetsuit","Green Wetsuit",2000]
		];
	};
	
	//Hats
	case 1:
	{
		[
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Diving","Black Diving Goggles",500],
			["G_I_Diving","Green Diving Goggles",500]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_RebreatherO","Camo Rebreather",5000],
			["V_RebreatherIA","Green Rebreather",5000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
		];
	};
};
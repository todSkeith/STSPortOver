#include <macro.h>
/*
	File: fn_equipGear.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Initializes custom gear textures
*/
switch (true) do {
	case ((uniform player) == "U_Rangemaster" && playerSide == west): {
		switch (__GETC__(life_coplevel)) do {
			case 1: { [player,"images\Cadet_Uni.jpg"] call life_fnc_setUniform; };
			case 2: { [player,"images\PO_Uni.jpg"] call life_fnc_setUniform; };
			case 3: { [player,"images\SPO_Uni.jpg"] call life_fnc_setUniform; };
			case 4: { [player,"images\Corp_Uni.jpg"] call life_fnc_setUniform; };
			case 5: { [player,"images\Serg_Uni.jpg"] call life_fnc_setUniform; };
			case 6: { [player,"images\Lieut_Uni.jpg"] call life_fnc_setUniform; };
			case 7: { [player,"images\Capt_Uni.jpg"] call life_fnc_setUniform; };
			case 8: { [player,"images\SuperInt_Uni.jpg"] call life_fnc_setUniform; };
			case 9: { [player,"images\Chief_Uni.jpg"] call life_fnc_setUniform; };
		};		
	};
	
	case ((uniform player) == "U_B_CombatUniform_mcam" && playerSide == west): {
		[player,"images\GenC.jpg"] call life_fnc_setUniform;
	};

	case ((uniform player) == "U_I_CombatUniform" && playerSide == independent): {
		[player,"images\ems_uni.jpg"] call life_fnc_setUniform;
	};
	
	case ((uniform player) == "U_C_Poloshirt_salmon"): {
		[player,"images\pol3.jpg"] call life_fnc_setUniform;
	};
	
	case ((uniform player) == "U_C_Poloshirt_blue"): {
		[player,"images\polosts.jpg"] call life_fnc_setUniform;
	};
	
	case ((uniform player) == "U_C_Scientist"): {
		[player,"images\mech.jpg"] call life_fnc_setUniform;
	};
	case ((uniform player) == "U_OG_Guerilla3_2"): {
		[player,"images\tiee11.jpg"] call life_fnc_setUniform;
	};
};
if (playerSide == west) then {
	player setVariable ["coplevel",__GETC__(life_coplevel)];
};
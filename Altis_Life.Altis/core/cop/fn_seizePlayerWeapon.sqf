//////////////////////////////////////////////////////////////////
// Created by: DirtDiver for STS
// Function Name:life_fnc_seizePlayerIllegalAction
// Description: Action for seizing illegal items
// Adapted from: Skalicon
//////////////////////////////////////////////////////////////////

_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if (side _unit != civilian) exitWith {hint "You cannot seize from cops or medics.";};
if(player distance _unit > 4) exitWith {};

[[player],"life_fnc_seizePlayerWeaponAction",_unit,false] spawn BIS_fnc_MP;
titleText [format["Seized weapons from %1", name _unit],"PLAIN"];
//[[52, player, format["Seized weapons from %1", name _unit]],"ASY_fnc_logIt",false,false] spawn BIS_fnc_MP;

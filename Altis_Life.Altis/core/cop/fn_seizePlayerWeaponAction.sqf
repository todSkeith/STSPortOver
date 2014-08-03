//////////////////////////////////////////////////////////////////
// Created by: DirtDiver for STS
// Function Name: life_fnc_seizeIllegal
// Description: Removes Players Illegal Items & Weapons
// Adapted from: Skalicon
//////////////////////////////////////////////////////////////////

private["_cop"];
_cop = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _cop) exitWith {}; //bobbus says no

removeAllWeapons player;

player setVariable ["life_holstered_weapon",""];
player setVariable["holstered",["",""]];

//license_civ_gun = false;
life_holstered_weapon = nil;  //can probably set to "", not sure if it matters
[] call life_fnc_civFetchGear;
[] call life_fnc_sessionUpdate; //Should make weapon remove persistent
[] call life_fnc_civLoadGear;
titleText [format["Your weapons have been seized by %1.",name _cop],"PLAIN"]; //no

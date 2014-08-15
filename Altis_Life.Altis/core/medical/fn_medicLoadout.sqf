/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
removeAllContainers player;
removeAllWeapons player;
player forceAddUniform "U_I_CombatUniform";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
removeGoggles player;
removeHeadGear player;
if(hmd player != "") then {
	player unlinkItem (hmd player);
};

[[player,0,"images\ems_uni.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
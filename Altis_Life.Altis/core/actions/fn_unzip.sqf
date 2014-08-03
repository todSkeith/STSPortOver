/*
	File: fn_unzip.sqf
*/
private["_unit"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit || !(_unit getVariable "zipTie")) exitWith {};
if(player distance _unit > 4) exitWith {};

[[_unit, "zip_tie",10],"life_fnc_playSound",true,false] spawn life_fnc_MP;
_unit setVariable ["zipTie",false,true];
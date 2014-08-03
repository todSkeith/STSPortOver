/*
	File: fn_zipTie.sqf
	Author: Bad^^Eye
	
	Description:
	Main functionality for civ restrain
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(_unit getVariable "restrained" || _unit getVariable "Escorting" || _unit getVariable "zipTie" || _unit getVariable "unconscious") exitWith {};
if (!(_unit getVariable ["surrender",false]) && !(animationState _unit == "Incapacitated")) exitWith {};
if(isNull _unit) exitWith {}; //Not valid
if(player == _unit) exitWith {};
if(life_inv_zip == 0) exitWith {};
if(player getVariable ["restrained",false] || player getVariable ["zipTie",false] || player getVariable ["surrender",false] || player getVariable ["unconscious",false] || (animationState player == "Incapacitated")) exitWith {};
if(player distance _unit > 4) exitWith {};

life_inv_zip = life_inv_zip - 1;
	
[[_unit, "zip_tie",10],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[player],"life_fnc_zipTieAction",_unit,false] spawn life_fnc_MP;


/*
	File: fn_knockoutAction.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by MrBoolean
	
	Description:
	50/50 chance of knockout - If success, 45 second cooldown, if failure, 10 damage + 30 second cooldown
*/
private["_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if(isNull _target) exitWith {};
if(!isPlayer _target) exitWith {};
if(player distance _target > 4) exitWith {};

_chance = random 100;

if(_chance >= 50) then {
	life_knockout = true;
	[[player,"AwopPercMstpSgthWrflDnon_End2"],"life_fnc_animSync",nil,false] spawn life_fnc_MP;
	sleep 0.08;
	[[_target,profileName],"life_fnc_knockedOut",_target,false] spawn life_fnc_MP;
	sleep 45;
	life_knockout = false;
} else {
	life_knockout = true;
	_target setDamage ((damage _target)+0.2);
	cutText ["Knockout Failed! You only hurt him!","PLAIN"];
	sleep 30;
	life_knockout = false;
};
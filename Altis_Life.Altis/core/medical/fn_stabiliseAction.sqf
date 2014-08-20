/*
	File: fn_stabiliseAction
	
	Author: Bobbus
	
	Description: is sent to client to extend bleedout time of player
*/

_medic = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if (isNull _medic) exitWith {};
if (!isPlayer _medic) exitWith {};
if(!(player getVariable ["unconscious",false])) exitWith {};

titleText [format ["%1 is stabilising your wounds...",name _medic],"PLAIN"];
sleep 4;
life_bleedout = time + (60*15);
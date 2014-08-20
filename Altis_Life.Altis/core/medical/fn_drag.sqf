/*
	File: fn_drag.sqf
	
	Author Skeith
	
	Description: action that makes medic drag player.
*/

_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a 'Man'
if(!isPlayer _unit) exitWith {}; //Not a human player
if(player distance _unit > 4) exitWith {};

_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
player setVariable["isDragging",true,true];
player setVariable["dragging",_unit,true];
life_action_inUse = true;
_unit attachTo [player, [0, 1.1, 0.092]];
_unit setDir 180;
if(currentWeapon player != "") then {player playMoveNow "AcinPknlMstpSrasWrflDnon";} 
else {player playMoveNow "AcinPknlMstpSnonWnonDnon";}; 
_dragact = player addAction ["<t color=""#C90000"">" + "Release" + "</t>", { 
	player setVariable["isDragging",false,true];
	life_action_inUse = false;
	_unit = player getVariable "dragging";
	_unit switchMove "AinjPpneMstpSnonWrflDnon"; 
	player playMoveNow "AmovPercMstpSnonWnonDnon"; 
	detach _unit;
	_act = _this select 2;
	player removeAction _act;
},"",10,true];

while {(player getVariable "isDragging")} do {
	if(!(player getVariable "isDragging")) then {player removeAction _id;};
};
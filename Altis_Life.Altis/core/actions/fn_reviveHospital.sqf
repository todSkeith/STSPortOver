/*
	File: fn_reviveHospital.sqf
	Author: Bobbus
	
	Description:
	Doesn't matter, will be revised later.
*/
private["_near","_furthest","_drAlan"];
_drAlan = _this select 0;
if(life_cash < 1000) exitWith {hint "You do not have $1,000 for your friend to be revived."};
_near = nearestObjects[getPos _drAlan,["Man"],10];
_furthest = objNull;
{
	if (_x getVariable ["unconscious",false]) then {
		_furthest = _x;
	};
} forEach _near;

if(isNull _furthest || !isPlayer _furthest) exitWith {titleText["Your friend needs to be within 5m to be healed.","PLAIN"]};

titleText[format["Doctor Alan will begin reviving %1...",name _furthest],"PLAIN"];
[[_drAlan],"life_fnc_reviveAction",_furthest,false] spawn life_fnc_MP;
life_cash = life_cash - 1000;
#include <macro.h>
/*
	File: fn_adminRepairBuild.sqf
	Author: ColinM9991
	Edited and Modified by CDawg for STS
	Description:
	Opens the Debug Console.
	No it doesn't, it repairs buildings.
*/
if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};
_buildings = nearestobjects [getPos player,["Building"], 10];

{
	_x setDamage 0;
} forEach _buildings;
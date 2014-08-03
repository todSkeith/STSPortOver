/*
	File: fn_packupRoadcones.sqf
	Author: skeith
	
	Description:
	Packs up the nearest Roadblock.
*/

private["_barriers"];
_action = _this select 2;
_barriers = _this select 3;
if(isNil "_barriers") then {};

if([true,"RoadBlockWood",1] call life_fnc_handleInv) then
{
	titleText["You have removed the Road Block.","PLAIN"];
	player removeAction _action;
	life_action_barrierPickup = nil;
	{ deleteVehicle _x } forEach _barriers;
};
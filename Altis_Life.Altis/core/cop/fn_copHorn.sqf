/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the cop Horn sound for other players
*/
private["_vehicle"];
_vehicle = _this select 0;

if(!alive _vehicle) exitWith {};
if(isNull _vehicle) exitWith {};

_vehicle say3D "police_horn";

sleep 1;
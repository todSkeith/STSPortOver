/*
	File: fn_getBuildID.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Gets the Object ID of a static building

	Edited and Modified by: CDawg
*/

private ["_house","_buildingID"];

_house = cursorTarget;

_buildingID = [_house] call life_fnc_getBuildID;

hint format["BuildID: %1",_buildingID];



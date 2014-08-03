/*
	File: fn_packupRoadcones.sqf
	Author: Skeith
	
	Description:
	Packs up the nearest Roadcone strip.
*/
private["_cones1","_cones2","_cones3","_cones4","_cones5"];
_cones1 = nearestObjects[getPos player,["RoadCone_F"],8] select 0;
_cones2 = nearestObjects[getPos player,["RoadCone_F"],8] select 1;
_cones3 = nearestObjects[getPos player,["RoadCone_F"],8] select 2;
_cones4 = nearestObjects[getPos player,["RoadCone_F"],8] select 3;
_cones5 = nearestObjects[getPos player,["RoadCone_F"],8] select 4;
if(isNil "_cones1") then {};

if([true,"RoadConeStrip",1] call life_fnc_handleInv) then
{
	titleText["You have removed the cone strip.","PLAIN"];
	player removeAction life_action_coneStripPickup;
	life_action_coneStripPickup = nil;
	deleteVehicle _cones1;	
	deleteVehicle _cones2;
	deleteVehicle _cones3;
	deleteVehicle _cones4;
	deleteVehicle _cones5;
};
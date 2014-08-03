/*
	File: fn_roadconeStrip.sqf
	Author: Skeith
	
	Description:
	Creates a strip of road cones and preps it.
*/

private["_position","_cones"];
_cones1 = "RoadCone_F" createVehicle [0,2,0];
_cones2 = "RoadCone_F" createVehicle [0,3,0];
_cones3 = "RoadCone_F" createVehicle [0,4,0];
_cones4 = "RoadCone_F" createVehicle [0,5,0];
_cones5 = "RoadCone_F" createVehicle [0,6,0];
_cones1 attachTo[player,[0,2,0]];
_cones2 attachTo[player,[0,3,0]];
_cones3 attachTo[player,[0,4,0]];
_cones4 attachTo[player,[0,5,0]];
_cones5 attachTo[player,[0,6,0]];
_cones1 setVariable["item","coneDeployed",true];
_cones2 setVariable["item","coneDeployed",true];
_cones3 setVariable["item","coneDeployed",true];
_cones4 setVariable["item","coneDeployed",true];
_cones5 setVariable["item","coneDeployed",true];

life_action_coneStripDeploy = player addAction["Place Cone Strip",{if(!isNull life_cones1) then {detach life_cones1;detach life_cones2;detach life_cones3;detach life_cones4;detach life_cones5; life_cones1 = ObjNull;life_cones2 = ObjNull;life_cones3 = ObjNull;life_cones4 = ObjNull;life_cones5 = ObjNull;}; player removeAction life_action_coneStripDeploy; life_action_coneStripDeploy = nil;},"",999,false,false,"",'!isNull life_cones1'];
life_cones1 = _cones1;
life_cones2 = _cones2;
life_cones3 = _cones3;
life_cones4 = _cones4;
life_cones5 = _cones5;
waitUntil {isNull life_cones1};
if(!isNil "life_action_conesDeploy") then {player removeAction life_action_conesDeploy;};
if(isNull _cones1) exitWith {life_cones1 = ObjNull;};
if(isNull _cones2) exitWith {life_cones2 = ObjNull;};
if(isNull _cones3) exitWith {life_cones3 = ObjNull;};
if(isNull _cones4) exitWith {life_cones4 = ObjNull;};
if(isNull _cones5) exitWith {life_cones5 = ObjNull;};
_cones1 setPos [(getPos _cones1 select 0),(getPos _cones1 select 1),0];
_cones2 setPos [(getPos _cones2 select 0),(getPos _cones2 select 1),0];
_cones3 setPos [(getPos _cones3 select 0),(getPos _cones3 select 1),0];
_cones4 setPos [(getPos _cones4 select 0),(getPos _cones4 select 1),0];
_cones5 setPos [(getPos _cones5 select 0),(getPos _cones5 select 1),0];
life_action_coneStripPickup = player addAction["Pack up Cone Strip",life_fnc_packupRoadcones,"",0,false,false,"",
' _conestr = nearestObjects[getPos player,["RoadCone_F"],8] select 0; !isNil "_conestr" && !isNil {(_conestr getVariable "item")} '];
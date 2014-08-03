/*
	File: fn_roadblockWood.sqf
	Author: Skeith
	
	Description:
	Spawns a Wooden roadblock on the player waiting for placement.
*/
private["_barrier1","_barrier2"];
_pos = [0,0,0];
_barrier1 = "RoadBarrier_F" createVehicle _pos;
_barrier2 = "RoadBarrier_F" createVehicle _pos;
_barrier1 setVariable ["item","barrierDeployed",true];
_barrier2 setVariable ["item","barrierDeployed",true];
_barrier1 attachTo[player,[0,2,0]];
_barrier2 attachTo[player,[0,5,0]];
_barrier1 setDir 90;
_barrier2 setDir 90;

life_action_barrierDeploy = player addAction["Place Wooden Barrier",{if(!isNull life_barrier1) then {detach life_barrier1;detach life_barrier2; life_barrier1 = ObjNull; life_barrier2 = ObjNull;}; player removeAction life_action_barrierDeploy; life_action_barrierDeploy = nil;},"",999,false,false,"",'!isNull life_barrier1'];
life_barrier1 = _barrier1;
life_barrier2 = _barrier2;
waitUntil {isNull life_barrier1};
if(!isNil "life_action_barrierDeploy") then {player removeAction life_action_barrierDeploy;};
if(isNull _barrier1) exitWith {life_barrier1 = ObjNull;};
if(isNull _barrier2) exitWith {life_barrier2 = ObjNull;};

_barrier1 setPos [(getPos _barrier1 select 0),(getPos _barrier1 select 1),0];
_barrier2 setPos [(getPos _barrier2 select 0),(getPos _barrier2 select 1),0];

player addAction["Pack up Wooden Barrier",life_fnc_packupRoadblock,[_barrier1,_barrier2],0,false,false,"",
' _bar = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_bar" && !isNil {(_bar getVariable "item")} '];
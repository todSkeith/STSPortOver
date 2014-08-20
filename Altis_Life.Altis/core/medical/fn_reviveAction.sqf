/*
	File: fn_reviveAction.sqf
	
	Author: Skeith
	
	Description: This gets sent to the unconscious client to revive them
*/
private["_medic"];
_medic = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if (isNull _medic) exitWith {};
// (!isPlayer _medic) exitWith {};
if(!(player getVariable ["unconscious",false])) exitWith {};

titleText [format ["You are being revived by %1...",name _medic],"PLAIN"];
player setVariable ["unconscious",false,true];
sleep 38.58;
if (!alive player) exitWith {}; //stops reviving if they died
//deleteMarker name player;
player enableSimulation true;
player allowDamage true;
player setDamage 0;
player playMoveNow "amovppnemstpsraswrfldnon";

//Trying different method to avoid being in the ground
//if(getPos player select 2 < 0) then {player setPos [getPos player select 0, getPos player select 1, 0];};
_pDir = (getDir _medic) - (getDir player);
player attachTo [_medic,[0,0.5,0]];
player setDir _pDir;
sleep 1;
detach player;

//Rez sickness feat. broke ass legs
player setFatigue 1;
player setHitPointDamage ["hitLegs",1];
#include <macro.h>
/*
	File: fn_revive
	
	Author: Skeith
	
	Description: is used by the medics to revive players
*/
private["_target","_unit"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if (isNull _target) exitWith {};
if (!isPlayer _target) exitWith {};
if(!(_target getVariable ["unconscious",false])) exitWith {};
if(player distance _target > 4) exitWith {};
[[player], "life_fnc_reviveAction", _target, false] spawn BIS_fnc_MP;
[] spawn {
	player playMove "AinvPknlMstpSnonWnonDr_medic0";
	sleep 9.090;
	player playMoveNow "AinvPknlMstpSnonWnonDr_medic1";
	sleep 4.761;
	player playMoveNow "AinvPknlMstpSnonWnonDr_medic2";
	sleep 7.592;
	player playMoveNow "AinvPknlMstpSnonWnonDr_medic3";
	sleep 7.592;
	player playMoveNow "AinvPknlMstpSnonWnonDr_medic4";
	sleep 4.545;
	player playMoveNow "AinvPknlMstpSnonWnonDr_medic5";
};

life_atmcash = life_atmcash + __GETC__(life_revive_fee);
hint format["You have revived %1\n\nYou have received $%2 for saving a life!",name _target,life_revive_fee];
_target allowDamage true;
_target setDamage 0;
_target enableSimulation true;
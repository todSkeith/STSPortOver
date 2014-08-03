#include <macro.h>

/*
	File: fn_onRespawn.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Execute various actions when the _unit respawns.
*/
private["_unit","_corpse","_handle","_spawn"];
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_corpse = [_this,1,objNull,[objNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
/* Players drop everything "Testing"
if(!isNull _corpse) then{deleteVehicle _corpse;};

hideBody _corpse;
deleteVehicle _corpse;
//_handle = [] spawn life_fnc_setupActions;
//waitUntil {scriptDone _handle};
*/

/*
if (player getVariable ["wounded", false]) then {
	[_corpse] spawn life_fnc_wounded;
} else {
	deleteVehicle _corpse;
	player setPos (markerPos "spawn_island");

	_handle = [] spawn life_fnc_initActions;
	waitUntil { scriptDone _handle };
};
	*/
switch(playerSide) do
{
	case west:
	{
		[] spawn life_fnc_copDefault;
		life_holstered_weapon = nil;
		_unit setVariable["unconscious",false,true];
		_unit setVariable["executed",false,true];
		_unit setVariable["zipTie",false,true];
		_unit setVariable["Escorting",false,true];
		_unit setVariable["transporting",false,true];
	};

	case civilian:
	{
		_unit setVariable["restrained",false,true];
		_unit setVariable["Escorting",false,true];
		_unit setVariable["transporting",false,true];
		_unit setVariable["unconscious",false,true];
		_unit setVariable["zipTie",false,true];
		_unit setVariable["executed",false,true];
		if(headGear player != "") then {removeHeadgear player;};
		if(goggles player != "") then {removeGoggles player;};
		life_holstered_weapon = nil;
	};

	case independent:
	{
		life_holstered_weapon = nil;
		_unit setVariable["restrained",false,true];
		_unit setVariable["Escorting",false,true];
		_unit setVariable["transporting",false,true];
		_unit setVariable["unconscious",false,true];
		_unit setVariable["zipTie",false,true];
		_unit setVariable["executed",false,true];
		[] call life_fnc_medicLoadGear;
		[] call life_fnc_equipGear;

	};
};

if(life_is_arrested) then
{
	hint "You tried to suicide from jail, you will be jailed again with a longer time.";
	life_is_arrested = false;
	[_unit,true] spawn life_fnc_jail;
}
	else
{
	titleText["","BLACK FADED"];
	titleFadeOut 9999999999;
	[] call life_fnc_spawnMenu;
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
};

if(playerSide == west) then {
	private["_getRank"];
	_getRank = call life_coplevel;
	player setVariable["coplevel",_getRank,true];
};

_unit addRating 100000;

[[_unit,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
[] call life_fnc_hudUpdate;
cutText ["","BLACK IN"];

[] call life_fnc_civFetchGear;
[1,true] call life_fnc_sessionHandle;
[] call life_fnc_sessionUpdate;

life_holstered = false;

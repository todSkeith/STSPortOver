//////////////////////////////////////////////////////////////////
// Created by: STS Dev team
// Function Name: life_fnc_abortControl
// Description: Enables/Disables Abort Button while Restrained.
//////////////////////////////////////////////////////////////////

private["_display","_abortB","_respawnB", "_timer","_timerDone"];

if((call life_adminlevel) > 0) exitWith {};

disableSerialization;

//((findDisplay 49) displayCtrl 104) ctrlEnable true;
waitUntil {!(isNull (findDisplay 49))};
_display = findDisplay 49;
_abortB = _display displayCtrl 104;
_respawnB = _display displayCtrl 1010; 
_respawnB ctrlEnable false;
_abortB ctrlEnable false;
[] call life_fnc_sessionUpdate;
//_abortB ctrlSetEventHandler ["onMouseButtonClick", "deleteMarker name player"];

if ((player getVariable "restrained") || (player getVariable "Escorting") || (player getVariable "transporting") || life_is_arrested || life_istazed) then
{
	_respawnB ctrlEnable false;
	_abortB ctrlEnable false;
	_abortB ctrlSetText "Abort Disabled";
	_respawnB ctrlSetText "Respawn Disabled";
}
else
{	
	_timer = 10; //seconds
	_timer = _timer - 1;
	_timerDone = false;
	for "_i" from 0 to _timer do
	{
		if(_i >= _timer) exitWith {_timerDone = true;};
		_abortB ctrlSetText format ["Abort in %1s",(_timer - _i)];
		_respawnB ctrlSetText format ["Respawn in %1s",(_timer - _i)];
		sleep 1;
	};
	
	waitUntil {_timerDone};
	_respawnB ctrlEnable true;
	_respawnB ctrlSettext "Respawn";
	if (player getVariable ["unconscious",false]) then 
	{
		_abortB ctrlEnable false;
		_abortB ctrlSetText "Can't Abort While Unconscious";
	}
	else
	{
		_abortB ctrlSettext "Abort";
		_abortB ctrlEnable true;
	};
};

  
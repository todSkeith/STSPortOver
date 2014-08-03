/*
	File: fn_confirm
	Author: Bobbus
	
	Description:
	Prompts the player to confirm the action.
*/
private["_switch","_action"];
if(!isNull (findDisplay 2610)) exitwith {}; //Already at the menu, block for abuse?
_switch = _this select 0;
_action = _this select 0;
if(isNull _switch) exitWith {};

createDialog "life_confirm";
disableSerialization;
waitUntil {!isnull (findDisplay 2600)};
_display = findDisplay 2610;
_text = _display displayCtrl 2611;
_button = _display displayCtrl 2612;

_button buttonSetAction "[0,0,0,_action] call life_fnc_buyLicense";

switch (_switch) do {
	case "license_bh": {
		_text ctrlSetStructuredText parseText "<t align='center'><t size='.8px'>Your Bounty Hunting license will be replaced.";
	};
	
	case "license_c3": {
		_text ctrlSetStructuredText parseText "<t align='center'><t size='.8px'>Your Class III Weapons license will be replaced.";
	};
	
	case "license_rebel": {
		_text ctrlSetStructuredText parseText "<t align='center'><t size='.8px'>Your Rebel Training license will be replaced.";
	};
};

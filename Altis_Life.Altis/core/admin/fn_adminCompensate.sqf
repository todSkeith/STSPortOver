#include <macro.h>
/*
	File: fn_adminCompensate.sqf
	Author: ColinM9991
	Edited and Modified by CDawg for STS
	Description:
	Figure it out.
*/
private["_value","_action"];
if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0; hint "You have no business using this";};
_value = parseNumber(ctrlText 9922);
if(_value < 0) exitWith {};
if(_value > 999999) exitWith {hint localize "STR_Admin_Fail"};
//if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_AIM_notnumeric"}; //This doesn't actually work.

_action = [
	format [localize "STR_Admin_CompWarn",_value],
	localize "STR_Admin_Compensate",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	life_cash = life_cash + _value;
	hint format [localize "STR_Admin_Success",_value];
	["conFileTime",format ["Comp Message: Admin %1 has given himself $%2",profileName,_value]] call diaglog;
	closeDialog 0;
} else {
	hint localize "STR_NOTF_ActionCancel";
	closeDialog 0;
};
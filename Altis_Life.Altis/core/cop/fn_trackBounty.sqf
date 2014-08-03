/*
	File: fn_trackBounty.sqf
	Author: Bobbus
	
	Description:
	Used to show chat message when wanted crim accesses ATM
*/

private["_unit","_pos","_posx","_posy","_loc"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_pos = [_this,0,[0,0,0],[[]]] call BIS_fnc_param;

if (isNull _unit) exitWith {};
if (_pos select 0 == 0) exitWith {};
if (side player != west) exitWith {};

_posx = _pos select 0;
_posx = floor(_posx / 100);
switch (true) do {
	case (_posx < 100): { _posx = format["0%1",_posx]; };
	case (_posx < 10): { _posx = format["00%1",_posx]; };
};
_posy = _pos select 1;
_posy = floor(_posy / 100);
switch (true) do {
	case (_posy < 100): { _posy = format["0%1",_posy]; };
	case (_posy < 10): { _posy = format["00%1",_posy]; };
};
_loc = format["%1%2",_posx,_posy];

systemChat format["%1 has accessed an ATM at %2",_unit,_loc];
/*
	File: fn_unconsciousMarkers
	
	Author: Skeith
	
	Description: places markers on the map and handles their removal
	
	Use spawn BIS_fnc_MP
*/

_unit = _this select 0;

if(isServer || playerSide == independent) then {

	_marker = createMarkerLocal [format["%1", name _unit], visiblePosition _unit];
	name _unit setMarkerColorLocal "ColorRed";
	name _unit setMarkerTextLocal format["%1 is unconscious", name _unit];
	name _unit setMarkerTypeLocal "waypoint";
	
	while {(isPlayer _unit) && (_unit getVariable "unconscious")} do {
		_marker setMarkerPosLocal (visiblePosition _unit);
		if(!(alive _unit) || !(_unit getVariable "unconscious")) then {
			deleteMarker name _unit;
		};
		sleep 1;
	};
};

if(!(alive _unit) || !(_unit getVariable "unconscious")) then {
			deleteMarker name _unit;
		};
/*
	File: fn_buyUniqueLicense.sqf
	Author: Bobbus
	
	Description:
	Called when purchasing a unique license. May need to be revised.
*/
private["_type"];
_type = _this select 3;

switch (true) do {
	case (license_civ_rebel): {
		["license_rebel",_type] call life_fnc_confirm;
	};
	case (license_civ_bh): {
		["license_bh",_type] call life_fnc_confirm;
	};
	case (license_civ_c3): {
		["license_c3",_type] call life_fnc_confirm;
	};
};
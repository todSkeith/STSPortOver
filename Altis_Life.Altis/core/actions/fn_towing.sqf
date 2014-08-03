/*
	File: fn_towing.sqf
	Author: Bad^^Eye
	
	Description:
	Towing script for tow vehicles
*/

//Error checking
if (vehicle player == player) exitWith {hint "You must be in a vehicle to tow.";};
// Setup Vars
private ["_vehicle","_vehList","_towVehKind","_towVehicle","_nearObjects"];
_vehicle = vehicle player;
// Get the vehicle we want to tow
_nearObjects = nearestObjects [_vehicle, ["Car"], 8];
if (count _nearObjects == 0) exitWith{hint "There are no vehicle within range to tow.";};
_towVehicle = _nearObjects select 0;
if ((_vehicle distance _towVehicle) > 5) exitWith{hint "The vehicle is too far away to tow, it must be more than 5 meters of the vehicle.";};
_towVehKind = typeOf _towVehicle;
// Setup the list of vehicles the player's vehicle can tow
_vehList = [];
switch (_vehicle) do {
	case isKindOf "B_Truck_01_mover_F": {
		_vehList = [
			"B_QuadBike_01_F"
			"C_Hatchback_01_F"
			"C_Offroad_01_F"
			"B_G_Offroad_01_F"
			"C_SUV_01_F"
			"C_Van_01_transport_F"
			"C_Hatchback_01_sport_F"
			"C_Van_01_fuel_F"
			"C_Van_01_box_F"
			"I_Truck_02_transport_F"
			"I_Truck_02_covered_F"
			"B_Truck_01_transport_F"
			"B_Truck_01_box_F"
			"O_MRAP_02_F"
			"B_MRAP_01_hmg_F"
			"B_MRAP_01_F"
		];
	};
};
if (count _vehList == 0) exitWith{hint "Your vehicle can't tow vehicles.";};
if (!(_towVehKind in _vehList)) exitWith{hint "Your vehicle cannot tow this kind of vehicle.";};
_vehicle attachObject [_towVehicle[0,0,-1]];
/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle weight.
*/
private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{
	case "C_Offroad_01_F": {65};
	case "B_G_Offroad_01_F": {65};
	case "B_Quadbike_01_F": {25};
	case "I_Truck_02_covered_F": {250};
	case "I_Truck_02_transport_F": {200};
	case "C_Hatchback_01_F": {40};
	case "C_Hatchback_01_sport_F": {45};
	case "C_SUV_01_F": {50};
	case "C_Van_01_transport_F": {100};
	case "C_Van_01_Fuel_F": {150};
	case "I_G_Van_01_transport_F": {100};
	case "C_Van_01_box_F": {150};
	case "C_Boat_Civil_01_F": {100};
	case "C_Boat_Civil_01_police_F": {100};
	case "C_Boat_Civil_01_rescue_F": {100};
	case "B_Truck_01_box_F": {450};
	case "B_Truck_01_transport_F": {325};
	case "B_MRAP_01_F": {65};
	case "O_MRAP_02_F": {60};
	case "I_MRAP_03_F": {58};
	case "B_Heli_Light_01_F": {65}; //LittleBird
	case "O_Heli_Light_02_unarmed_F": {100}; //ORCA
	case "I_Heli_Transport_02_F": {175}; //Mohawk
	case "C_Rubberboat": {60};
	case "B_G_Boat_Transport_01_F": {60};
	case "B_Boat_Transport_01_F": {60};
	case "O_Truck_03_transport_F": {450};
	case "O_Truck_03_covered_F": {450};
    case "Land_Box_AmmoOld_F": {700};
    case "B_supplyCrate_F": {1000};
	case "Land_CargoBox_V1_F": {5000};
	case "Box_IND_Grenades_F": {350};
	case "B_supplyCrate_F": {700};
	default {-1};
};
/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {500}; //Drivers License cost
	case "boat": {1000}; //Boating license cost
	case "pilot": {25000}; //Pilot/air license cost
	case "gun": {10000}; //Firearm/gun license cost
	case "dive": {2000}; //Diving license cost
	case "oil": {10000}; //Oil processing license cost
	case "cair": {15000}; //Cop Pilot License cost
	case "cg": {15000}; //Coast guard license cost
	case "heroin": {11500}; //Heroin processing license cost
	case "marijuana": {6000}; //Marijuana processing license cost
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {1000}; //Gang license cost
	case "rebel": {75000}; //Rebel license cost
	case "truck": {20000}; //Truck license cost
	case "diamond": {10000};
	case "salt": {7500};
	case "cocaine": {17500};
	case "sand": {7000};
	case "iron": {20000};
	case "copper": {6500};
	case "cement": {11000};
	case "gold": {18500};
	case "moonshine": {9500};
	case "crabbing" : {5000};
	case "steel" : {12500};
	case "bh": {30000};
	case "logging": {12500};
	case "medicair" : {25000};
	case "home": {100000};
	case "c3": {50000};
	case "swat": {35000}; //Swat License cost
	case "mair": {15000};
};
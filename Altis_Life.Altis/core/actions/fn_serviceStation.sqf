/*
	File: fn_serviceStation.sqf
	Author: Bryan "Tonic" Boardwine + Bad^^Eye
	
	Description:
	Main functionality for the service stations.
*/

private["_service","_veh"];
_veh = nearestObjects[(getPos service_1),["Car","Air"],20];

if(life_shortbread < 1000) then
{
	if(life_coconut < 1000) exitWith {_service = 0;};
	_service = 2;
};
	else
{
	_service = 1;
}

switch (_service) do
{
	case 0: {hint "You do not have $1000 in cash or in your bank account."};
	case 1: {life_shortbread = life_shortbread - 1000; hint "You have repaired your vehicle for $1000";};
	case 2: {life_coconut = life_coconut - 1000; hint "You have repaired your vehicle for $1000";};
};
if(count (_service) > 1) then
{
	_vehicle = _veh
	_name = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
	titleText[format["Servicing %1 don't move...",_name],"PLAIN"];
	titleFadeOut 12;
	sleep 10;
	if((vehicle player) distance _vehicle > 10) exitWith {titleText["You failed to refuel/repair that vehicle because you are farther then 10m from it","PLAIN"];};
	titleText[format["You have refueled/repaired %1",_name],"PLAIN"];
	if(!local _vehicle) then
	{
		[{_vehicle setFuel 1;},"BIS_fnc_spawn",_vehicle,false] spawn life_fnc_MP;
	}
		else
	{
		_vehicle setFuel 1;
	};
	_vehicle setDamage 0;
};
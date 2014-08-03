/*
	Title: fn_kart2.sqf
	
	Author: Johnathen Chilcher "Skeith"
	
	Desciption: initiates the  Go Karts!
*/
if(life_action_inUse) exitWith {hint "You can only have one kart at a time";};
_kart = "C_Kart_01_Vrana_F" createVehicle getPos KartGuy2;
_spawned = true;
life_action_inUse = true;

while {_spawned} do
{
	//waitUntil{((_kart distance (getMarkerPos "kart_2")) > 75)};
	sleep 15;
	if((_kart distance (getMarkerPos "kart_2")) > 75 || !alive _kart) then
	{
		hint "Please stay within the track";
		_kart setVelocity [0, 0, 0];
		deleteVehicle _kart;
		_spawned = false;
		life_action_inUse = false;
	};
};																
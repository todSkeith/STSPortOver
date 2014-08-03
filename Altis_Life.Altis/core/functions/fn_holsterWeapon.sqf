/*
	Created by: BWG Joe
	Adapted by: STS Dev Team
	Function: Holster Weapon
	fn_holster.sqf
*/

if (vehicle player != player) exitWith {};
if (player getVariable "restrained") exitWith {};

if (!life_holstered) then {

	if (currentWeapon player != handgunWeapon player) exitWith
		{
			hint "You can only holster pistols.";
		};


	//if (currentWeapon player == "") exitWith {};

	life_holstered_weapon = currentWeapon player;
	life_holstered_magazine = currentMagazine player;
	life_holstered_ammo = player ammo life_holstered_weapon;
	life_holstered_items = [];

	switch (currentWeapon player) do {
		case (primaryWeapon player): {
			hint "You can only holster pistols";
			sleep 1;
		};
		case (handgunWeapon player): {
			life_holstered_primary = false;
			life_holstered_items = handgunItems player;
			player playMove "AmovPercMstpSrasWpstDnon_AmovPercMstpSnonWnonDnon";
			sleep 1;
		};
	};

	player removeWeapon life_holstered_weapon;
	life_holstered = !life_holstered;
} else {
	if (isNil {life_holstered_weapon}) exitWith {};

	titleText ["Drawing Pistol", "PLAIN"];
	sleep 2;

	player addMagazine life_holstered_magazine;
	player addWeapon life_holstered_weapon;

	if (life_holstered_primary) then {} else {
		{
			player addHandgunItem _x;
		} forEach life_holstered_items;
	};

	player setAmmo [life_holstered_weapon, life_holstered_ammo];
	player selectWeapon life_holstered_weapon;

	life_holstered_weapon = nil;
	life_holstered = !life_holstered;
};
/*
	CDawg
*/
private["_house","_upp","_ui","_progress","_pgText","_cP","_displayName","_weaponsAdded"];
_house = nearestObject [position player, "House"];
_numDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
if(isNull _house) exitwith {};

_hid = [_house] call life_fnc_getBuildID;
[[_hid, playerSide],"BRUUUDIS_fnc_queryWeaponStorage",false,false] spawn life_fnc_MP;


if(_house isKindOf "House_F") then
{
	life_action_inUse = true;
	_owner = _house getVariable["life_homeOwnerName", []];
	[[0,format["%1, your house is being raided by the police!", (_owner select 0)]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_upp = format["Unlocking %1",_displayName];
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;
	
	while{true} do
	{
		if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
			[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		};
		sleep 0.27;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
	};
	
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	_house setVariable ["life_locked", 0];
	life_action_inUse = false;

	_house = nearestObject [player, "House_F"];
	_cargo = ((houseWeaponInformation select 0) select 0);
	_containers = ((houseWeaponInformation select 0) select 1);
	_weaponsAdded = false;

	if(count _containers > 0) then {

				_boxPosition = ((_containers select 0) select 3);
				_boxPosition = [(_boxPosition select 0), (_boxPosition select 1), (_boxPosition select 2), (_boxPosition select 3)];
				_boxPositionXYZ = [(_boxPosition select 0), (_boxPosition select 1), (_boxPosition select 2)];
				_boxDirection = ((_containers select 0) select 4);

				_box = ((_containers select 0) select 2) createVehicle _boxPositionXYZ;
				_box setVariable["storage", ((_containers select 0) select 3), true];
				_box setVariable["Trunk", [[],0], true];
				_box setPosATL [_boxPosition select 0, (_boxPosition select 1), (_boxPosition select 3)-0.9];	
				_box setDir _boxDirection;
				_box enableCollisionWith _house;
				
				clearWeaponCargoGlobal _box; 
				clearMagazineCargoGlobal _box;
				clearItemCargoGlobal _box;
				clearBackpackCargoGlobal _box;
				
				if(typeOf _box == "B_supplyCrate_F" && !(_weaponsAdded)) then {
					
					//diag_log format ["%1", _cargo];
					
					if(count (_cargo select 0) > 0) then {
						for[{_j = 0},{_j < count ((_cargo select 0) select 0)},{_j = _j + 1}] do {
							_box addWeaponCargoGlobal [((_cargo select 0) select 0) select _j, ((_cargo select 0) select 1) select _j];
						};
					};
					if(count (_cargo select 1) > 0) then {
						for[{_j = 0},{_j < count ((_cargo select 1) select 0)},{_j = _j + 1}] do {
							_box addMagazineCargoGlobal [((_cargo select 1) select 0) select _j, ((_cargo select 1) select 1) select _j];
						};
					};
					if(count (_cargo select 2) > 0) then {
						for[{_j = 0},{_j < count ((_cargo select 2) select 0)},{_j = _j + 1}] do {
							_box addItemCargoGlobal [((_cargo select 2) select 0) select _j, ((_cargo select 2) select 1) select _j];
						};
					};
					if(count (_cargo select 3) > 0) then {
						for[{_j = 0},{_j < count ((_cargo select 3) select 0)},{_j = _j + 1}] do {
							_box addBackpackCargoGlobal [((_cargo select 3) select 0) select _j, ((_cargo select 3) select 1) select _j];
						};
					};				
					
					_weaponsAdded = true;
				};

				if(typeOf _box == "Land_Box_AmmoOld_F" && !(_weaponsAdded)) then {
					
					//diag_log format ["%1", _cargo];
					
					if(count (_cargo select 0) > 0) then {
						for[{_j = 0},{_j < count ((_cargo select 0) select 0)},{_j = _j + 1}] do {
							_box addWeaponCargoGlobal [((_cargo select 0) select 0) select _j, ((_cargo select 0) select 1) select _j];
						};
					};
					if(count (_cargo select 1) > 0) then {
						for[{_j = 0},{_j < count ((_cargo select 1) select 0)},{_j = _j + 1}] do {
							_box addMagazineCargoGlobal [((_cargo select 1) select 0) select _j, ((_cargo select 1) select 1) select _j];
						};
					};
					if(count (_cargo select 2) > 0) then {
						for[{_j = 0},{_j < count ((_cargo select 2) select 0)},{_j = _j + 1}] do {
							_box addItemCargoGlobal [((_cargo select 2) select 0) select _j, ((_cargo select 2) select 1) select _j];
						};
					};
					if(count (_cargo select 3) > 0) then {
						for[{_j = 0},{_j < count ((_cargo select 3) select 0)},{_j = _j + 1}] do {
							_box addBackpackCargoGlobal [((_cargo select 3) select 0) select _j, ((_cargo select 3) select 1) select _j];
						};
					};	
				};	

			}forEach _containers;

	player addEventHandler ["Take",{_this spawn life_fnc_onTake;}];
	player addEventHandler ["Put",{_this spawn life_fnc_onPut;}];

	for "_i" from 1 to _numDoors do
	{
		_house setVariable[format["bis_disabled_Door_%1", _i], 0, true];
	};

	titleText["You have managed to get the door open!","PLAIN"];


	sleep 300;

	_boxes = nearestObjects [_house, ["Land_Box_AmmoOld_F","B_supplyCrate_F"], 5]; 
	_house setVariable ["life_locked", 1, true];
		
	{
		deleteVehicle (_containers select 2);
	}forEach _boxes;

	_numDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");	
		
	for "_i" from 1 to _numDoors do
	{
		_house animate [format["door_%1_rot", _i], 0];
		_house setVariable[format["bis_disabled_Door_%1", _i], 1, true];
	};

};
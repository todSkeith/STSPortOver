/*
	File: fn_placeStorage.sqf
	Author: Mario2002
	
	Description:
	place a storage container in a house

	Modified and Edited by: CDawg
*/

private["_placingBox", "_boxposition", "_item", "_house", "_houseId", "_owners", "_uid", "_maxCount", "_count", "_handle", "_box", "_containers", "_containerId", "_pos", "_storageData"];

_item = [_this,0,"",[""]] call BIS_fnc_param;
_house = nearestObject [player, "House"]; 
_owners = _house getVariable["life_homeOwners", []];
_uid = getPlayerUID player;

if (player distance _house > 20) exitWith { hint "You must be inside a house to place storage."; };
if (_item == "storage2" && count (nearestObjects [position _house, ["B_supplyCrate_F"], 5]) > 0) exitWith { hint "You can only place one storage box."; };
if (_item == "storage1" && count (nearestObjects [position _house, ["Land_Box_AmmoOld_F"], 5]) > 0) exitWith { hint "You can just place one small storage."; };
if (!(_uid in _owners)) exitWith { hint "You do not own this house and cannot place storage within it."; };

_maxCount = [typeOf _house] call life_fnc_houseContainers;
if (_maxCount == 0) exitWith { hint "This house does not support storage containers."; };
//if (life_donator < 1) exitWith { hint "You must be donator rank 1 (€10) to place storage in a home."; };
//if (life_donator > 2) then { _maxCount = _maxCount + 1; }; <-- Add this back when we have preset locations per home class

_containers = _house getVariable ["containers", []];
_count = count _containers;
if (_count >= _maxCount) exitWith { hint "You cannot place any more containers at this time."; };
	_placingBox = true;


switch (_item) do {
	case "storage1" : {
		_box= "Land_Box_AmmoOld_F" createVehicle [0,0,0];
		_box attachTo[player,[0,2,0]];
		_box setDir 90;

		clearWeaponCargoGlobal _box; 
		clearMagazineCargoGlobal _box;
		clearItemCargoGlobal _box;
		clearBackpackCargoGlobal _box;

		_box allowdamage false;

		life_storage1_box = _box;
		life_action_storageBoxDeploy = player addAction["Place Storage Box",{if(!isNull life_storage1_box) then {detach life_storage1_box; life_storage1_box = ObjNull;}; player removeAction life_action_storageBoxDeploy; life_action_storageBoxDeploy = nil;},"",999,false,false,"",'!isNull life_storage1_box'];
		hint "Placing storage container...";
		[false,_item,1] call life_fnc_handleInv;
		waitUntil {isNull life_storage1_box;};
		hint "";
		};

	case "storage2" : {
		_box= "B_supplyCrate_F" createVehicle [0,0,0];
		_box attachTo[player,[0,2,13]];
		_box setDir 90;

		clearWeaponCargoGlobal _box; 
		clearMagazineCargoGlobal _box;
		clearItemCargoGlobal _box;
		clearBackpackCargoGlobal _box;

		_box allowdamage false;

		life_storage2_box = _box;
		life_action_storageBoxDeploy = player addAction["Place Storage Box",{if(!isNull life_storage2_box) then {detach life_storage2_box; life_storage2_box = ObjNull;}; player removeAction life_action_storageBoxDeploy; life_action_storageBoxDeploy = nil;},"",999,false,false,"",'!isNull life_storage2_box'];
		hint "Placing storage container...";
		[false,_item,1] call life_fnc_handleInv;
		waitUntil {isNull life_storage2_box;};
		hint "";
		};
};
v;

while {_placingBox} do {
	if((player distance _house) > 5) then {
		deleteVehicle _box;

		hint "You can only place Storage inside your house!";
		_placingBox = false;		
		[true,_item,1] call life_fnc_handleInv;

	} else {

	if((player distance _house) < 5) then {
		hint "Storage placed!";
		_placingBox = false;

		_boxDirection = getDir _box;
		_boxPosition = [(getPos _box select 0),(getPos _box select 1),(getPos _box select 2),(getPosATL _box select 2)];

		_houseId = [_house] call life_fnc_getBuildID;
		_containerId = format ["%1_%2", _houseId, _count];
		_storageData = [_containerId, _item, typeOf _box, _boxPosition, _boxDirection];
		_containers set [count _containers, _storageData];
		_house setVariable ["containers", _containers, true];
		_box setVariable["owner", getPlayerUID player, true];

		[false,_item,1] call life_fnc_handleInv;
		[[_house, _containers, playerSide, [[],0]],"BRUUUDIS_fnc_updateHouseStorage",false,false] spawn BIS_fnc_MP;
		_handle = [] spawn life_fnc_sessionUpdate;

	};
};
};



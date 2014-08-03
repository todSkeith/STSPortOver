/*
	File: fn_copInteractionMenu.sqf
	Author: CDawg

	Description:
	Replaces the mass addactions for various house actions.
*/
#define Txt1 37450
#define Btn1 37451
#define Btn2 37452
#define Btn3 37453
/*
#define Btn4 37454
#define Btn5 37455
#define Btn6 37456
#define Btn7 37457
#define Btn8 37458
*/
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_house"];
_house = cursorTarget;

if(!dialog) then {
	createDialog "hInteraction_Menu";
};
disableSerialization;

if(isNull _house) exitWith {closeDialog 0;}; //Bad target

//Can't interact while restrained or dead
if (player getVariable["zipTie",false] || player getVariable["restrained",false] || player getVariable["surrender",false] || player getVariable ["unconscious",false]) exitWith {closeDialog 0;};
//Can't interact with medics
//if (side _curTarget == independent) exitWith {closeDialog 0;};
//Double check player side
if (playerSide == independent) exitWith {closeDialog 0;};


_display = findDisplay 37400;
_tName = _display displayCtrl Txt1;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;

/*
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
*/
_house = nearestObject [player, "House"];
life_hInact_curTarget = _house;
_tName ctrlSetText "House Interaction Menu";
private["_tRest","_tZip","_tUnc","_tEsc"];

if (playerSide == civilian) then {
//Button 1: House Purchase/Sell Menu
	_Btn1 ctrlSetText localize "STR_hInAct_Property";
	_Btn1 buttonSetAction "[life_hInact_curTarget] call life_fnc_houseMenu;";
} else {
	_Btn1 ctrlSetText localize "STR_hInAct_OwnerSearch";
	_Btn1 buttonSetAction "[life_hInact_curTarget] call life_fnc_houseOwnerSearch;";
};

if (playerside == civilian) then {
//Button 2: Lock / Unlock doors
	if ((getPlayerUID player) in (cursorTarget getVariable["life_homeOwners", []])) then { _Btn2 ctrlEnable true; } else { _Btn2 ctrlEnable false; };
	if ((_house getVariable["life_locked",0]) == 0) then {
		_Btn2 ctrlSetText localize "STR_hInAct_Lock";
		_Btn2 buttonSetAction "[life_hInact_curTarget] call life_fnc_lockHouse; closeDialog 0;";
	} else {
		_btn2 ctrlSetText localize "STR_hInAct_Unlock";
		_btn2 buttonSetAction "[life_hInact_curTarget] call life_fnc_lockHouse; closeDialog 0;";
	};
} else {
		_Btn2 ctrlSetText localize "STR_hInAct_RaidHouse";
		_Btn2 buttonSetAction "[life_hInact_curTarget] spawn life_fnc_raidHouse;";
};

if (playerSide == civilian) then {
	//Button 3: Open Storage
	//if (((player distance cursorTarget) < 6)) then { _Btn3 ctrlEnable true; } else { _Btn3 ctrlEnable false; };
	//if(!isNull cursorTarget && (player distance cursorTarget) < 6 && cursorTarget isKindOf "House" && (count (cursorTarget getVariable["containers", []]) > 0) && (((getPlayerUID player) in (cursorTarget getVariable["life_homeOwners", []])) || (cursorTarget getVariable["life_locked", 1]) == 0))  then {
	//	_Btn3 ctrlSetText localize "STR_hInAct_OpenStorage";
	//	_Btn3 buttonSetAction "[life_hInact_curTarget] call life_fnc_openStorage; closeDialog 0;";
	//};

} else {
	
	_Btn3 ctrlSetText localize "STR_hInAct_SearchInventory";
	_Btn3 buttonSetAction "[life_hInact_curTarget] call life_fnc_houseInvSearch;";
};

	//Button 4: Toggle Storage Locks
	/*if(_house getVariable["storage_locked",0]) then {

		_Btn4 ctrlSetText localize "STR_hInAct_LockStorage";
		_Btn4 buttonSetAction "[life_hInact_curTarget] call life_fnc_lockStorage; closeDialog 0;";
	} else {
		_Btn4 ctrlSetText localize "STR_hInAct_UnlockStorage";
		_Btn4 buttonSetAction "[life_hInact_curTarget] call life_fnc_lockStorage; closeDialog 0;";
	};
	*/
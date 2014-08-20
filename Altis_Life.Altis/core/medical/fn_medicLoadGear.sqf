/*
	File: fn_medicLoadGear.sqf
	Author: Skeith
	
	Description:
	Used for loading medic gear loadout.
*/
private["_allowedItems","_loadout","_primary","_launcher","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_handle"];

_uniform = "U_I_CombatUniform";
_backpack = "B_Kitbag_cbr";
_items = ["ItemMap","ItemCompass","ItemWatch","ItemGPS","NVGoggles","H_Cap_red"];
_bitems = ["Toolkit","Medikit"];

//Strip the unit down
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
removeAllAssignedItems player;
{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);

//Add the gear
if(_uniform != "") then {_handle = [_uniform,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};
if(_backpack != "") then {_handle = [_backpack,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};};

{_handle = [_x,true,false,false,false] spawn life_fnc_handleItem; waitUntil {scriptDone _handle};} foreach _items;
{[_x,true,true,false,false] call life_fnc_handleItem;} foreach (_bitems); 
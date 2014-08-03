/*
	File: fn_processAction.sqf
	Author: Bryan "Tonic" Boardwine & Asylum Dev Team

	Description:
	Master handling for processing an item.
*/
private["_vendor","_type","_itemInfo","_oldItem","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_ui","_progress","_pgText","_cP","_vals","_delayInt"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(isNull _vendor OR _type == "" OR (player distance _vendor > 6)) exitWith {};
if ((vehicle player) != player) exitWith { hint "This action cannot be performed from within a vehicle." };
if (side player == west) exitWith {hint "You cannot preform this action as an officer."};

//unprocessed item,processed item, cost if no license,Text to display (I.e Processing  (percent) ..."
_itemInfo = switch (_type) do
{
	case "oil": {[["oilu"],"oilp",135,"Processing Oil"];};
	case "diamond": {[["diamond"],"diamondc",100,"Processing Diamonds"]};
	case "heroin": {[["heroinu"],"heroinp",115,"Processing Heroin"]};
	case "copper": {[["copperore"],"copper_r",65,"Processing Copper"]};
	case "iron": {[["ironore"],"iron_r",200,"Processing Iron"]};
	case "gold": {[["goldore"],"gold_r",300,"Smelting Gold"]};
	case "sand": {[["sand"],"glass",70,"Processing Sand"]};
	case "salt": {[["salt"],"salt_r",75,"Processing Salt"]};
	case "cocaine": {[["cocaine"],"cocainep",175,"Processing Cocaine"]};
	case "marijuana": {[["cannabis"],"marijuana",60,"Processing Marijuana"]};
	case "heroin": {[["heroinu"],"heroinp",115,"Processing Heroin"]};
	case "cement": {[["rock"],"cement",110,"Mixing Cement"]};
	case "log": {[["log"],"lumber",110,"Sawing Wood"]};
	case "steel" : {[["coalore","ironore"],"steel",250,"Forging Steel"]};
	case "moonshine" : {[["corn"],"moonshine", 100, "Distilling Liquor"]};
	default {[]};
};

//Error checking
if(count _itemInfo == 0) exitWith {hint "You don't have the items necessary"};

//Setup vars.
_oldItem = [];
_vals = [];
life_action_inUse = true;
{_oldItem = _oldItem + [_x];} foreach (_itemInfo select 0);
if(count _oldItem == 0) exitWith {hint "You don't have the items necessary"};
{_vals = _vals + [missionNamespace getVariable ([_x,0] call life_fnc_varHandle)];} foreach _oldItem;
_oldVal = _vals select 0;
{if (_x < _oldVal) then {_oldVal = _x};} foreach _vals;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;
_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
if(_oldVal == 0) exitWith {};
_cost = _cost * _oldVal;

//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

if((!_hasLicense)&&(life_cash < _cost)) exitWith {
	hint format["You need $%1 to process without a license!",[_cost] call life_fnc_numberText];
	5 cutText ["","PLAIN"]; life_is_processing = false;
};

//Removes the old items
{
	if(!([false,_x,_oldVal] call life_fnc_handleInv)) exitWith {
		5 cutText ["","PLAIN"]; life_is_processing = false;
	};
} foreach _oldItem;

_delayInt = _oldVal * 0.03;
while{true} do {
	sleep _delayInt;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(player distance _vendor > 10) exitWith {};
};

if(player distance _vendor > 10) exitWith {hint "You need to stay within 10m to process."; 5 cutText ["","PLAIN"]; life_is_processing = false; life_action_inUse = false;};
if(!(alive player)) exitWith {hint "You need to be alive to process."; 5 cutText ["","PLAIN"]; life_is_processing = false; life_action_inUse = false;};
if((!_hasLicense)&&(life_cash < _cost)) exitWith {hint format["You need $%1 to process without a license!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false; life_action_inUse = false;};

//Adds the new item
if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {
	5 cutText ["","PLAIN"];
	{[true,_x,_oldVal] call life_fnc_handleInv;} foreach _oldItem;
	life_is_processing = false;
	life_action_inUse = false;
};

5 cutText ["","PLAIN"];
if (_hasLicense) then {
	titleText[format["You have processed your goods into %1",_itemName],"PLAIN"];
	life_action_inUse = false;
} else {
	titleText[format["You have processed your goods into %1 for $%2",_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	["cash","take",_cost] call life_fnc_updateCash;
	life_action_inUse = false;
};

life_is_processing = false;
life_action_inUse = false;
//[[36, player, format["Processed %1 into %2", _oldVal, _itemName]],"ASY_fnc_logIt",false,false] spawn BIS_fnc_MP;
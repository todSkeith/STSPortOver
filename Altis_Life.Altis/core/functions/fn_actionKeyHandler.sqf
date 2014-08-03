/*
        File: fn_actionKeyHandler.sqf
        Author: Bryan "Tonic" Boardwine
       
        Description:
        Master action key handler, handles requests for picking up various items and
        interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater","_isVehicle","_miscItems","_money"];
_curTarget = cursorTarget;

_animalTypes = ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F"];

if ((typeOf cursorTarget) in _animalTypes) then
{
	if ((typeOf cursorTarget) == "Turtle_F" && !alive cursorTarget) then
	{
	private["_handle"];
	hint "catching t?";
	_handle = [cursorTarget] spawn life_fnc_catchTurtle;
	waitUntil {scriptDone _handle};
	}
	else
	{
	private["_handle"];
	_handle = [cursorTarget] spawn life_fnc_catchFish;
	waitUntil {scriptDone _handle};
	};
};

_near = nearestObjects[getPos player,["Man","Car","Air","Ship"],5];
if ((isNull _curTarget || _curTarget isKindOf "House") && count _near > 1) then {
        _curTarget = _near select 1;
};

if(life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
_isWater = surfaceIsWater (getPosASL player);
if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(vehicle player != player) exitWith {}; //He's in a vehicle, cancel!
if(player distance _curTarget > ((boundingBox _curTarget select 1) select 0) + 2) exitWith {}; //Too far away

life_action_inUse = true;
 
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
_isHouse = if(_curTarget isKindOf "House") then {TRUE} else {FALSE};

_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];
_animalTypes = ["Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F"];
_money = "Land_Money_F";
 
switch (true) do
{
        //Players
        case (_curTarget isKindOf "Man" && isPlayer _curTarget):
        {
                switch (playerSide) do
                {
                        //Cop
                        case (west):
                        {
                                [_curTarget] call life_fnc_copInteractionMenu;
                        };
                       
                        //Medic
                        case (independent):
                        {
                                [_curTarget] call life_fnc_medicInteractionMenu;
                        };
                       
                        //Other
                        default
                        {
                                [_curTarget] call life_fnc_civInteractionMenu;
                        };
                };
        };
       
        //NPCs
        case (_curTarget isKindOf "Man" && !isPlayer _curTarget):
        {
        //Nothing at the moment
        };
       
        //Vehicles
        case (_isVehicle):
        {
                [_curTarget] call life_fnc_vInteractionMenu;
        };

        case (_isHouse):
        {
                [_curTarget] call life_fnc_houseMenu;
        };
       
        //Animals
        case ((typeOf _curTarget) in _animalTypes):
        {
                switch (true) do
                {
                        //Turtles
                        case ((typeOf _curTarget) == "Turtle_F" && !alive _curTarget):
                        {
                                private["_handle"];
                                _handle = [_curTarget] spawn life_fnc_catchTurtle;
                                waitUntil {scriptDone _handle};
                        };
                       
                        //Other
                        default
                        {
                                private["_handle"];
                                _handle = [_curTarget] spawn life_fnc_catchFish;
                                waitUntil {scriptDone _handle};
                        };
                };
        };
       
        //Misc virtual items
        case ((typeOf _curTarget) in _miscItems):
        {
                private["_handle"];
                _handle = [_curTarget] spawn life_fnc_pickupItem;
                waitUntil {scriptDone _handle};
        };
       
        //Money
        case ((typeOf _curTarget) == _money):
        {
                private["_handle"];
                _handle = [_curTarget] spawn life_fnc_pickupMoney;
                waitUntil {scriptDone _handle};
        };
};
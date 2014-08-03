/*
	File: fn_onDeath.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does whatever it needs to when a player dies.
*/
private["_unit","_killer","_weapons","_handle"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_source = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};

cutText["Waiting to respawn....","BLACK FADED"];
0 cutFadeOut 9999999;

/* Players drop all items *Testing
if(playerSide == civilian) then
{
	removeAllContainers _unit;
};
*/
if(isNull _source) then
{
	[[0,format["%1 was killed by an environmental collision.", name _unit]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
}
else
{
	if(_source == _unit) then
	{
		switch (true) do
		{
			case (life_thirst == 0) : 											{[[0,format["%1 died of dehydration.", name _unit]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;};
			case (life_hunger == 0) : 											{[[0,format["%1 starved to death.", name _unit]],"life_fnc_broadcast",true,false] spawn life_fnc_MP; };
			case (life_bleedout < time && player getVariable "unconscious") :	{[[0,format["%1 bled out.", name _unit]],"life_fnc_broadcast",true,false] spawn life_fnc_MP; };
			case (player getVariable "executed") :								{ /*Will handle this via execute script*/ };
			default 															{[[0,format["%1 ended himself.", name _unit]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;};
		};
	}
	else
	{
		[[0,format["%1 was killed by %2", name _unit, name _source]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};
};
hideBody _unit;
//Make my killer wanted!
if(side _source != west && alive _source) then
{
	if(vehicle _source isKindOf "LandVehicle") then
	{
		if(alive _source) then
		{
			[[getPlayerUID _source,name _source,"480"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		};
	}
		else
	{
		[[getPlayerUID _source,name _source,"187"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	};
};

if(side _source == west && !life_use_atm) then
{
	if(life_cash != 0) then
	{
		[format["$%1 from the Federal Reserve robbery was returned from the robber being killed.",[life_cash] call life_fnc_numberText],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		life_cash = 0;
	};
};

//New addition for idiots.
if(side _source == civilian && _source != _unit && !local _source) then
{
	if(vehicle _source isKindOf "LandVehicle") then {
		[[2],"life_fnc_removeLicenses",_source,false] spawn life_fnc_MP;
	} else {
		[[3],"life_fnc_removeLicenses",_source,false] spawn life_fnc_MP;
	};
};

if(side _source == west && vehicle _source == _source && playerSide == civilian) then
{
	[[player,_source,true],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;
	[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
	//[[getPlayerUID player],"life_fnc_wantedPunish",false,false] spawn life_fnc_MP;
}
	else
{
	if(playerSide == civilian) then
	{
		[[getPlayerUID _unit],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
	};
};

_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

_medicsOn = playersNumber independent;
_lostCash = 0;
if(_medicsOn < 1) then {_lostCash = 0};
if(_medicsOn > 0 && _medicsOn < 5) then {_lostCash = 0.01};
//if(_medicsOn >= 5) then {_lostCash = 0.05};
if(side player == independent) then {_lostCash = 0};
_lostCash = floor(life_atmcash * _lostCash);
if(_lostCash > 50000) then {_lostCash = 50000};

if(_lostCash == 0) then
{
	hintSilent "No medics were available. You were cloned for free.";
}
else
{
	hintSilent format ["You have died and lost $%1 from your bank account for your cloning.", [_lostCash] call life_fnc_numberText];
};

if(side player != independent) then 
{
	life_atmcash = life_atmcash - _lostCash;
	hintSilent format ["You have died and lost $%1 from your bank account for your cloning.", [_lostCash] call life_fnc_numberText];
};
	
life_carryWeight = 0;
life_thirst = 100;
life_hunger = 100;
life_use_atm = true;

life_cash = 0;
life_holstered_weapon = nil;

license_civ_rebel = false;
license_civ_bh = false;
playerPosition = [0,0,0,false];
[] call life_fnc_sessionUpdate;

player setVariable ["restrained", false, true];
player setVariable ["escorting", false, true];
player setVariable ["transporting", false, true];
player setVariable ["unconscious", false, true];
life_holstered = false;

// Sort out the body
deleteVehicle _unit;

{ _unit removeAction _x; } foreach life_actions;
life_actions = [];

[1,true] call life_fnc_sessionHandle;//updates gear after your death

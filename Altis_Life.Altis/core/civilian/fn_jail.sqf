//////////////////////////////////////////////////////////////////
// Created by: Tonic and Adapted by DirtDiver for STS
// Function Name: life_fn_jail.sqf
// Description: You can holler, you can even hammer, but if you
//				break the rules he'll put you in the slammer.
//////////////////////////////////////////////////////////////////

private["_ret","_bad","_time","_bail","_esc","_countDown","_unit"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_jailTime = [_this,2,20,[0]] call BIS_fnc_param;
_unit = player;
if(_bad) then { _time = time + 1100; } else { _time = time + (15 * 60); };

if(count _ret > 0) then { life_bail_amount = floor ((_ret select 3) * 1.05); } else { life_bail_amount = 1500; };
_esc = false;
_bail = false;



hint format["%1", _unit];
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested
[[player,"AmovPercMstpSnonWnonDnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

titleText["You have been arrested, wait your time out. If you attempt to respawn or reconnect your time will increase!","PLAIN"];
hint "For being arrested you have lost the following licenses if you own them\n\nFirearms License\nRebel License";
player setPos (getMarkerPos "jail_marker");

//Double Check that player has been sent to jail!
if(player distance (getMarkerPos "jail_marker") > 40) then
{
	player setPos (getMarkerPos "jail_marker");
};

license_civ_gun = false;
//license_civ_rebel = false;
if(life_inv_heroinu > 0) then {[false,"heroinu",life_inv_heroinu] call life_fnc_handleInv;};
if(life_inv_heroinp > 0) then {[false,"heroinp",life_inv_heroinp] call life_fnc_handleInv;};
if(life_inv_coke > 0) then {[false,"cocaine",life_inv_coke] call life_fnc_handleInv;};
if(life_inv_cokep > 0) then {[false,"cocainep",life_inv_cokep] call life_fnc_handleInv;};
if(life_inv_turtle > 0) then {[false,"turtle",life_inv_turtle] call life_fnc_handleInv;};
if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call life_fnc_handleInv;};
if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call life_fnc_handleInv;};
if(life_inv_zip > 0) then {[false,"zip",life_inv_zip] call life_fnc_handleInv;};
life_is_arrested = true;

removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);
_jailTime = _this select 2;
life_jail_val = _jailTime;
_time = time + (_jailTime * 60);
_esc = false;
_bail = false;

[_jailTime] spawn
{
	life_canpay_bail = false;
	sleep ((_this select 0) * 30);
	life_canpay_bail = nil;
};

while {true} do
{
	if((round(_time - time)) > 0) then
	{
		_countDown = if(round (_time - time) > 60) then {format["%1 minute(s)",round(round(_time - time) / 60)]} else {format["%1 second(s)",round(_time - time)]};
		hintSilent format["Time Remaining:\n %1\n\nCan pay bail: %3\nBail Price: $%2",_countDown,[life_bail_amount] call life_fnc_numberText,if(isNil "life_canpay_bail") then {"Yes"} else {"No"}];
	};
	
	if(player distance (getMarkerPos "jail_marker") > 60) exitWith
	{
		_esc = true;
	};
	
	if(life_bail_paid) exitWith
	{
		_bail = true;
	};
	
	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith
	{
	
	};
	sleep 1;
};


switch (true) do
{
	case (_bail) :
	{
		life_is_arrested = false;
		life_bail_paid = false;
		hint "You have paid your bail and are now free.";
		serv_wanted_remove = [player];
		publicVariableServer "serv_wanted_remove";
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		player setPos (getMarkerPos "jail_release");
		[1,false] call life_fnc_sessionHandle;
	};
	
	case (_esc) :
	{
		life_is_arrested = false;
		hint "You have escaped from jail, you still retain your previous crimes and now have a count of escaping jail.";
		[[0,format["%1 has escaped from jail!",name player]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		[[getPlayerUID player,name player,"901"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		serv_killed = [player,"901"];
		publicVariableServer "serv_killed";
	};
	
	case (alive player && !_esc && !_bail) :
	{
		life_is_arrested = false;
		hint "You have served your time in jail and have been released.";
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		serv_wanted_remove = [player];
		publicVariableServer "serv_wanted_remove";
		player setPos (getMarkerPos "jail_release");
		[1,false] call life_fnc_sessionHandle;
	};
};
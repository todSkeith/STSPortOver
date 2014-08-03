/*
	File: fn_robStation.sqf
	Author: MrBoolean

	Description:
	Action for robbing gas stations
*/
private["_clerk","_player","_timer","_cash","_marker","_markerName","_inProgress","_success"];

_clerk = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_player = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
//_timer = (60 * 5);
_timer = (5);
_cash = (1000 * ceil(random 30));

if(!(_clerk getVariable ["canBeRobbed", true])) exitWith {cutText ["Sorry... I was robbed recently! Try again later!","PLAIN"];};
if(_player distance _clerk > 15) exitWith {cutText ["You must be within 15 meters of the clerk!","PLAIN"];};
if(vehicle player != player) exitWith {cutText ["You're not very scary sitting in your car...","PLAIN"];};
if(currentWeapon _player == "") exitWith {cutText ["Punk... Your fists don't scare me!","PLAIN"];};


_inProgress = true;
_success = false;
[[getPlayerUID _player,name _player,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
[[0,"A gas station is being robbed!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
cutText ["You've started robbing the gas station, stay within 15 meters to avoid failing.","PLAIN"];
_clerk switchMove "AmovPercMstpSsurWnonDnon";

_markerName = (name player + "_robbery");
_marker = createMarker [_markerName, getPos _clerk];
_markerName setMarkerColor "ColorRed";
_markerName setMarkerText "Robbery In Progress!";
_markerName setMarkerType "mil_warning";

_array = _clerk getVariable["Robbers",[]];
_ind = [getPlayerUID player,_array] call fnc_index;

if(_ind != -1) then
{
	_val = (_array select _ind) select 2;
	_val = _val + 2500;
	_array set[_ind,[getPlayerUID _player,name _player,_val]];
	_clerk setVariable["Robbers",_array,true];
} else {
	_array set[count _array,[getPlayerUID _player,name _player,2500]];
	_clerk setVariable["Robbers",_array,true];
};

while {_inProgress} do {

	if(_timer < 1) then {
		_success = true;
		_inProgress = false;
	};

	if(!alive _player) then {
		_inProgress = false;
		_success = false;
	};

	if(_player distance _clerk > 15) then {
		_inProgress = false;
		_success = false;

		cutText ["You've gone too far from the clerk! Robbery Failed!","PLAIN"];
	};

	if(life_istazed) then {
		_inProgress = false;
		_success = false;
	};

	if(_player getVariable "restrained") then {
		_inProgress = false;
		_success = false;
	};

	if(vehicle player != player) then {
		_inProgress = false;
		_success = false;
	};

	_timer = (_timer-1);
	sleep 1;
};

if(_timer < 1 and {_success}) then {

	life_cash = life_cash + _cash;
	[[0,"A gas station was successfuly robbed!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	deleteMarker _markerName;

} else {
	if(!_success) then {

		[[0,"A gas station robbery has failed!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		deleteMarker _markerName;

	};
};

[_clerk] spawn {
	_clerk = _this select 0;
	_clerk switchMove "";
	_clerk setVariable ["canBeRobbed", false, true];
	sleep (5);
	_clerk setVariable ["canBeRobbed", true, true];
};
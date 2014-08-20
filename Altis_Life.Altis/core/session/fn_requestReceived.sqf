#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

//Parse basic player information.
life_cash = parseNumber (_this select 2);
life_atmcash = parseNumber (_this select 3);
__CONST__(life_adminlevel,parseNumber(_this select 4));
__CONST__(life_donator,parseNumber(_this select 5));

switch(__GETC__(life_donator)) do
{
	case 0: {
		__CONST__(life_donator_discount,1)
	};
	case 1: {
		life_paycheck = life_paycheck + 750; 
		__CONST__(life_donator_discount,0.9);
	};
	case 2: {
		life_paycheck = life_paycheck + 1500;
		__CONST__(life_donator_discount,0.8);
	};
	case 3: {
		life_paycheck = life_paycheck + 2000;
		__CONST__(life_donator_discount,0.7);
	};
	case 4: {
		life_paycheck = life_paycheck + 2500;
		__CONST__(life_donator_discount,0.6);
	};
	case 5: {
		life_paycheck = life_paycheck + 3000;
		__CONST__(life_donator_discount,0.5);
	};
};

//Loop through licenses
if(count (_this select 6) > 0) then {
	{
		missionNamespace setVariable [(_x select 0),(_x select 1)];
	} foreach (_this select 6);
};

//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(life_coplevel,parseNumber(_this select 7));
		cop_gear = _this select 8;
		[] spawn life_fnc_loadGear;
		life_blacklisted = _this select 9;
		__CONST__(life_medicLevel,0);
	};
	
	case civilian: {
		life_is_arrested = _this select 7;
		//life_is_arrested = call compile format["%1", _this select 7];
		civ_gear = _this select 8;
		__CONST__(life_coplevel,0);
		__CONST__(life_medicLevel,0);
		[] spawn life_fnc_civLoadGear;
		life_houses = _this select 9;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles set[count life_vehicles,_house];
		} foreach life_houses;
		
		life_gangData = _This select 10;
		if(count life_gangData != 0) then {
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;
	};
	
	case independent: {
		__CONST__(life_medicLevel,parseNumber(_this select 7));
		__CONST__(life_copLevel,0);
	};
};

switch(__GETC__(life_coplevel)) do
{
	case 1: {life_paycheck = life_paycheck + 100;};//Recruit
	case 2: {life_paycheck = life_paycheck + 500;};//PO
	case 3: {life_paycheck = life_paycheck + 750;};//SPO
	case 4: {life_paycheck = life_paycheck + 1000;};//CPL
	case 5: {life_paycheck = life_paycheck + 1250;};//Sgt
	case 6: {life_paycheck = life_paycheck + 1500;};//Lt.
	case 7: {life_paycheck = life_paycheck + 1750;};//Capt.
	case 8: {life_paycheck = life_paycheck + 2000;};//SuperI
	case 9: {life_paycheck = life_paycheck + 2500;};//Chief
	case 10: {life_paycheck = life_paycheck + 10000;};//Admin
};

life_session_completed = true;
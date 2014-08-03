/*
	File: fn_questionGasStation.sqf
	Author: Morph
	
	Description:
	Questions the gas station employee and adds robbers to wanted list.
*/
private["_station","_robbers","_names"];

_station = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robbers = _station getVariable["Robbers",[]];


if(count _robbers == 0) exitWith {hint "No one has robbed this gas station recently."}; //No data.
life_xction_inUse = true;
_names = "";

hint "loop";

{
		[[_x select 0,_x select 1,"211A",_val],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		_names = _names + format["%1<br/>",_x select 1];
	
		hint "success"
	
} foreach _robbers;



hint parseText format["The following people robbed this gas station.<br/><br/>%1",_names];
_station setVariable["Robbers",[],true];
life_xction_inUse = false;
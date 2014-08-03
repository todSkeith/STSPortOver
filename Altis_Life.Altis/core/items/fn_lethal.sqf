/* Written by Bobbus
	Moved to Item: CDawg */


private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
if(!(_unit isKindOf "Man")) exitWith {};
if(_unit == player) exitWith {};
if(player distance _unit > 4) exitWith {};
if(_unit getVariable ["executed",false]) exitWith {};

player playMove "AinvPknlMstpSnonWnonDnon_medic1"; //idk what animation to really do...
[[player],"life_fnc_executeAction",_unit,false] spawn life_fnc_MP;
sleep 3;
[[0,format["%1 was finished off by %2", name _unit, name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
[[getPlayerUID player,name player,"187"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
titleText ["You are a murderer.","PLAIN"];




/*
	File: fn_robSuccess.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Robbed a store.. give money!
*/
private["_unit","_x","_robber","_lastRobbed","_success"];
_cash = [_this,0,0,[0]] call BIS_fnc_param;
_success = [_this,1,false,[false]] call BIS_fnc_param;

if (_success) then
{
	hint format["You have robbed the store of $%1!",[_cash] call life_fnc_numberText];
	life_cash = life_cash + _cash;
}
else
{
	hint "You failed to rob the store!";
};
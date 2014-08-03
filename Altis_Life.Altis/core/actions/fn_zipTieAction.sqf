/*
	File: fn_zipTie.sqf
	Author: Bad^^Eye
	
	Description:
	Main functionality for civ restrain
*/
private["_attacker","_victim","_chance"];
_attacker = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _attacker) exitWith {};


_chance = random(100);

if (_chance < 101) then 
{	
	player setVariable["zipTie",true,true];
	life_myGrp = group player;
	[player] joinSilent grpNull;
	[[format["%1 has turned to a life of kidnapping!",name _attacker]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	[[getPlayerUID _attacker,name _attacker,"207"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
}
else
{
	player setVariable ["zipTie",false,true];
	[[format["%1 was seen trying to kidnap someone!",name _attacker]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	[[getPlayerUID _attacker,name _attacker,"207A"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
};
	
while {player getVariable "zipTie"} do
{
	player playMove "AmovPercMstpSnonWnonDnon_Ease";
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getVariable "zipTie")};
	if(!alive player) then
	{
		player setVariable ["zipTie",false,true];
		[player] joinSilent life_myGrp;
	};
};
	
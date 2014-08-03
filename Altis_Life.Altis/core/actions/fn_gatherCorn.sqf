//////////////////////////////////////////////////////////////////
// Created by: JackLags for STS
// Function Name: fn_gatherPotatoes.sqf
// Description: Gathers Potatoes?
//////////////////////////////////////////////////////////////////
private["_sum"];
_sum = ["corn",3,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_inUse = true;
	titleText["Picking Corn...","PLAIN"];
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	sleep 5;
	if(([true,"corn",_sum] call life_fnc_handleInv)) then
	{
		titleText[format["You have picked %1 Ears of Corn",_sum],"PLAIN"];
	};
}
	else
{
	hint "Your inventory space is full.";
};

life_action_inUse = false;
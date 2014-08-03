#include <macro.h>
/*
	File: fn_adminDebugCon.sqf
	Author: ColinM9991
	Edited and Modified by CDawg for STS
	Description:
	Opens the Debug Console.
*/
if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0; hint "Ya don't come down here again ya'hear?!";};

createDialog "RscDisplayDebugPublic";
[[0,format["Admin %1 has opened the Debug Console.",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP; //Alert so players can report possible abuse
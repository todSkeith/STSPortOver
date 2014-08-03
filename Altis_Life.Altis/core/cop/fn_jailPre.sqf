//////////////////////////////////////////////////////////////////
// Created by: Tonic and Adapted for STS
// Function Name: life_fn_jail_pre
// Description: Executes custom time for jail.
//////////////////////////////////////////////////////////////////

diag_log "Started the jailPre";
private["_unit","_id"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Checks
if(isNull _unit) exitWith {hint "You cannot send this to jail.";}; //Not valid
if(isNil "_unit") exitwith {hint "You cannot send this to jail.";}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {hint "You cannot send this to jail.";}; //Not a unit
if(!isPlayer _unit) exitWith {hint "You cannot send this to jail.";}; //Not a human
if(!(_unit getVariable "restrained")) exitWith {hint "He is not restrained!";}; //He's not restrained.
if(side _unit != civilian) exitWith {hint "Player is not a Civ!";}; //Not a civ
if(isNull _unit) exitWith {hint "Not valid.";}; //Not valid
diag_log "Got Passed Checks";

//Important
_jailTime = ctrlText 695696;
diag_log "Text Recived from Value Box";

diag_log "Start Value Check";
if(!([_jailTime] call fnc_isnumber)) exitWith {hint "Please Enter a number."};
if((parseNumber _jailTime) > 180) exitWith {hint "You can't jail someone for more than 180 minutes!"};
if((parseNumber _jailTime) < 1) exitWith {hint "You can't jail someone for less than 1 minute!"};
diag_log "End Value Check";

life_jail_unit = _unit;
diag_log "life_jail_unit defined to cursorTarget";
[[_unit,player,false],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;
diag_log "Removing Bounty";


diag_log "Executing player side of jail script (fn_jail)";
[[_unit,false,(parseNumber _jailTime)],"life_fnc_jailSys",false,false] spawn life_fnc_MP;
[[0,format["%1 was arrested by %2 for %3 minutes", name _unit, name player, parseNumber _jailTime]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;


closeDialog 0;
diag_log "Dialog Closed";
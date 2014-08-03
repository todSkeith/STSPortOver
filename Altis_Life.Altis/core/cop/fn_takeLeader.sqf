/*
	File: fn_takeLeader.sqf
	Author: Bobbus
	
	Description:
	Allow high ranking cop to steal leadership of group
*/
if(playerSide != west) exitWith {};
private ["_unit"];
_unit = _this select 0;
_unit setRank "COLONEL";
if (player == leader group _unit) then {
	group player selectLeader _unit;
};
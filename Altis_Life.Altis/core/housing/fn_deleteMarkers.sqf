/*
	File: fn_deleteMarkers.sqf
	Author: Mario2002
	
	Description:
	deletes the markers for player houses

	Edited and Modified by: CDawg
*/

{
	deleteMarkerLocal _x;
}forEach life_houses_markers;

life_houses_markers = [];
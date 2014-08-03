/*
	@Author: =IFD= Cryptonat
	@Created: 2/22/14

	Description:
	Saves the player's gear every 10 minutes.
*/
while {true} do {   
	sleep (480 + random 120);   
	if (alive player) then   
        {
		playerPosition = [getpos player select 0, getpos player select 1, 0];
		[false] call life_fnc_sessionUpdate;  
		systemChat "Session AutoSynced";  
		if (rating player < 100000) then { player addRating 999999; };
		[] call life_fnc_equipGear;
	};
};
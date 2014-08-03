if((player getVariable "repairtoken") >= 2) then
{ 
	_unit = _this;
	WaitUntil{(getPos _unit select 2)<2}; 
	sleep 3;
	if((getPos _unit select 2)>2 || !(_unit in thisList) || (damage _unit < 0.05)) exitWith {};
    _unit vehicleChat "Repairing...";
    random sleep 30;
    player setVariable["repairtoken",0];
    _unit setDamage 0;
	hint "Your vehicle has been fully repairs. Please come again.";
};

																																
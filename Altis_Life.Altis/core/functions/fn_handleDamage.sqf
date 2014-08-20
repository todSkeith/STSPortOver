/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master damage handling system for Stratis / Altis Life
*/
private["_unit","_damage","_source","_projectile","_sel","_curWep"];
_unit = _this select 0;
_sel = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;
_curWep = "";

if(isPlayer _source && _source isKindOf "Man") then {_curWep = currentWeapon _source;};

if (_projectile in ["mini_Grenade"]) then{
	_unit allowDamage false;
	_damage = 0;
	[] spawn life_fnc_handleFlashbang;
	_unit allowDamage true;
	};


// if(playerSide == west && side _source == west) then
// {
	// _damage = 0;
// };
//if(_sel == "" || _sel == "head_hit" || _sel =="body" || _sel == "head" || _sel == "hand_l" || _sel == "leg_l") then
if(_sel == "") then
{
	if ((damage _unit + _damage) > 0.99) then
	{
		_unit playMove "AinjPpneMstpSnonWrflDnon_rolltoback";
		_unit setDamage 0;
		_unit allowDamage false;

		_damage = 0;
		if(!(_unit getVariable ["unconscious", false])) then 
		{
			_unit setVariable["unconscious",true,true];
			if(isNull _source && alive _unit) then
			{
				[[0,format["%1 was critically wounded by an environmental collision.", name _unit]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
			}
			else
			{
				[[0,format["%1 was critically wounded by %2", name _unit, name _source]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
				if(vehicle _source isKindOf "LandVehicle") then
				{
					if(side _source == civilian && _source != player) then {[[getPlayerUID _source,name _source,"481"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;};
				}
				else
				{
					if(side _source == civilian && _source != player) then {[[getPlayerUID _source,name _source,"245"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;};
					[_unit] spawn life_fnc_dropItems;
				};
			};
			[_unit, _source] spawn life_fnc_unconscious;
		}
		else
		{
			if((_sel == "head" || _sel == "head_hit") && !(_unit getVariable "unconscious") && _damage >= 1 && _source) then
			{
				_damage = 1;
			}
			else 
			{
				_damage = 0;
			};
		};
	};
}
else
{

	_ghp = switch (_sel) do
	{
		case "body": { "HitBody" };
		//case "head": { "HitHead" };
		case "hand_l": { "HitHands" };
		case "leg_l": { "HitLegs" };
	};
	if (((_unit getHitPointDamage _ghp) + _damage) > 0.99) then
	{
		_unit setHitPointDamage [_ghp,0.99];
		_damage = 0;
	};
};

if(_source != _unit && isPlayer _source && _curWep in ["hgun_P07_snds_F","arifle_SDAR_F"]) then
{
	if(side _source == west || player getVariable["playerIsBH",false]) then 
	{
		_unit allowDamage false;
		_damage = 0;
		if(_projectile in ["B_9x21_Ball","B_556x45_dual"]) then
		{
			_damage = 0;
			if(_curwep == "arifle_SDAR_F") then
			{
				if(!life_istazed && !(player getVariable["restrained",false]) && player distance _source < 100) then
				{
					_damage = 0;
					if(typeOf (vehicle player) == "B_Quadbike_01_F") then
					{
						player action ["Eject",vehicle player];
						[_unit,_source] spawn life_fnc_tazed;
					};

					if(vehicle player == player) then
					{
						[_unit,_source] spawn life_fnc_tazed;
					};
				};
			}
			else
			{
				_damage = 0;
				if(!life_istazed && !(player getVariable["restrained",false]) && player distance _source < 100) then
				{
					_damage = 0;
					if(typeOf (vehicle player) == "B_Quadbike_01_F") then
					{
						player action ["Eject",vehicle player];
						[_unit,_source] spawn life_fnc_tazed;
					};

					if(vehicle player == player) then
					{
						[_unit,_source] spawn life_fnc_tazed;
					};
				};
			};
		}
		else
		{
			_damage = 0;
			//player allowDamage true;
			if(_projectile == "") then
			{
				_damage = 0;
			};
		};

	};
};

if((player getVariable["restrained",false])) then
{
	_damage = 0;
};

[] call life_fnc_hudUpdate;
//systemChat format ["Hitbox: %1 | Overall health: %2 | Hitbox health: %3 | Damage taken: %4",_sel,damage _unit,_unit getHitPointDamage _ghp,_damage];
_damage;
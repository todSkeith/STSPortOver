/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{

	case "oilu": {8};
	case "oilp": {6};
	case "heroinu": {6};
	case "heroinp": {4};
	case "cannabis": {4};
	case "marijuana": {3};
	case "apple": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {4};
	case "tuna": {8};
	case "mullet": {4};
	case "catshark": {6};
	case "turtle": {6};
	case "fishing": {2};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "money": {0};
	case "pickaxe": {2};
	case "copperore": {4};
	case "ironore": {5};
	case "copper_r": {3};
	case "iron_r": {3};
	case "sand": {3};
	case "salt": {3};
	case "salt_r": {1};
	case "glass": {1};
	case "diamond": {4};
	case "diamondc": {2};
	case "cocaine": {6};
	case "cocainep": {4};
	case "spikeStrip": {15};
	case "rock": {6};
	case "cement": {5};
	case "goldore": {5};
	case "gold_r": {3};
	case "goldbar": {12};
	case "corn": {3};
	case "moonshine": {2};
	case "corona": {2};
	case "landshark": {2};
	case "coorslight": {2};
	case "budweiser": {2};
	case "fcrab": {2};
	case "fcrabp": {4};
	case "mcrabs": {2};
	case "mcrab": {4};
	case "crabpot": {10};
	case "defib" : {10};
	case "log" : {40};
	case "lumber" : {30};
	case "chainsaw" : {15};
	case "RoadConeStrip": {10};
	case "RoadCone": {2};
	case "RoadBlockWood": {23};
	case "coalore": {5};
	case "steel": {5};
	case "crowbar": {30};
	case "storage2": {30};
	case "storagesmall": {5};
	case "storagebig": {10};
	case "blastingcharge": {15};
	case "boltcutter": {5};
	case "defusekit": {2};
	default {1};
};

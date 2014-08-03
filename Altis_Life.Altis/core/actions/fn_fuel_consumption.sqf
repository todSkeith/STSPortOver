/*
                File: fuelConsumption.sqf
                Author: Egypt~Seal
               
                Description:
                Increases vehicles fuel consumption.
        */
 
        private["_vehicle","_rate"];
        _vehicle = vehicle player;
		_rate = 0;
        if(isNull _vehicle) exitwith {};
		
		// if (speed _vehicle < 0) then {
        // _vehicle setFuel ( Fuel _vehicle - (_rate) * 300 );
        // };
		
        while {(alive _vehicle) && (fuel _vehicle > 0)} do {
 
 
        switch ((typeOf _vehicle)) do
        {
                case "C_Offroad_01_F": {_rate = 0.00010};
                case "B_G_Offroad_01_F": {_rate = 0.00010};
                case "B_Quadbike_01_F": {_rate = 0.00010};
                case "O_Quadbike_01_F": {_rate = 0.00010};
                case "C_Quadbike_01_F": {_rate = 0.00010};
				case "O_Heli_Light_02_unarmed_F": {_rate = 0.000010};
                case "I_Truck_02_covered_F": {_rate = 0.00000010};
                case "I_Truck_02_transport_F": {_rate = 0.000010};
                case "C_Hatchback_01_F": {_rate = 0.000015};
                case "C_Hatchback_01_sport_F": {_rate = 0.00001};
                case "C_SUV_01_F": {_rate = 0.00001};
                case "C_Van_01_transport_F": {_rate = 0.000002};
                case "I_G_Van_01_transport_F": {_rate = 0.000001};
                case "C_Van_01_box_F": {_rate = 0.00001};
                case "C_Van_01_Fuel_F": {_rate = 0.000001};
                case "C_Boat_Civil_01_F": {_rate = 0.000010};
                case "C_Boat_Civil_01_police_F": {_rate = 0.000010};
                case "C_Boat_Civil_01_rescue_F": {_rate = 0.000010};
                case "B_Truck_01_box_F": {_rate = 0.000010};
                case "B_Truck_01_transport_F": {_rate = 0.000010};
				case "B_Truck_01_covered_F": {_rate = 0.000010};
                case "B_MRAP_01_F": {_rate = 0.000010};
                case "O_MRAP_02_F": {_rate = 0.000010};
                case "I_MRAP_03_F": {_rate = 0.000010};
                case "I_Heli_light_03_unarmed_F": {_rate = 0.00000080};
                case "O_Truck_02_covered_F": {_rate = 0.0000004};
                case "I_Truck_02_fuel_F": {_rate = 0.0000010};
                case "B_Heli_Transport_01_F": {_rate = 0.0000030};
                case "I_Heli_Transport_02_F": {_rate = 0.0000030};
                case "O_Heli_Light_02_F": {_rate = 0.0000010};
                case "C_Rubberboat": {_rate = 0.00000005};
                case "O_Boat_Armed_01_hmg_F": {_rate = 0.00000010};
                case "B_Boat_Armed_01_minigun_F": {_rate = 0.00000010};
                case "I_Boat_Armed_01_minigun_F": {_rate = 0.00000010};
                case "B_G_Boat_Transport_01_F": {_rate = 0.000000020};
                case "B_Boat_Transport_01_F": {_rate = 0.000000020};
				case "B_Heli_Light_01_F": {_rate = -80};
                sleep 0.2;
        };

		if (isengineon _vehicle) then {
		
        _vehicle setFuel ( Fuel _vehicle - (abs(speed _vehicle) + _rate) / 40000000 );
        };
        sleep 2;
        };
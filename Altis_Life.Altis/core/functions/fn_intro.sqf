
private ["_civ","_cop"];

//if (life_adminlevel > 0) exitWith {};

sleep 2;
_intro = [];
_civ = [format["Welcome to Seal Team Sloth, %1,<br/><br/><t align='center'><t size='0.95'>
		<br/>
Thank you for taking time out of your day to come and see our beautiful island. We provide a healthy and fun roleplaying environment which is backed by our strong community of players. If you are looking to have a good time, you’ve picked the right place! We also have some very important rules which can be viewed in the MAP (Click M) and shouldn’t be broken.		<br/>							
Your first question might be “where do I start?” well to start out we have many activities for you to do to start your adventure on our server. I think your best bet would be to earn some money. Why not head over to the DMV and pick up a license, Then head over and grab yourself a vehicle and go see our world famous Peach and Apple fields! Pick some peaches/apples and sell them to the Market (having a backpack will allow you to carry more) Besides running peaches, there are various other jobs across the island both legal and illegal that can earn you money. 
<br/>
<br/>
Familiarize yourself with some important functions we use on the daily in Altis! Press Y to access your main interface which shows your money in hand, in bank, and allows you to use your cell phone. Lock and unlock vehicles by clicking U. 
<br/>
<br/>
The cops of Altis are trained and here to help you, unless you are performing illegal operations, in which they will be forced to hunt you down. In the case of an emergency you can use your cell phone to contact the police. 
<br/>													For an even better roleplaying experience, join us on teamspeak at ts3.sealteamsloth.com and log on to the forums at Sealteamsloth.com 
<br/>
Enjoy your time on the island!	
<br/>
<br/>
*Please remember this is a roleplay server and we expect you to be able to roleplay situations. This is not a wasteland server where you can just kill anyone you want. VDM (Vehicle Death Match) and RDM (Random Death Match) will not be tolerated.  </t></t><br/><br/>", name player]];

_cop = [format["Welcome to Seal Team Sloth, %1,<br/><br/><t align='center'><t size='0.95'>
		<br/>
Thank you for taking time out of your day to come and see our beautiful island. We provide a healthy and fun roleplaying environment which is backed by our strong community of players. If you are looking to have a good time, you’ve picked the right place! We also have some very important rules which can be viewed in the MAP (Click M) and shouldn’t be broken.		<br/>							
Your first question might be “where do I start?” well to start out we have many activities for you to do to start your adventure on our server. I think your best bet would be to earn some money. Why not head over to the DMV and pick up a license, Then head over and grab yourself a vehicle and go see our world famous Peach and Apple fields! Pick some peaches/apples and sell them to the Market (having a backpack will allow you to carry more) Besides running peaches, there are various other jobs across the island both legal and illegal that can earn you money. 
<br/>
<br/>
Familiarize yourself with some important functions we use on the daily in Altis! Press Y to access your main interface which shows your money in hand, in bank, and allows you to use your cell phone. Lock and unlock vehicles by clicking U. 
<br/>
<br/>
The cops of Altis are trained and here to help you, unless you are performing illegal operations, in which they will be forced to hunt you down. In the case of an emergency you can use your cell phone to contact the police. 
<br/>													For an even better roleplaying experience, join us on teamspeak at ts3.sealteamsloth.com and log on to the forums at Sealteamsloth.com 
<br/>
Enjoy your time on the island!	
<br/>
<br/>
*Please remember this is a roleplay server and we expect you to be able to roleplay situations. This is not a wasteland server where you can just kill anyone you want. VDM (Vehicle Death Match) and RDM (Random Death Match) will not be tolerated.  </t></t><br/><br/>", name player]];

switch (playerSide) do {
	case west: {
		{
			_intro = _intro + [(parseText _x)];
		} forEach _cop;
		_cop = _intro;
		"Welcome To STS" hintC _cop;
	};
	case civilian: {
		{
			_intro = _intro + [(parseText _x)];
		} forEach _civ;
		_civ = _intro;
		"Welcome To STS" hintC _civ;
	};
};
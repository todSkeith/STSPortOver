if (life_cash < 500) then 
{ 
   hint "You don't have enough money to buy this!"; 
} else { 
   life_shortbread = life_cash - 500; 
   player setVariable["repairtoken",3];
   hintSilent parseText format["<t size='1' font='puristaMedium' color='#00FF3C'>Pull your vehicle in next door and we'll get to work!</t>"]; 
};
	

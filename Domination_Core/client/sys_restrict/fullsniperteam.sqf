/*
by [TWC] Hobbs
renders unit blind if there's not enough units in his group, like if a sniper team needs both players or an armour crew needs all 3.

Once they have enough, then it runs itself again to wait until the situation changes, so if someone drops out it renders the player blind again

*/


waitUntil {!isNull player};

waituntil {(count (units group player)) < 2};

if(!isMultiplayer)exitWith{};
cutText ["", "Black", 0.001];
player forceWalk true;


(group player) setvariable ["twc_teamrestrictedgrp", 1, true];

while {(count (units group player)) < 2}do{

cutText ["", "Black", 0.001];
    [
        "<t size='1.2'>Sniper Team</t><br/><t size='0.6'>You need both members of the sniper team online to proceed</t>", 0, 0.22, 5, 0, 0, 2
    ] spawn bis_fnc_dynamictext;
	sleep 5;
};
cutText ["","Black IN",5];
player forceWalk false;

//legit group system
(group player) setvariable ["twc_teamrestrictedgrp", 0, true];

if (((group player) getVariable ["twc_attachrestrictedgrp",1]) == 0) then {
	(group player) setvariable ["twc_legitgrp", time, true];
};

//last man, to de-legit the group when leaving
[] spawn {
	waituntil {(count (units group player)) == 1};
	(group player) setvariable ["twc_legitgrp", -99999, true];
};	



execvm "domination_core\client\sys_restrict\fullsniperteam.sqf";
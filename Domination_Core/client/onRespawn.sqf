

if (["interpreter", typeof player] call BIS_fnc_inString) then {
	twc_terp = player;
	publicvariable "twc_terp";
	};
	
	//make the player middle eastern if they spawn as ANA. Sounds racist, but otherwise it looks dumb
_me = player;
if (faction player == "ana_units") then {
[_me, ["PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03"]call bis_fnc_selectrandom] remoteExec ["setFace", 0, _me] 
};

//Set Radios Correctly
_radioID = [getText (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_radioType")] call acre_api_fnc_getRadioByType; 
 if (!isNil "_radioID") then { 
_channelNumber = getNumber (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_radioChannel"); 
 _switchChannel = [_radioID, _channelNumber] call acre_api_fnc_setRadioChannel; 
 Hint parseText format ["<t color='#d0dd00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Radio Set</t><br/><t color='#d0dd00' size='0.8' shadow='1' shadowColor='#565656' align='left'>Radio:</t><t color='##013bb6' size='0.8' shadow='1' shadowColor='#565656' align='right'>%1</t><br/><t color='#d0dd00' size='0.8' shadow='1' shadowColor='#565656' align='left'>Channel:</t><t color='##013bb6' size='0.8' shadow='1' shadowColor='#565656' align='right'>%2</t>",getText (configFile >> "cfgVehicles" >> (typeOf player) >> "twc_radioType"),_channelNumber]; 
 };
 
 
 _armourcrew = ["Modern_British_VehicleCrew","Modern_USMC_VehicleCrew","1990_British_Tank_Crew_Desert","2000_British_Vehicle_Crew","Modern_British_VehicleCommander","Modern_USMC_VehicleCommander","1990_British_Tank_Commander_Desert","2000_British_Vehicle_Commander"];
 
 if (typeof player in _armourcrew) then {
	 _count = group player getvariable ["armourcount", 0];group player setvariable ["armourcount", _count + 1, true];
	[player] remoteExec ["twc_fnc_crewcount", 2];
	
	if ((["infantry", str (group player)] call BIS_fnc_inString)) then {
		if ((group player getvariable ["twc_ismechanised", 0]) == 0) then {
			group player setvariable ["twc_ismechanised", 1, true];
		};
	};
};

sleep 10;

if ((random 1)< 0.1) then {
	if (( count(allPlayers - entities "HeadlessClient_F"))>6) then {

	if (isnil "twc_enemyhasradio") then {
		twc_enemyhasradio = 0;
		publicVariable "twc_enemyhasradio"
	};

	if (twc_enemyhasradio == 0) exitwith {};

	[getmarkerpos "aoCenterMarker", [player], getmarkerpos "aoCenterMarker"] remoteExec ["twc_fnc_spawnReinforcements", 2];

	//["twc_event_artyattack", [getpos player], twc_artyguns] call CBA_fnc_targetEvent;
	};
};
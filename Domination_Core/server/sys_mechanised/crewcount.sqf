params ["_player"];

 _armourcrew = ["Modern_British_VehicleCrew","Modern_USMC_VehicleCrew","1990_British_Tank_Crew_Desert","2000_British_Vehicle_Crew","Modern_British_VehicleCommander","Modern_USMC_VehicleCommander","1990_British_Tank_Commander_Desert","2000_British_Vehicle_Commander"];

_crewcount = 0;

{if (typeof _x in _armourcrew) then {_crewcount = _crewcount + 1;}} foreach units group _player;

group player setvariable ["armourcount", _crewcount, true];

waituntil {!alive _player};



_crewcount = 0;

{if (typeof _x in _armourcrew) then {_crewcount = _crewcount + 1;}} foreach units group _player;

group player setvariable ["armourcount", _crewcount, true];

if ((group player getvariable ["armourcount", 1]) == 0) then {
	group player setvariable ["twc_ismechanised", 0, true];
};
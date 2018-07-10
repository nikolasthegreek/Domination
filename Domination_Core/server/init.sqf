#include "defines.sqf";
#include "func\init.sqf";
#include "sys_basedefence\init.sqf";


basemode = 0;
publicvariable "basemode";

if(isNil "townLocationArray") then{
	townLocationArray = [];
};

if(isNil "customlocations") then{
	customlocations = [];
};


if(isNil "twc_is90") then{
	twc_is90 = 0;
	publicVariable "twc_is90";
};




{_location = createLocation [ "NameVillage" , getpos _x, 100, 100];
_location setText "Objective " + str floor random 999;
townLocationArray = townLocationArray + (nearestLocations [getpos _x, ["NameVillage","NameCity","NameCityCapital","nameLocal"], 2]);} foreach customlocations;

townLocationArray = townLocationArray + (nearestLocations [getMarkerPos "base", ["NameVillage","NameCity","NameCityCapital"], twc_maxObjDistance]);

[] call twc_fnc_getAO;

_pilotConnectedList = [];

// apparently onPlayerConnected is unreliable...
// so we call this when we know it's a pilot and connected via client
// _caller = player id
["TWC_PilotConnected", {
	params ["_caller"];

	_pilotConnectedList pushBack _caller;
	
	if (count _pilotConnectedList > 0) then {
		[] call twc_fnc_spawnJet;
	};
}] call CBA_fnc_addEventHandler;

["TWC_PilotDisconnected", "onPlayerDisconnected", {
	_pilotConnectedList - [_uid];
	
	if (count _pilotConnectedList < 1) then {
		[] call twc_fnc_noMorePilots;
	};
}] call BIS_fnc_addStackedEventHandler;

sirenlist = (getmarkerpos "base") nearobjects ["Land_Loudspeakers_F", 500];

mainbase = createTrigger ["EmptyDetector", getmarkerpos "base"];
mainbase setTriggerArea [500, 500, 0, false];
mainbase setTriggerActivation ["EAST", "PRESENT", true];
mainbase setTriggerTimeout [60,60,60,True];
mainbase setTriggerStatements ["count thislist > 6","[""thistrigger""] call twc_fnc_changebase;", "[]spawn {sleep 2;[""thistrigger""] call twc_fnc_changebase; {deleteVehicle _x}forEach allDeadMen;{ deleteVehicle _x }forEach allDead;}"];

_trg2 = createTrigger ["EmptyDetector", getmarkerpos "base"];
_trg2 setTriggerArea [700, 700, 0, false];
_trg2 setTriggerActivation ["EAST", "PRESENT", true];
_trg2 setTriggerTimeout [0,0,0,True];
_trg2 setTriggerStatements ["count thislist > 4","execVM 'domination_core\server\sys_basedefence\INF_Alarm.sqf';", " {deleteVehicle _x}forEach allDeadMen;{ deleteVehicle _x }forEach allDead;"];



_trg3 = createTrigger ["EmptyDetector", getmarkerpos "base"];
_trg3 setTriggerArea [1000, 1000, 0, false];
_trg3 setTriggerActivation ["EAST", "PRESENT", true];
_trg3 setTriggerTimeout [0,0,0,True];
_trg3 setTriggerStatements ["true","basemode == 1; publicVariable 'basemode';", "basemode == 0; publicVariable 'basemode';"];



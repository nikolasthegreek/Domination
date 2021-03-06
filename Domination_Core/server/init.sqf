[] spawn {
twc_missionname = missionname;
publicvariable "twc_missionname";

#include "crashprotection.sqf";
#include "defines.sqf";
#include "func\init.sqf";
#include "sys_basedefence\init.sqf";
#include "sys_mechanised\init.sqf";
#include "sys_vehicleRespawn\init.sqf";

CIVILIAN setFriend [EAST, 1];

basemode = 0;
publicvariable "basemode";

//execvm "domination_core\client\sys_ragdoll\fn_initRagdoll.sqf";

if(isNil "townLocationArray") then{
	townLocationArray = [];
};

if(isNil "twc_basepos") then{
	twc_basepos = getmarkerpos "base";
	publicVariable "twc_basepos";
};


["ace_captiveStatusChanged", {
	params ["_unit", "_state", "_reason"];
	if (isplayer _unit) exitwith {};
	if ((_unit getVariable ["twc_bluefluff",0]) == 0) exitwith {};
	deletevehicle _unit;
}] call CBA_fnc_addEventHandler;

addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if (!isplayer _unit) exitwith {};
	if ((_unit distance (missionnamespace getvariable ["twc_basepos", [0,0,0]])) > 150) exitwith {};
	[(vehicle _unit)] spawn {
		params ["_unit"];
		while {isplayer _unit} do {
			sleep 1;
		};
		deletevehicle _unit;
	};
}];

_trg = createTrigger ["EmptyDetector", twc_basepos];
_trg setTriggerArea [1000, 1000, 0, false];
_trg setTriggerActivation ["ANYPLAYER", "PRESENT", true];
_trg setTriggerTimeout [0,0,0, true];

_trg setTriggerStatements ["this","[twc_basepos, true] call twc_fnc_civfluff;",""];

if(isNil "twc_activearty") then{
	twc_activearty = 0;
};

if(isNil "customlocations") then{
	customlocations = [];
};

_daytimeonly = missionnamespace getvariable ["twc_daytimeonly", false];
if (_daytimeonly || (["90", twc_missionname] call BIS_fnc_inString) || (["70", twc_missionname] call BIS_fnc_inString)) then {
	[]spawn{
		//sleep 120;
		while {true} do {
			//checks if it's too dark for non-nvg eras every hour, then skips through to first light. Double while statement to get the extra .3 hour in because first light in sunormoon terms is often still too dark
			while {sunormoon < 1} do {
				while {sunormoon < 1} do {
					skiptime 1;
				};
				skiptime 0.3;
			};
			sleep 3600;
		};
	};
};

if(isNil "twc_attachmentgap") then{
	twc_attachmentgap = 12;
	publicVariable "twc_attachmentgap";
};

if(isNil "twc_is90") then{
	twc_is90 = 0;
	publicVariable "twc_is90";
};

//list of leaders that can do attachments without the slot system
twc_goodeggs = [
"76561198018609662", //sarge
"76561198050512686", //patty
"76561198034730503", //cuck
"76561198053960783", //crow
"76561198042520910", //aleyboy
"76561198035067970", //martingw
"76561198005456546", //bosenator
"76561198157816526", //nubben
"76561198030665694" //hobbs

];
publicVariable "twc_goodeggs";

if(isNil "twc_wdveh") then{
twc_wdveh = 0;
publicVariable "twc_wdveh";
};

if(isNil "twc_mortar_targetlist") then{
	twc_mortar_targetlist = [];
	publicVariable "twc_mortar_targetlist";
};

if(isNil "twc_nonpersistent") then{
twc_nonpersistent = 0;
publicVariable "twc_nonpersistent";
};

if(isNil "twc_idflist") then{
twc_idflist = [];
publicVariable "twc_idflist";
};


twc_missionname = missionname;
publicVariable "twc_missionname";

if (twc_nonpersistent == 1) then {
	addMissionEventHandler ["HandleDisconnect", {
		params ["_unit", "_id", "_uid", "_name"];
		if ((count allplayers) ==0) then {
			"Won" call BIS_fnc_endMissionServer;
		};
	}];
};


{
townLocationArray pushback (getpos _x);} foreach customlocations;

//townLocationArray = townLocationArray + (nearestLocations [getMarkerPos "base", ["NameVillage","NameCity","NameCityCapital"], twc_maxObjDistance]) + (nearestLocations [getMarkerPos "base", ["NameVillage","NameCity","NameCityCapital"], (twc_maxObjDistance / 1.5)]) + (nearestLocations [getMarkerPos "base", ["NameVillage","NameCity","NameCityCapital"], (twc_maxObjDistance / 2)]) + (nearestLocations [getMarkerPos "base", ["NameVillage","NameCity","NameCityCapital"], (twc_maxObjDistance / 2)]);

_buildingarray = nearestObjects [getMarkerPos "base", ["House", "Building"], twc_maxObjDistance];
{townlocationarray pushback (getpos _x);} foreach _buildingarray;

[] call twc_fnc_getAO;

 _eventHandlerID = ["twc_event_artyattack", { 
params ["_enemy"]; 
[_enemy] call twc_fnc_artyattack;}] call CBA_fnc_addEventHandler; 


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
mainbase setTriggerStatements ["count thislist > 4","call twc_fnc_changebase_bluetored", "[]spawn {sleep 2;call twc_fnc_changebase_redtoblue; {deleteVehicle _x}forEach allDeadMen;{ deleteVehicle _x }forEach allDead;}"];

_trg2 = createTrigger ["EmptyDetector", getmarkerpos "base"];
_trg2 setTriggerArea [700, 700, 0, false];
_trg2 setTriggerActivation ["EAST", "PRESENT", true];
_trg2 setTriggerTimeout [0,0,0,True];
_trg2 setTriggerStatements ["count thislist > 6","execVM 'domination_core\server\sys_basedefence\INF_Alarm.sqf';", ""];



_trg3 = createTrigger ["EmptyDetector", getmarkerpos "base"];
_trg3 setTriggerArea [1000, 1000, 0, false];
_trg3 setTriggerActivation ["EAST", "PRESENT", true];
_trg3 setTriggerTimeout [0,0,0,True];
_trg3 setTriggerStatements ["this","basemode = 1; publicVariable 'basemode';", "basemode = 0; publicVariable 'basemode';"];

};

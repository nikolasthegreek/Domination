 _spawnpos = getpos AmmoBoxSpawner;
 
_vehtype = "rhsusf_mrzr4_d";

 
 _veh = _vehtype createvehicle _spawnpos;   

_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Vehicle Spawner</t>"; 

 _text1 =  "<br />The Vehicle Has Been Spawned. It's Already Loaded With Ammunition";
_spawntext = parsetext (_title + _text1);
hint _spawntext;



_boxaction = ["deleteCreate","Return Vehicle","",{deleteVehicle this;

},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;


if ((missionnamespace getvariable ["twc_wdveh", 0]) == 0) then {
	[
		_veh,
		["mud",1], 
		["tailgateHide",0,"tailgate_open",0,"cage_fold",0]
	] call BIS_fnc_initVehicle;
} else {
	[
		_veh,
		["mud_olive",1], 
		["tailgateHide",0,"tailgate_open",0,"cage_fold",0]
	] call BIS_fnc_initVehicle;
};

clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;


_veh AddWeaponCargoGlobal ["rhs_weap_m72a7",2];
_veh AddWeaponCargoGlobal ["UK3CB_BAF_Javelin_Slung_Tube",2];

_veh AddMagazineCargoGlobal ["CUP_30Rnd_556x45_Emag",20];
_veh AddMagazineCargoGlobal ["CUP_30Rnd_556x45_Emag_Tracer_Red",5];

_veh AddMagazineCargoGlobal ["UGL_FlareWhite_F",2];
_veh AddMagazineCargoGlobal ["1Rnd_HE_Grenade_shell",7];
_veh AddMagazineCargoGlobal ["1Rnd_Smoke_Grenade_shell",3];

_veh addItemCargoGlobal ["DemoCharge_Remote_Mag",1];
_veh addItemCargoGlobal ["ACE_Clacker",1];
_veh addItemCargoGlobal ["ACE_EntrenchingTool",1];
_veh addItemCargoGlobal ["ACE_fieldDressing",25];
_veh addItemCargoGlobal ["ACE_elasticBandage",15];
_veh addItemCargoGlobal ["ACE_packingBandage",15];
_veh addItemCargoGlobal ["ACE_salineIV_250",10];
_veh addItemCargoGlobal ["ACE_epinephrine",3];
_veh addItemCargoGlobal ["ACE_morphine",3];
_veh addItemCargoGlobal ["HandGrenade",2];
_veh addItemCargoGlobal ["SmokeShell",3];
_veh addItemCargoGlobal ["SmokeShellRed",3];

_fsgun = ["UK3CB_BAF_L7A2",1];
_fsmag = ["UK3CB_BAF_762_100Rnd_T",5];

_veh AddMagazineCargoGlobal ["rhsusf_mag_17Rnd_9x19_JHP",4];
_veh AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd_T",5];
_veh AddMagazineCargoGlobal ["UK3CB_BAF_762_L42A1_20Rnd",10];

_mag = (group player) getvariable ["twc_cqbmag", "CUP_30Rnd_556x45_Emag"];
_veh AddMagazineCargoGlobal [_mag ,5];


if ((random 1) < 0.5) then {
	_fsgun = ["UK3CB_BAF_L110A2_ELCAN3D",1];
	_fsmag = ["UK3CB_BAF_556_200Rnd_T",5];
};

_veh AddWeaponCargoGlobal _fsgun;
_veh AddMagazineCargoGlobal _fsmag;
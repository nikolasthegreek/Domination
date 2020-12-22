params["_heli"];

if(isNil "_heli")exitWith{hint "No coyote was given to the spawn system, please notify management"};


if(isNil "twc_coyotecount") then{
	twc_coyotecount = 0;
	publicVariable "twc_coyotecount";
};


if (twc_coyotecount >= 2) exitwith {
	
	
_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Too Many FST Vehicles</t>"; 

 _text1 = format ["<br />There Are Already 2 FST Vehicles In The AO. You Can Return Them To Base To Have Access to Another",1];
_spawntext = parsetext (_title + _text1);
hint _spawntext;
	
	};




//twc_coyotecount=twc_coyotecount + 1;
//publicVariable "twc_coyotecount";

_veh = _heli createvehicle (getPos AmmoBoxSpawner);

clearWeaponCargoGlobal _veh;
clearBackpackCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearitemCargoGlobal _veh;


_title  = "<t color='#ffbf00' size='1.2' shadow='1' shadowColor='#000000' align='center'>Vehicle Spawner</t>"; 

 _text1 =  "<br />The Vehicle Has Been Spawned. It's Already Loaded With Ammunition";
_spawntext = parsetext (_title + _text1);
hint _spawntext;


_veh setammocargo 0;

if (_heli == "UK3CB_BAF_Coyote_Logistics_L111A1_W") then {
	_veh AddMagazineCargoGlobal ["UK3CB_BAF_127_100Rnd",8];
};

if (_heli == "UK3CB_BAF_Coyote_Logistics_L134A1_W") then {
	_veh AddMagazineCargoGlobal ["UK3CB_BAF_32Rnd_40mm_G_Box",8];
};

_fsgun = ["UK3CB_BAF_L7A2",1];
_fsmag = ["UK3CB_BAF_762_100Rnd_T",5];

_veh AddWeaponCargoGlobal _fsgun;
_veh AddMagazineCargoGlobal _fsmag;

[_veh, player, 4] call twc_fnc_genericfillvehicle;


_veh addEventHandler ["Killed",{

twc_coyotecount=twc_coyotecount - 1;
publicVariable "twc_coyotecount";
	}];
_boxaction = ["deleteCreate","Return Vehicle","",{deleteVehicle this;

},{(count (player nearobjects ["Land_InfoStand_V1_F", 200]) > 0)}] call ace_interact_menu_fnc_createAction;
[_veh,0,["ACE_MainActions"],_boxaction] call ace_interact_menu_fnc_addActionToobject;

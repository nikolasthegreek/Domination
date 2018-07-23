

_fstlow = {(( count(allPlayers - entities "HeadlessClient_F")) >= 0)};

_fsthi = {(( count(allPlayers - entities "HeadlessClient_F")) >= 6)};



if(((typeOf player) in ["Modern_British_logitech"]) || (["fst", typeof player] call BIS_fnc_inString))then{



	_ammoaction = ["weaponspawn","Spawn Heavy Weapons","",{},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_ammoaction,true] call ace_interact_menu_fnc_addActionToClass;

	_ammoaction = ["ammospawn","Spawn Ammo","",{},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_ammoaction,true] call ace_interact_menu_fnc_addActionToClass;

	if (twc_wdveh == 1) then {
	_vehaction = ["vehiclespawnwoodland","Spawn Vehicles","",{},_fstlow] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_vehaction,true] call ace_interact_menu_fnc_addActionToClass;
	} else {

	_vehaction = ["vehiclespawndesert","Spawn Vehicles","",{},_fstlow] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_vehaction,true] call ace_interact_menu_fnc_addActionToClass;
	};



	_fstaction1 = ["spawnl111","Spawn L111A1 HMG","",{execvm "domination_core\client\sys_player\boxes\staticL111A1.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "weaponspawn"],_fstaction1,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction2 = ["spawnl134","Spawn L134 GMG","",{execvm "domination_core\client\sys_player\boxes\staticL134A1.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "weaponspawn"],_fstaction2,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction21 = ["spawnl7","Spawn L7 GPMG","",{execvm "domination_core\client\sys_player\boxes\staticL7.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "weaponspawn"],_fstaction21,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	_UKaction5 = ["SpawnmedCreate","Spawn Medical Crate","",{execvm "domination_core\client\sys_player\boxes\smallMedical.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction5,true] call ace_interact_menu_fnc_addActionToClass;	
	
	_fstaction5 = ["spawnm6","Spawn M6 Mortar","",{execvm "domination_core\client\sys_player\boxes\smallMortar.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "weaponspawn"],_fstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction3 = ["spawn50","Spawn .50 Ammo","",{execvm "domination_core\client\sys_player\boxes\50calammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn"],_fstaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_snaction1 = ["Spawnsnipbox","Spawn Sniper Ammo","",{execvm "domination_core\client\sys_player\boxes\smallCratesniper.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn"],_snaction1,true] call ace_interact_menu_fnc_addActionToClass;
	

	_fstaction4 = ["spawn762","Spawn 7.62 Ammo","",{execvm "domination_core\client\sys_player\boxes\762ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn"],_fstaction4,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction5 = ["spawnm6","Spawn M6 Ammo","",{execvm "domination_core\client\sys_player\boxes\smallMortarAmmo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn"],_fstaction5,true] call ace_interact_menu_fnc_addActionToClass;
	
	_actionempty = ["SpawnemptyCreate","Spawn Large Empty Crate","",{"TWC_AmmoBox_Other_Pallet_pub" createVehicle (getPos AmmoBoxSpawner)},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn"],_actionempty,true] call ace_interact_menu_fnc_addActionToClass;
	
		_hfstaction3 = ["spawn50","Spawn Spare Wheels","",{execvm "domination_core\client\sys_player\boxes\Repairkit.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn"],_hfstaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction6 = ["spawn40","Spawn 40mm Ammo","",{execvm "domination_core\client\sys_player\boxes\40ammo.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn"],_fstaction6,true] call ace_interact_menu_fnc_addActionToClass;
	
	_fstaction7 = ["SpawnsmallUKCreate","Spawn Small UK Crate","",{execvm "domination_core\client\sys_player\boxes\smallcrateuk.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;
	
		if (!(["90", twc_missionname] call BIS_fnc_inString)) then {
		
			if (!(["00", twc_missionname] call BIS_fnc_inString)) then {
			_fstaction7 = ["SpawnsmallUKCreate","Spawn Coyote GMG","",{["UK3CB_BAF_Coyote_Logistics_L134A1_W"] execvm "domination_core\client\sys_player\vehicles\coyote.sqf"},_fsthi] call ace_interact_menu_fnc_createAction;
			["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;

			_fstaction7 = ["SpawnsmallUKCreate","Spawn Coyote GMG","",{["UK3CB_BAF_Coyote_Logistics_L134A1_D"] execvm "domination_core\client\sys_player\vehicles\coyote.sqf"},_fsthi] call ace_interact_menu_fnc_createAction;
			["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawndesert"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;
			
			_fstaction7 = ["SpawnsmallUKCreate","Spawn Coyote HMG","",{["UK3CB_BAF_Coyote_Logistics_L111A1_W"] execvm "domination_core\client\sys_player\vehicles\coyote.sqf"},{true}] call ace_interact_menu_fnc_createAction;
			["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;

			_fstaction7 = ["SpawnsmallUKCreate","Spawn Coyote HMG","",{["UK3CB_BAF_Coyote_Logistics_L111A1_D"] execvm "domination_core\client\sys_player\vehicles\coyote.sqf"},{true}] call ace_interact_menu_fnc_createAction;
			["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawndesert"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;
			
			
			} else {
			
			
			_fstaction7 = ["SpawnsmallUKCreate","Spawn WMIK Milan","",{["UK3CB_BAF_LandRover_WMIK_Milan_Green_B"] execvm "domination_core\client\sys_player\vehicles\coyote.sqf"},{true}] call ace_interact_menu_fnc_createAction;
			["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;

			_fstaction7 = ["SpawnsmallUKCreate","Spawn WMIK Milan","",{["UK3CB_BAF_LandRover_WMIK_Milan_Sand_A"] execvm "domination_core\client\sys_player\vehicles\coyote.sqf"},{true}] call ace_interact_menu_fnc_createAction;
			["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawndesert"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;

			_fstaction7 = ["SpawnsmallUKCreate","Spawn Milan Box","",{["UK3CB_BAF_Box_Milan_Ammo"] createvehicle getpos ammoboxspawner},{true}] call ace_interact_menu_fnc_createAction;
			["Land_InfoStand_V1_F",0,["ACE_MainActions", "ammospawn"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;
			};
		};
	};

	
	
if((typeOf player) in ["Modern_British_logitech"])then{
	_UKaction = ["Spawncontainer","Spawn Large Container","",{execvm "domination_core\client\sys_player\boxes\Container.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction,true] call ace_interact_menu_fnc_addActionToClass;
	
	_UKaction3 = ["spawn50","Spawn Night Ops Box","",{execvm "domination_core\client\sys_player\boxes\smallCratenightops.sqf"},{true}] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions"],_UKaction3,true] call ace_interact_menu_fnc_addActionToClass;
	
	
	_fstaction7 = ["SpawnsmallUKCreate","Spawn Quad Bike","",{["B_Quadbike_01_F"] execvm "domination_core\client\sys_player\vehicles\quadbike.sqf"},_fsthi] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawndesert"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;

	_fstaction7 = ["SpawnsmallUKCreate","Spawn Quad Bike","",{["B_Quadbike_01_F"] execvm "domination_core\client\sys_player\vehicles\quadbike.sqf"},_fsthi] call ace_interact_menu_fnc_createAction;
	["Land_InfoStand_V1_F",0,["ACE_MainActions", "vehiclespawnwoodland"],_fstaction7,true] call ace_interact_menu_fnc_addActionToClass;
	
};



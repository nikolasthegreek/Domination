/*
*    TWC public sevrer
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/
_boxClass = "ACE_Box_Ammo";

_box = _boxClass createVehicle (call twc_fnc_getammospawnloc);

clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

_box AddMagazineCargoGlobal ["30Rnd_556x45_Stanag",20];
_box AddMagazineCargoGlobal ["30Rnd_556x45_Stanag_Tracer_Red",5];

_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd",6];
_box AddMagazineCargoGlobal ["UK3CB_BAF_556_200Rnd_T",2];

_box AddMagazineCargoGlobal ["CUP_17Rnd_9x19_glock17",8];
_box AddMagazineCargoGlobal ["1Rnd_SmokeBlue_Grenade_shell",5];
_box AddMagazineCargoGlobal ["1Rnd_SmokeGreen_Grenade_shell",5];
_box AddMagazineCargoGlobal ["1Rnd_SmokeRed_Grenade_shell",5];

_box addItemCargoGlobal ["ACE_fieldDressing",5];
_box addItemCargoGlobal ["ACE_elasticBandage",5];
_box addItemCargoGlobal ["ACE_quikclot",5];
_box addItemCargoGlobal ["ACE_packingBandage",5];
_box addItemCargoGlobal ["ACE_personalAidKit",1];
_box addItemCargoGlobal ["ACE_salineIV_500",4];
_box addItemCargoGlobal ["ACE_atropine",5];
_box addItemCargoGlobal ["ACE_epinephrine",5];
_box addItemCargoGlobal ["ACE_morphine",5];
_box addItemCargoGlobal ["HandGrenade",2];
_box addItemCargoGlobal ["SmokeShell",2];
_box addItemCargoGlobal ["SmokeShellRed",2];

/*
*    TWC public sevrer
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/
_boxClass = "twc_public_40mmbox_small";


params ["_box"];
if (isnil "_box") then {
	_box = _boxClass createVehicle (getPos AmmoBoxSpawner);
};
clearWeaponCargoGlobal _box;
clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearitemCargoGlobal _box;

//Weapons


//supplies
_box AddMagazineCargoGlobal ["UK3CB_BAF_32Rnd_40mm_G_Box",10];

[player, _box] call ace_cargo_fnc_startLoadIn;
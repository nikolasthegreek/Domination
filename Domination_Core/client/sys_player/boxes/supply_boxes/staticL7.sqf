/*
*    TWC public server
*   Sling loadable ammo crates
*
*  Paddock Change all ammo boxes to have the correct ammo and weapons
*
*
*/

if (( count(allPlayers - entities "HeadlessClient_F"))<4) then {
[4] execVM "Domination_Core\client\sys_restrict\restrictedkit.sqf";} else {
_boxClass = "UK3CB_BAF_Box_L7A2";

_box = _boxClass createVehicle (call twc_fnc_getammospawnloc);

//clearWeaponCargoGlobal _box;
//clearBackpackCargoGlobal _box;
//clearMagazineCargoGlobal _box;
//clearitemCargoGlobal _box;

//1 Mortar and Tripod
//_box AddWeaponCargoGlobal ["UK3CB_BAF_M6",1];

//Ammo

//_box addItemCargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Shells",50];
//_box addItemCargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Flare_White",10];
//_box addItemCargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White",10];

//Respawn/Despawn Script



[player, _box] call ace_cargo_fnc_startLoadIn;}
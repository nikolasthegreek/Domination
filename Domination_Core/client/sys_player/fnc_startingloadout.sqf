_role = typeof vehicle player;

_skip = (group player) getvariable ["twc_nopersistentloadout", false];

if (_skip) exitwith {};

_profile = profilenamespace getvariable ["twcpubloadout" + _role, []];

if ((count _profile) == 0) exitwith {
	//systemchat "no loadout found, writing . . .";
	//player additemtouniform "ACE_Canteen";
	profilenamespace setvariable ["twcpubloadout" + _role, [uniformitems player, vestitems player, backpackitems player]];
	saveprofilenamespace;
};

_uniformradios = [];
_vestradios = [];
_backpackradios = [];

{
	if ("ACRE" in _x) then {
		_radio = [_x] call twc_fnc_getradiotype;
		_uniformradios pushback _radio;
		//systemchat _x;
	};
} foreach uniformitems player;

{
	if ("ACRE" in _x) then {
		_radio = [_x] call twc_fnc_getradiotype;
		_vestradios pushback _radio;
		//systemchat _x;
	};
} foreach vestitems player;

{
	if ("ACRE" in _x) then {
		_radio = [_x] call twc_fnc_getradiotype;
		_backpackradios pushback _radio;
		//systemchat _x;
	};
} foreach backpackitems player;


{player removeitemfromuniform _x} foreach (uniformitems player);

if (!("ACE_EarPlugs" in (_profile select 0))) then {
	player additemtouniform "ACE_EarPlugs";
};

if (!("ACE_Canteen" in (_profile select 0))) then {
//	player additemtouniform "ACE_Canteen";
};
{
		player additemtouniform _x;

} foreach _uniformradios;

{
	
	if (!("ACRE" in _x)) then {
		player additemtouniform _x;
	};
} foreach (_profile select 0);

{player removeitemfromvest _x} foreach (vestitems player);

	
{
		player additemtovest _x;

} foreach _vestradios;
{
	if (!("ACRE" in _x)) then {
		player additemtovest _x;
	};
} foreach (_profile select 1);

{
	player removeitemfrombackpack _x;
} foreach (backpackitems player);

	
{
		player additemtobackpack _x;

} foreach _backpackradios;	
{
	
	if (!("ACRE" in _x)) then {
		player additemtobackpack _x;
	};
} foreach (_profile select 2);
player removeitem "ACE_Canteen_Empty";
player removeitem "ACE_Canteen_Half";
player removeitem "ACE_Canteen";

	

//systemchat "loaded loadout";

call twc_fnc_setradio;
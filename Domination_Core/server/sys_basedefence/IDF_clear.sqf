

if (twc_is90 == 0) then {

	{
	[_x, "TWC_sound_idfclear"] call CBA_fnc_globalSay3d;
} forEach sirenlist;

	} else {


	{
	[_x, "TWC_sound_allclearvoice"] call CBA_fnc_globalSay3d;
} forEach sirenlist;

	
};
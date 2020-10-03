//This file defines all of the units used. To change to a new map you mostly only have to change this file.

//Enable or Disable Debug
twc_serverDebug = false;

twc_surrenderVote = false;

_script = execVM "Domination_Core\SHK_pos\shk_pos_init.sqf";
//waitUntil{scriptDone _script};

twc_maxObjDistance = 5000;

crampresent = 1;
publicVariable "crampresent";

twc_wdveh = 1;
publicVariable "twc_wdveh";

squad = (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK" >> "Infantry" >> "CUP_O_TK_InfantrySquad");

squadAT = (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK" >> "Infantry" >> "CUP_O_TK_InfantrySectionAT");

squadAA = (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK" >> "Infantry" >> "CUP_O_TK_InfantrySectionAA");

tankaaCombined = (configfile >> "CfgGroups" >> "East" >> "CUP_O_TK" >> "Armored" >> "CUP_O_TK_T55Platoon");

tank = ["rhs_t72ba_tv", "rhs_t72bb_tv"];

ifv = ["rhs_bmp2e_msv", "rhs_bmp1_msv"];

apc = ["rhs_btr70_msv", "rhs_btr80_msv"];

//add in an object name and the game will create a location there and spawn enemies from it
customlocations = [];

twc_tankcount = random 2;
twc_apccount = random 2;
twc_ifvcount = random 2;
twc_aacount = 0;
twc_infcount = 3;
twc_aainfcount = 2;

squad = (configfile >> "CfgGroups" >> "East" >> "rhs_faction_msv" >> "rhs_group_rus_msv_infantry" >> "rhs_group_rus_msv_infantry_section_AT");

twc_aosToComplete = 3;
twc_enemyFlag = "Faction_CUP_RU";
twc_badAOs = ["airstrip","Krasnostav","Olsha"];
twc_LastAO = "";

// event handlers run in the non-scheduled environment (can't be execVM)
[] call compile preprocessFile "Domination_Core\server\init.sqf";
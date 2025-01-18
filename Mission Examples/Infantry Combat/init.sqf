/**
  File for initialization of your mission
 */

// Import functions
fnc_subtitles = compile preprocessFileLineNumbers "function\dialog\YP_fnc_showSubtitlesCOD.sqf";
fnc_spawnAttack_AI = compile preprocessFileLineNumbers "function\spawn\YP_fnc_spawnInfantryAttackSimple.sqf";

// Run in unscheduled environment
remoteExecCall "setup.sqf";

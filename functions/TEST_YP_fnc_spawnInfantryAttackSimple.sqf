/**
    Create group somewhere in area and start patrolling

    _unitClasses    === ARRAY, unit classes to be spawned in order
    _areaCenter     === POSITION, center of area
    _areaRadius     === NUMBER [DEFAULT 0], radius of area
    _groupBehaviour === STRING [DEFAULT "AWARE"], ["CARELESS" "SAFE" "AWARE" "COMBAT" "STEALTH"], group behaviour
    _groupCombat    === STRING [DEFAULT "YELLOW"], ["BLUE" "GREEN" "WHITE" "YELLOW" "RED"], group combat mode
    _groupFormation === STRING [DEFAULT "LINE"], group formation for attack

    RETURN: CREATED GROUP
 */
params [
    "_unitClasses",
    "_areaCenter",
    ["_areaRadius" 0],
    ["_groupBehaviour", "AWARE"],
    ["_groupCombat", "YELLOW"],
    ["_groupFormation", "LINE"]
];

private _position = [_areaCented, _areaRadius] call CBA_fnc_randPos;
private _group = [_position, _unitClasses] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;
[_group, _targetPosition, 0, "SAD", _groupBehaviour, _groupCombat, "FULL", _groupFormation] call CBA_fnc_addWaypoint;

_group;

/**
    Spawn group in area and attack position 

    _unitClasses    === ARRAY, unit classes to be spawned in order
    _side           === SIDE, units side
    _targetPosition === POSITION, position to attack
    _areaCenter     === POSITION [DEFAULT _targetPosition], center of area to spawn group
    _areaRadius     === NUMBER [DEFAULT 300], radius of area to spawn group
    _groupBehaviour === STRING [DEFAULT "AWARE"], ["CARELESS" "SAFE" "AWARE" "COMBAT" "STEALTH"], group behaviour
    _groupCombat    === STRING [DEFAULT "YELLOW"], ["BLUE" "GREEN" "WHITE" "YELLOW" "RED"], group combat mode
    _groupFormation === STRING [DEFAULT "LINE"], group formation for attack

    RETURN: CREATED GROUP
 */
params [
    "_unitClasses",
    "_side",
    "_targetPosition",
    "_areaCenter",
    ["_areaRadius", 300],
    ["_groupBehaviour", "AWARE"],
    ["_groupCombat", "YELLOW"],
    ["_groupFormation", "LINE"]
];

private _position = [_areaCenter, _areaRadius] call CBA_fnc_randPos;
private _group = [_position, _side, _unitClasses] call BIS_fnc_spawnGroup;
_group deleteGroupWhenEmpty true;
[_group, _targetPosition, 0, "SAD", _groupBehaviour, _groupCombat, "FULL", _groupFormation] call CBA_fnc_addWaypoint;

_group;

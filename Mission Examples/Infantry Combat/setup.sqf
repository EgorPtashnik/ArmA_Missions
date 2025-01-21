/**
    Initial setup for mission. Can include different tweaks for AI, setting markers visibility and so on
 */

remoteExecCall "createDiary.sqf";

// CoD Health System
{
    {
        _x setVariable ["healing", false];
        _x addEventHandler ["Hit", {
            private _unit = this select 0;
            private _damage = this select 2;
            private _unitDamage = damage unit + _damage;
            private _isHealing = _x getVariable "healing";

            if (_unitDamage > 0.4 && !_isHealing ) then {
                _x setVariable ["healing", true];
                [_x] spawn {
                    private _unit = this select 0;
                    private _unitDamage = damage _unit;
                    while {_unitDamage <= 0.2 || _unitDamage == 1} do {
                        _unit setDamage _unitDamage - 0.025;
                        sleep 1;
                    };
                    _unit setVariable ["healing", false];
                };
            };
            
            _damage;
        }];
    } forEach allUnits
} call CBA_fnc_directCall;


/**
List of common commands / functions for programming
*/

// execute unscheduled
[code, arguments] call CBA_fnc_directCall;

// execute unscheduled after delay
[code, [arg1, arg2], delay] call CBA_fnc_waitAndExecute;

// execute unscheduled after condition
[condition, statement, [argForBoth], timeOut, codeIfTimeOut] call CBA_fnc_waitUntilAndExecute;


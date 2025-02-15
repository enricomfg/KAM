#include "..\script_component.hpp"
/*
* Author: DiGii
* This cant be called manualy!
*
* Arguments:
* 0: Logic <LOGIC>
* 1: Affected Units (not used) <ARRAY>
* 2: Activated <BOOL>
*
* Return Value:
* NONE
*
* Example:
* [] call kat_chemical_fnc_gasmodule;
*
* Public: No
*/

private _logic = param [0, objNull, [objNull]];
private _activated = param [2, true, [true]];
private _radius_max = _logic getVariable ["Radius_Max", 20];
private _radius_min = _logic getVariable ["Radius_Min", 10];
private _gastype = _logic getVariable ["GAS_type", 0];
private _isSealable = _logic getVariable ["IsSealable", false];

if (_activated) then {
    if (count synchronizedObjects _logic > 0) then {
        private _object = (synchronizedObjects _logic) select 0;
        if (_isSealable) then {
            [QGVAR(createSealActionGlobal), [_object, _logic]] call CBA_fnc_globalEventJIP;
        };

        [_object, getPos _object, _radius_max, _radius_min, parseNumber _gastype] call FUNC(gasCheck);
    } else {
        [_logic, getPos _logic, _radius_max, _radius_min, parseNumber _gastype] call FUNC(gasCheck);
    };
};

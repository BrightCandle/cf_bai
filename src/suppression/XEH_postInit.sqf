#include "script_component.hpp"

params ["_unit"];

if (GVAR(disableSuppression)) exitWith {
	INFO("Suppression module disabled");
};

if !isServer exitWith {
	LOG("Not the server, no events or decay running");
};

if (isPlayer _unit ) exitWith {
	LOG_2("Unit %1 of type %2 should not be tracking suppression",_unit,typeof _unit);
};

LOG_1("Suppression added to unit %1",_unit);

[_unit] spawn FUNC(decaySuppression);

_unit addEventHandler ["Suppressed", FUNC(suppressedEventHandler)];
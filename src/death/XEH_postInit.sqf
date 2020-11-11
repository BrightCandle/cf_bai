#include "script_component.hpp"

if (GVAR(disableDeath)) exitWith {
};

if !(isServer) exitWith {
};

["ace_killed", {
	_this call FUNC(died);
}] call CBA_fnc_addEventHandler;

LOG("Death handler added");
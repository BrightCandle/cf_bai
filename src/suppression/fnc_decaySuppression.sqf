#include "script_component.hpp"

params ["_unit"];

while {alive _unit} do {
	_current = _unit getVariable ["CF_BAI_suppression",[0.0,0]];
	_suppression = _current select 0;
	_lastSuppressed = _current select 1;

	if (_suppression > 0.0) then {
		if((time - _lastSuppressed) > GVAR(heldTime)) then {
			_suppression = (_suppression - (GVAR(decay)*GVAR(decaySleep))) max 0;
			
			_unit setVariable ["CF_BAI_suppression",[_suppression,_lastSuppressed]];
			[_unit,_suppression] call FUNC(setSubSkills);

			LOG_3("Unit: %1, decayed suppression to: %2, unit variable:%3",_unit,_suppression,_unit getVariable "CF_BAI_suppression");
		};
	};

	sleep GVAR(decaySleep);
};

LOG_1("Unit: %1 died",_unit);
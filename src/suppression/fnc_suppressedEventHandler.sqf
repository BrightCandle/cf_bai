#include "script_component.hpp"

params ["_unit", "_distance", "_shooter", "_instigator", "_ammoObject", "_ammoClassName", "_ammoConfig"];

_current = _unit getVariable ["CF_BAI_suppression",[0.0,0]];
_oldSuppression = _current select 0;
_lastTime = _current select 1;

_calibre = (getNumber (_ammoConfig >> "caliber"));
_impact = (GVAR(bulletImpact) * (_calibre  max 0.5));
_updatedSuppression = (_oldSuppression + _impact) min 1.0;

_newTime = time;

LOG_4("Unit: %1, Calibre:%2,Impact:%3,Suppression:%4",_unit,_calibre,_impact,_updatedSuppression);

_unit setVariable ["CF_BAI_suppression",[_updatedSuppression,_newTime],false];
[_unit,_updatedSuppression] call FUNC(setSubSkills);
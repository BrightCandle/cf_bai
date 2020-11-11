#include "script_component.hpp"

params ["_unit", "_causeOfDeath", "_killer", "_instigator"];

if !(isPlayer _unit) exitWith {
};


[_unit,_killer] spawn {
	params ["_unit","_killer"];

	if (isNull _unit || isNull _killer) exitWith {
		LOG("Null unit or killer ");
	};

	LOG_2("%1 Killed by %2",_unit,_killer);

	private _messages = [_unit,_killer] call FUNC(getDeathMessages);

	LOG_1("Messages is %1",_messages);

	private _clientid = owner _unit;

	sleep GVAR(deathMessageDelay);

	if GVAR(messageSystemChat) then {
		[_messages] remoteExec [QFUNC(messageSystemChat),_clientId,false];
	};

	if GVAR(messageSideChat) then {
		private _side = side _unit;
		LOG_2("%1 side is %2",_unit,_side);
		[_messages,_side] remoteExec [QFUNC(messageSideChat),_side,false];
	};

	if GVAR(messageHint) then {
		[_messages] remoteExec [QFUNC(messageHint),_clientId,false];
	};
};
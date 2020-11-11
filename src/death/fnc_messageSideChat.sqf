#include "script_component.hpp"

params ["_messages","_side"];

LOG_1("Units side is %1",_side);

{ 
	[_side,"HQ"] sideChat _x;
} forEach _messages;
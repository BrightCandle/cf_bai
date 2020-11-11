#include "script_component.hpp"

params ["_messages"];

{ 
	systemChat _x;
} forEach _messages;
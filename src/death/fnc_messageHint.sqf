#include "script_component.hpp"

params ["_messages"];

private _message = _messages joinString "\n";

hintSilent _message;
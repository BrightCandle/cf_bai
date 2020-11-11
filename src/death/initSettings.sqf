#include "script_component.hpp"

_categoryName="CF_BAI_death";

[   QGVAR(disableDeath),"CHECKBOX",
    ["Disable Death Module","When enabled all death functions will stop"],[_categoryName,"Enable"],
    false,true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(deathMessageDelay),"SLIDER",
    ["Time to wait until death message","The time in seconds before a death message will appear to the player"],[_categoryName,"Message"],
    [1,30,10,0],true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(messageSystemChat),"CHECKBOX",
    ["Should output to system chat","When enabled death messages go to system chat for the dead player"],[_categoryName,"Message"],
    false,true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(messageSideChat),"CHECKBOX",
    ["Should output to side chat","When enabled death messages go to side chat for everyone on the same side"],[_categoryName,"Message"],
    true,true,{}
] call CBA_Settings_fnc_init;

[   QGVAR(messageHint),"CHECKBOX",
    ["Should output to hint","When enabled death messages produce a local hint"],[_categoryName,"Message"],
    true,true,{}
] call CBA_Settings_fnc_init;

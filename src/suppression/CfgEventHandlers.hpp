
class Extended_PreInit_EventHandlers {
    class CF_BAI_suppression {
        init = "call compile preprocessFileLineNumbers '\x\CF_BAI\addons\suppression\XEH_preInit.sqf'";
    };
};

class Extended_InitPost_Eventhandlers {
    class CAManBase {
        class CF_BAI_suppression {
            init = "call compile preprocessFileLineNumbers '\x\CF_BAI\addons\suppression\XEH_postInit.sqf'";
        };
    };
};
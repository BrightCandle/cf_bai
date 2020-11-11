class Extended_PreInit_EventHandlers {
    class CF_BAI_death {
        init = "call compile preprocessFileLineNumbers '\x\CF_BAI\addons\death\XEH_preInit.sqf'";
    };
};

class Extended_PostInit_EventHandlers {
    class CF_BAI_death {
        init = "call compile preprocessFileLineNumbers '\x\CF_BAI\addons\death\XEH_postInit.sqf'";
    };
};

class CfgPatches
{
	class CF_BAI_death
		{
			name="death";
			units[] = { };
			weapons[] = { };
			requiredAddons[] = {"CBA_MAIN"};
			requiredVersion=2.00;
			version = "2.0.alpha6";
			versionStr = "2.0.alpha6";
			versionDesc="CF_BAI_death";
			versionAr[] = {2,0,0};
			author = "BrightCandle";
			authors[]= {"BrightCandle"};
			url = "https://www.charliefoxtrotops.com";
		};
};

class CfgSettings {
   class CBA {
      class Versioning {
         class CF_BAI_death {
           	main_addon = "CF_BAI_main";

            class Dependencies {
               CBA[]={"cba_main", {3,9,0}, "true"};
            };
         };
      };
   };
};

#include "CfgEventHandlers.hpp"
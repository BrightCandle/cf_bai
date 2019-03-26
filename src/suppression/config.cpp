class CfgPatches
{
	class CF_BAI_suppression
		{
			units[] = { };
			weapons[] = { };
			requiredAddons[] = {"CBA_MAIN"};
			requiredVersion=1.88;
			version = "2.0.alpha2";
			versionStr = "2.0.alpha2";
			versionDesc="CF_BAI_suppression";
			versionAr[] = {2,0,0};
			author = "BrightCandle";
			authors[]= {"BrightCandle"};
			url = "https://www.charliefoxtrotops.com";
		};
};

class CfgSettings {
   class CBA {
      class Versioning {
         class CF_BAI_suppression {
           	main_addon = "CF_BAI_main";

            class Dependencies {
               CBA[]={"cba_main", {3,6,0}, "true"};
            };
         };
      };
   };
};

#include "CfgEventHandlers.hpp"
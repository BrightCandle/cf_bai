#include "script_component.hpp"

CF_BAI_DETECT_FNC_day_night = {
	private _transitionState = sunOrMoon;

	_remaining = 1.0 - GVAR(environmentConiditions_nightTime);

	// is 0 or 1, is it just more unlikely at night or should it adjust distance and other factors
	private _percentage = GVAR(environmentConiditions_nightTime) + (sunOrMoon * _remaining);

	[_percentage,_percentage,"dayNight"];
};

CF_BAI_DETECT_FNC_lighting = {
	private _lightingParams = getLighting;

	private _visibility = 1.0 - (_lightingParams select 3);

	private _percentage = _visibility max GVAR(environmentConiditions_nightTime);

	[_percentage,_percentage,"lighting"];
};


//Uses rain level to reduce vision by 20% at worst
CF_BAI_DETECT_FNC_rain = {
	private _rainLevel = rain;

	private _reductionPercentage = GVAR(environmentConiditions_rain);

	private _finalValue = 1 - (_reductionPercentage *_rainLevel);

	[_finalValue,_finalValue,"rain"];
};

//need to gather some hyristics for 0.25, 0.5 and 0.75 or maybe 10 values to see what the actual human vision is and then linear interpret
CF_BAI_DETECT_FNC_fog = {
	private _fog = fog;

	private _reductionPercentage = GVAR(environmentConiditions_fog);

	private _finalValue = 1 - (GVAR(environmentConiditions_fog) *_fog);

	[_finalValue,_finalValue,"fog"];
};

private _lighting = [] call CF_BAI_DETECT_FNC_lighting;
private _rain = [] call CF_BAI_DETECT_FNC_rain;
private _fog = [] call CF_BAI_DETECT_FNC_fog;

[_lighting,_rain,_fog];
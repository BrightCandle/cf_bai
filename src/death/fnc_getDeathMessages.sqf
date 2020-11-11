#include "script_component.hpp"

params ["_unit","_killer"];

private _realKiller = _killer;

CF_BAI_death_FNC_toPercentage = {
	params ["_skill"];
    
	private _result = "NONE";
    if !(IsNil("_skill")) then {
		_result = format ["%1%2",(ceil (_skill * 100)),"%"];
	};

	_result;
};

private _woodlandReduction = [_realKiller] call CF_BAI_fnc_getWoodlandReduction;
_woodlandReduction = [_woodlandReduction] call CF_BAI_death_FNC_toPercentage;

private _boost = [_realKiller] call CF_BAI_fnc_getBoost;
_boost = [_boost] call CF_BAI_death_FNC_toPercentage;

private _suppression = [_realKiller] call CF_BAI_fnc_getSuppression;
_suppression = [_suppression] call CF_BAI_death_FNC_toPercentage;

private _killersIdentity = _realKiller;

if (isPlayer _realKiller) then {
	_killersIdentity = name _realKiller;
} else {
	_killersIdentity = format ["%1 (%2)", name _realKiller,_realKiller] ;
};

LOG_3("skills messages are %1, %2, %3",_woodlandReduction,_boost,_suppression);

[
	format ["%1 killed %2",_killersIdentity,name _unit],
	format ["Skill increasers Boost: %1",_boost],
	format ["Reducers Woodland: %1, Suppression: %2",_woodlandReduction,_suppression]
];
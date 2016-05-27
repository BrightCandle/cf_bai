
params ["_unit","_skill", "_final_skill"];

_tpwcas_skill_name = switch(_skill) do {
  case "aimingAccuracy": { "tpwcas_originalaccuracy" };
  case "aimingShake": { "tpwcas_originalshake" };
  case "courage": { "tpwcas_originalcourage" };
  default { "none" };
};

if(_tpwcas_skill_name == "none") then {
  _unit setskill [_skill,_final_skill];
} else {
  _current_skill = _unit skill _skill;

  _tpwcas_supstate = _unit getVariable ["tpwcas_supstate",0];

  _tpw_original_skill = _unit getVariable [_tpwcas_skill_name,1.0];
  
  if( cf_bai_debug_logging ) then {
    diag_log formatText ["[CF_BAI] Unit:%1, Skill: %2, CurrentSkill: %3, TPWCAS_OriginalSkill: %4, TPWCAS_SupState: %5",_unit, _skill,_current_skill,_tpw_original_skill,_tpwcas_supstate];
  };
  

  if(_tpwcas_supstate != 0) then {
	_tpwcas_skill_multiplier = (_current_skill / _tpw_original_skill) min 0.999;

	_unit setVariable [_tpwcas_skill_name,_final_skill];
	_unit setskill [_skill,_final_skill * _tpwcas_skill_multiplier];
	
	if( cf_bai_debug_logging ) then {
      diag_log formatText ["[CF_BAI] Unit:%1, Multiplier:%2 - TPWCAS Active",_unit,_tpwcas_skill_multiplier];
    };
  
  } else {
    if( cf_bai_debug_logging ) then {
      diag_log formatText ["[CF_BAI] Unit:%1 - TPWCAS Not Active",_unit];
    };

	_unit setVariable [_tpwcas_skill_name,_final_skill];
    _unit setskill [_skill,_final_skill];
  };


};
/// miles_skill_fly()
/// @desc Performs Miles' fly skill.
/// @returns {bool}

if (!on_ground && fly_time > 0 && player_get_input(INP_JUMP, CHECK_PRESSED)) return player_set_state(miles_state_fly);
return false;

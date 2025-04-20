/// sonic_skill_homing()
/// @desc Performs Sonic's homing attack.
/// @returns {bool} Returns whether a homing attack has been called.

var skill_index; skill_index = game_save_get_skill(character_index, "homing");

if ((((skill_index == HOMING_ADVENTURE || skill_index == HOMING_GENERATIONS) && player_get_input(INP_JUMP, CHECK_PRESSED)) ||
    (skill_index >= HOMING_UNLEASHED && player_get_input(INP_AUX, CHECK_PRESSED))) && instance_exists(homing_inst))
{
    return player_set_state(sonic_state_homing);
}

return false;

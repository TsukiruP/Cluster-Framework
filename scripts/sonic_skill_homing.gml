/// sonic_skill_homing()
/* Returns whether a homing attack has been called. */

var skill_id;

skill_id = game_save_get_skill(character_id, "homing");

if ((((skill_id == HOMING_ADVENTURE || skill_id == HOMING_GENERATIONS) && player_get_input(INP_JUMP, CHECK_PRESSED)) ||
    (skill_id >= HOMING_UNLEASHED && player_get_input(INP_AUX, CHECK_PRESSED))) && instance_exists(homing_handle))
{
    return player_set_state(sonic_state_homing);
}

return false;

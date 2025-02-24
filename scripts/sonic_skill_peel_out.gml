/// sonic_skill_peel_out()
/// @desc Performs Sonic's Super Peel Out.
/// @returns {bool} Returns whether the Super Peel Out has been called.

if (on_ground && x_speed == 0 && player_get_input(INP_UP, CHECK_HELD) && player_get_input(INP_JUMP, CHECK_PRESSED))
{
    var skill_index; skill_index = game_save_get_skill(character_index, "peel");
    
    if (skill_index) return player_set_state(sonic_state_peel_out);
}

return false;
/// sonic_skill_peel_out()
/* Returns whether the Super Peel Out has been called. */

if (on_ground && x_speed == 0 && player_get_input(INP_UP, CHECK_HELD) && player_get_input(INP_JUMP, CHECK_PRESSED))
{
    var skill_id;

    skill_id = game_save_get_skill(character_id, "peel");
    if (skill_id) return player_set_state(sonic_state_peel_out);
}

return false;

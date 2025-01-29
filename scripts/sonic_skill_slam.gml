/// sonic_skill_slam()
/* Returns whether a slam skill has been called. */

if (!on_ground && player_get_input(INP_DOWN, CHECK_HELD) && player_get_input(INP_AUX, CHECK_PRESSED))
{
    var skill_id;

    skill_id = game_save_get_skill(character_id, "slam");

    switch (skill_id)
    {
        case SKILL_BOUND_ATTACK:
            return player_set_state(sonic_state_bound);

        case SKILL_STOMP:
            return player_set_state(sonic_state_stomp);
    }
}

return false;

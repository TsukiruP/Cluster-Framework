/// sonic_skill_slam()
/// @desc Performs Sonic's slam skill.
/// @returns {bool}

if (!on_ground && player_get_input(INP_DOWN, CHECK_HELD) && player_get_input(INP_AUX, CHECK_PRESSED))
{
    var skill_index; skill_index = save_get_skill(character_index, "slam");

    switch (skill_index)
    {
        case SKILL_BOUND_ATTACK:
            return player_set_state(sonic_state_bound);

        case SKILL_STOMP:
            return player_set_state(sonic_state_stomp);
    }
}

return false;

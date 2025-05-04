/// sonic_skill_ground()
/// @desc Performs Sonic's ground skill.
/// @returns {bool}

if (on_ground && player_get_input(INP_AUX, CHECK_PRESSED))
{
    var skill_index; skill_index = save_get_skill(character_index, "ground");

    switch (skill_index)
    {
        case SKILL_HAMMER:
            return player_set_state(player_state_hammer);

        case SKILL_SKID:
            return player_set_state(sonic_state_skid);

    }
}

return false;

/// miles_skill_ground()
/// @desc Performs Miles' ground skill.
/// @returns {bool}

if (on_ground && player_get_input(INP_AUX, CHECK_PRESSED))
{
    var skill_index; skill_index = save_get_skill(character_index, "ground");

    switch (skill_index)
    {
        case SKILL_HAMMER:
            return player_set_state(player_state_hammer);
        
        case MILES_TAIL:
            return player_set_state(miles_state_tail_swipe);
        
        case MILES_TORNADO:
            return player_set_state(miles_state_tornado);
    }
}

return false;

/// miles_skill_fly()
/// @desc Performs Miles' fly skill.
/// @returns {bool}

if (!on_ground && fly_time < fly_max_time && player_get_input(INP_JUMP, CHECK_PRESSED))
{
    fly_hammer = (save_get_skill(CHAR_MILES, "ground") == SKILL_HAMMER);
    return player_set_state(pick(!underwater && fly_hammer, miles_state_fly, miles_state_fly_hammer));
}

return false;

/// miles_skill_air()
/// @desc Performs Miles' air skills.
/// @returns {bool}

if (!on_ground)
{
    if (status_shield_allow && player_get_input(INP_AUX, CHECK_PRESSED))
    {
        var skill_shield; skill_shield = save_get_skill(character_index, "shield");
        var skill_insta; skill_insta = save_get_skill(character_index, "insta");
        
        if (skill_shield && status_shield >= SHIELD_BUBBLE) return player_routine_shield();
        else if (skill_insta) return player_routine_insta();
    }
}

return false;

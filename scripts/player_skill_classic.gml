/// player_skill_classic()

if (!on_ground)
{
    // Drop Dash:
    if (player_get_input(INP_JUMP, CHECK_PRESSED))
    {
        return player_set_state(sonic_state_drop_dash);
    }

    // Shields:
    if (status_shield_allow && player_get_input(INP_AUX, CHECK_PRESSED))
    {
        if (status_shield >= SHIELD_BUBBLE)
        {
            return player_routine_shield();
        }
        else
        {
            player_routine_insta();
            return true;
        }
    }
}

return false;

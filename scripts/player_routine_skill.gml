/// player_routine_skill()
/* Returns whether a character skill has been called. */

if (!input_cpu || (input_cpu && input_cpu_gamepad_alarm > 0))
{
    switch (character_index)
    {
        case CHAR_SONIC:
            if (sonic_skill_slam()) return true;
            else if (sonic_skill_homing()) return true;
            else if (sonic_skill_ground()) return true;
            else if (sonic_skill_air()) return true;
            else if (sonic_skill_peel_out()) return true;
            break;

        case CHAR_CLASSIC:
            if (!on_ground)
            {
                if (player_get_input(INP_JUMP, CHECK_PRESSED)) return player_set_state(sonic_state_drop_dash);

                if (status_shield_allow && player_get_input(INP_AUX, CHECK_PRESSED))
                {
                    if (status_shield >= SHIELD_BUBBLE) return player_routine_shield();
                    else
                    {
                        player_routine_insta();
                        return true;
                    }
                }
            }
            break;
    }
}

return false;

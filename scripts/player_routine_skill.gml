/// player_routine_skill()
/* Returns whether a character skill has been called. */

if (input_cpu == false || (input_cpu == true && input_cpu_gamepad_alarm > 0))
{
    switch (character_id)
    {
        // Sonic:
        case CHAR_SONIC:
            return player_skill_sonic();
    }
}

return false;

/// player_routine_skill()
/* Executes player skills based on the character. */

// Return character skill:
switch (character_id)
{
    // Sonic:
    case CHAR_SONIC:
        return sonic_skill_list();
}

return false;

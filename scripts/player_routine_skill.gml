/// player_routine_skill()
/* Returns whether a character skill has been called. */

switch (character_id)
{
    // Sonic:
    case CHAR_SONIC:
        return player_skill_sonic();
}

return false;

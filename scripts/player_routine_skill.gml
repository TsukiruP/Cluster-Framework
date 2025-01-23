/// player_routine_skill()
/* Returns whether a character skill has been called. */

if (!input_cpu || (input_cpu && input_cpu_gamepad_alarm > 0))
{
    return script_execute(pick(character_id, player_skill_sonic, player_skill_classic, player_skill_classic, player_skill_classic, player_skill_classic));
}

return false;

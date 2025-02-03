/// player_routine_roll()
/* Shorthand for checking if the player can roll. */

if (abs(x_speed) > 0.5)
{
    if (player_get_input(INP_DOWN, CHECK_HELD))
    {
        audio_play_sfx("snd_roll", true);
        return player_set_state(player_state_roll);
    }
}

return false;

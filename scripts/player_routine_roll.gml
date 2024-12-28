/// player_routine_roll()
//

if (abs(x_speed) > 0.5)
{
    if (player_get_input(INP_DOWN, CHECK_HELD))
    {
        // Play sound:
        audio_sfx_play("snd_roll", true);
        return player_set_state(player_state_roll);
    }
}

// No roll:
return false;

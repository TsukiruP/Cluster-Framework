/// player_routine_jump()
// A rider kick to the sky takes off toward a dream.

if (player_collision_ceiling(y_radius + 5) == noone && player_get_input(INP_JUMP, CHECK_PRESSED))
{
    // Play SFX:
    audio_sfx_play("snd_jump", true);

    return player_set_state(player_state_jump);
}

// No jump:
return false;

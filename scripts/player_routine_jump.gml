/// player_routine_jump()
// A rider kick to the sky takes off toward a dream.

if (player_collision_ceiling(y_radius + 5) == noone && input_player[INP_JUMP, CHECK_PRESSED] == true)
{
    // Play sfx:
    sfx_play("snd_jump", true);

    player_set_state(player_state_jump);
    return true;
}

// No jump:
return false;

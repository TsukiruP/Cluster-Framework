/// player_routine_jump()
// A jump to the sky turns to a rider kick.

if (player_collision_ceiling(y_radius + 5) == noone && input_player[INP_JUMP, CHECK_PRESSED] == true)
{
    // Play sfx:
    sfx_play("snd_jump", true);

    return player_set_state(player_state_jump);
}

// No jump:
return false;

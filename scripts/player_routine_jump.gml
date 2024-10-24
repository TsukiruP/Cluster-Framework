/// player_routine_jump()
// A jump to the sky turns to a rider kick.

if (player_collision_ceiling(y_radius + 5) == noone && input_player[INP_JUMP, CHECK_PRESSED] == true)
{
    // Play sound:
    audio_play(ds_map_find_value(ctrl_audio.sfx_map, "snd_jump.wav"));

    return player_set_state(player_state_jump);
}

// No jump:
return false;

/// player_routine_jump()
// A jump to the sky turns to a rider kick.

// Jump:
if (player_collision_ceiling(y_radius + 5) == noone && input_player[INP_JUMP, CHECK_PRESSED] == true) {
    // Set flag:
    jump_state = true;

    // Set state:
    player_set_state(player_state_air);

    // Play sound:
    sound_play_single("snd_jump");

    return true;
}

return false;

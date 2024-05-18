/// player_action_jump()
// A jump to the sky turns to a rider kick.

// Varying jump:
if (y_speed < jump_release && action_state == ACTION_JUMP && jump_complete == false && player_input[INP_JUMP, CHECK_HELD] == false) {
    y_speed = jump_release;
}

// Jump!:
if ((ground == true || (action_state == ACTION_CARRY && player_input[INP_DOWN, CHECK_HELD] == true)) && player_input[INP_JUMP, CHECK_PRESSED] == true) {
    // Ignore some ground based actions:
    if (action_state != ACTION_CROUCH && action_state != ACTION_SPIN_DASH && action_state != ACTION_PEEL_OUT && tunnel_lock == false) {
        x_speed     -= dsin(ground_angle) * jump_force;
        y_speed     -= dcos(ground_angle) * jump_force;
        ground       = false;
        action_state = ACTION_JUMP;

        // Play sound:
        sound_play_single("snd_jump");
    }
}

if (action_state == ACTION_JUMP) {
    // Complete jump:
    if (y_speed > 0 && jump_complete == false) jump_complete = true;

    // Reset upon landing:
    if (ground == true) action_state = ACTION_DEFAULT;
}

// Variable clean up:
if (ground == true || action_state == ACTION_CARRY) {
    if (jump_complete != false) jump_complete = false;
    if (roll_rebounce != false) roll_rebounce = false;
    if (score_multiplier != 0) score_multiplier = 0;
}

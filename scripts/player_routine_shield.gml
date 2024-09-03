/// player_routine_shield()
// Or barriers, for the nerds.

// Shield allow:
status_shield_allow = false;

// Animation skip:
animation_skip = true;

// Shield behavior:
switch (status_shield) {
    // Fire:
    case SHIELD_FIRE:
        // Set speed:
        x_speed = 8 * image_xscale;
        y_speed = 0;

        // Camera lag:
        ctrl_camera.camera_lag_alarm = 16;

        // Play sound:
        sound_play_single("snd_shield_fire_dash");
        break;

    // Lightning:
    case SHIELD_LIGHTNING:
        // Set speed:
        y_speed = -5.5;

        // Play sound:
        sound_play_single("snd_shield_lightning_jump");
        break;

    // Bubble:
    case SHIELD_BUBBLE:
        // Set speed:
        x_speed = 0;
        y_speed = 8;

        // Bound:
        bound_state = 1;

        // Play sound:
        sound_play_single("snd_shield_bubble_bound");
        break;
}

// Return:
if (status_shield == SHIELD_BUBBLE) {
    player_set_state(player_state_bound);

    // Jump aux:
    jump_aux = input_player[INP_AUX, CHECK_PRESSED];

    return true;
} else {
    return player_set_state(player_state_jump, false);
}

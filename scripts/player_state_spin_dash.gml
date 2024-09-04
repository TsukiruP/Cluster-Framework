/// player_state_spin_dash(phase)
// Charge and Up.

switch (argument0) {
    // Start:
    case STATE_START:
        // Charge:
        spin_dash_charge = 0;

        // Queue effect:
        effect_queue = EFF_SPIN_DASH;

        // Play sound:
        sound_play_single("snd_spin_dash_charge");
        break;

    // Step:
    case STATE_STEP:
        // Movement:
        if (!player_movement_ground()) {
            exit;
        }

        // Slide off:
        if (relative_angle >= 45 && relative_angle <= 315) {
            // Fall:
            if (relative_angle >= 90 && relative_angle <= 270) {
                return player_set_state(player_state_air);
            } else {
                input_lock_alarm = 30;

                // Play sound:
                sound_play_single("snd_roll");

                return player_set_state(player_state_roll);
            }
        }

        // Release:
        if (input_player[INP_DOWN, CHECK_HELD] == false) {
            x_speed = image_xscale * (8 + (spin_dash_charge div 2));

            // Camera lag:
            if (input_cpu == false) {
                ctrl_camera.camera_lag_alarm = 16;
            }

            // Play sound:
            sound_play_single("snd_spin_dash_release");

            // Stop sounds:
            sound_stop("snd_spin_dash_charge");

            return player_set_state(player_state_roll);
        }

        // Charge:
        if (input_player[INP_JUMP, CHECK_PRESSED] == true) {
            var sfx_spin_dash;

            spin_dash_charge = min(spin_dash_charge + 2, 8);

            // Animation:
            player_set_animation("spin_charge");
            animation_reload = true;

            // Play sound:
            sfx_spin_dash = sound_play_single("snd_spin_dash_charge");
            sound_pitch(sfx_spin_dash, 1 + spin_dash_charge * 0.0625);
        }

        // Atrophy:
        if (spin_dash_charge > 0) {
            spin_dash_charge *= 0.96875;
        }
        break;

    // Finish:
    case STATE_FINISH:
        break;

    // Animate:
    case STATE_ANIMATE:
        with (instance_create(x, y, eff_spin_dash)) {
            player_handle = other.id;
        }
        break;
}

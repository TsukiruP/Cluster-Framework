/// player_action_spin_dash()
// Charge and Up.

// Trigger Spin Dash:
if (action_state == ACTION_CROUCH && tag_animations == false && player_input[INP_JUMP, CHECK_PRESSED] == true) {
    var sfx_spin_dash;

    action_state       = ACTION_SPIN_DASH;
    spin_dash_charge = 0;

    // Reset jump input:
    player_input[INP_JUMP, CHECK_PRESSED] = false;

    with (instance_create(x, y, eff_spin_dash_dust)) {
        player_handle = other.id;
    }

    // Play sound:
    sfx_spin_dash = sound_play_single("snd_spin_dash_charge");
}

// Spin Dash:
if (action_state == ACTION_SPIN_DASH) {
    if (ground == true) {
        // Let 'er rip:
        if (player_input[INP_DOWN, CHECK_HELD] == false) {
            g_speed      = animation_direction * (8 + (spin_dash_charge div 2));
            action_state = ACTION_ROLL;
            
            // Camera lag:
            if (input_cpu == false) ctrl_camera.camera_lag_alarm = 16;
            
            // Play sound:
            sound_play_single("snd_spin_dash_release");
            
            // Stop sounds:
            sound_stop("snd_spin_dash_charge");
        }
        
        // Increase charge:
        if (player_input[INP_JUMP, CHECK_PRESSED] == true) {
            spin_dash_charge = min(spin_dash_charge + 2, 8);
            
            // Set animation:
            player_set_animation("spin_charge", 0, true);
            
            // Play sound:
            sfx_spin_dash = sound_play_single("snd_spin_dash_charge");
            sound_pitch(sfx_spin_dash, 1 + spin_dash_charge * 0.0625);
        }
    }
    
    // Decrease charge:
    if (spin_dash_charge > 0) {
        spin_dash_charge *= 0.96875;
    }
}

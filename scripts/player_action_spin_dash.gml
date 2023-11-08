/// player_action_spin_dash()
// Charge and Up.

// Trigger Spin Dash:
if(action_state == ACTION_CROUCH && player_input[INP_JUMP, CHECK_PRESSED] == true) {
    action_state       = ACTION_SPIN_DASH;
    spin_dash_strength = 0;
    spin_dash_pitch    = 0;

    // Play sound:
    sfx_spin_dash = sound_play_single("snd_spin_dash_charge");
}

// Spin Dash:
if(action_state == ACTION_SPIN_DASH) {
    var sfx_spin_dash;

    // Let 'er rip:
    if(ground == true && player_input[INP_DOWN, CHECK_HELD] == false) {
        if((animation_direction == -1 && !player_collision_left(x, y, angle, mask_big)) || (animation_direction == 1 && !player_collision_right(x, y, angle, mask_big))) {
            x_speed      = animation_direction * (8 + (spin_dash_strength div 2)); 
            action_state = ACTION_ROLL;
            
            // Camera lag
            if(control_data == 0) ctrl_camera.camera_lag_alarm = 16;
            
            // Play sound:
            sound_play_single("snd_spin_dash_release");
            
            // Stop sounds:
            sound_stop("snd_spin_dash_charge");
            
            exit;
        } else {
            action_state = ACTION_CROUCH;
            x_speed      = 0;
        }
    }
    
    // Stop x speed:
    x_speed = 0;
    
    // Increase strength & pitch:
    if(player_input[INP_JUMP, CHECK_PRESSED] == true) {
        animation_target        = "super_spin";
        animation_current_frame = animation_start_frame;
        
        // Increase strength:
        spin_dash_strength = min(spin_dash_strength + 2, 8);
        
        // Increase pitch:
        spin_dash_pitch = min(spin_dash_pitch + 2, 8);
        
        // Play sound:
        sfx_spin_dash = sound_play_single("snd_spin_dash_charge");
        sound_pitch(sfx_spin_dash, 1 + (spin_dash_pitch * 0.075));
    }
    
    // Decrease strength:
    if(spin_dash_strength > 0) spin_dash_strength -= (spin_dash_strength / 0.125) / 256;
    else spin_dash_strength = 0;
    
    // End Super Spin:
    if(animation_current == "super_spin") {
        if(animation_finished == true) {
            animation_current       = "spin_dash";
            animation_current_frame = animation_start_frame;
        }
    }
}

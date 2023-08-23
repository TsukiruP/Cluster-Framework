/// character_action_skid()
// Try to outrun this demon to get left in the dust.

// Don't skid if input locked:
if(input_lock_left == true || input_lock_right == true) {
    if(action_state == ACTION_SKID) action_state = ACTION_DEFAULT;
    exit;
}

// Trigger skid:
if(ground = true && action_state == ACTION_DEFAULT && input_lock_alarm <= 0 && gimmick_lock == false) {
    if(angle_relative < 45 || angle_relative > 315) {
        if(((x_speed >= 4.5 && input_left == true) || (x_speed <= -4.5 && input_right == true)) && sign(x_speed) == animation_direction){
            action_state   = ACTION_SKID;
            skid_direction = sign(x_speed);
            
            // Play sound:
            sound_play("snd_skid");
        }
    }
}

// Skid:
if(action_state == ACTION_SKID) {
    // Skid left:
    if(skid_direction == -1) {
        // End when holding "forward":
        if(input_left == true) {
            action_state     = ACTION_DEFAULT;
            input_lock_alarm = 10;
        } else if(input_right == true) {
            if(x_speed >= 0) {
                x_speed             = 0.5;
                action_state        = ACTION_DEFAULT;
                animation_direction = 1;
            }
        }
    }
    
    // Skid right:
    if(skid_direction == 1) {
        // End when holding "forward":
        if(input_right == true) {
            action_state     = ACTION_DEFAULT;
            input_lock_alarm = 10;
        } else if(input_left == true) {
            if(x_speed <= 0) {
                x_speed             = -0.5;
                action_state        =  ACTION_DEFAULT;
                animation_direction = -1;
            }
        }
    }
    
    // Create skid dust:
    if(skid_dust_alarm > 0) skid_dust_alarm -= 1;
    else {
        skid_dust_alarm = 3;
        dummy_effect_create(spr_skid_dust, 0.3, x, y + 13 * dsin(angle + 90), depth - 1);
    }
    
    // Cancel skid:
    if(ground == false || (angle_relative >= 25 && angle_relative <= 315) || sign(x_speed) == 0) action_state = ACTION_DEFAULT;
}

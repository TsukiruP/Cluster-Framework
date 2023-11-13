/// player_action_skid()
// Try to outrun this demon to get left in the dust.

// Trigger skid:
if(ground = true && action_state == ACTION_DEFAULT && input_lock_alarm <= 0) {
    if(angle_relative < 45 || angle_relative > 315) {
        if(((x_speed >= 4.5 && player_input[INP_LEFT, CHECK_HELD] == true) || (x_speed <= -4.5 && player_input[INP_RIGHT, CHECK_HELD] == true)) && sign(x_speed) == animation_direction){
            action_state = ACTION_SKID;

            // Play sound:
            sound_play("snd_skid");
        }
    }
}

// Skid:
if(action_state == ACTION_SKID) {
    var input_direction;

    // Input direction:
    input_direction = player_input[INP_RIGHT, CHECK_HELD] - player_input[INP_LEFT, CHECK_HELD];

    // Create skid dust:
    if(skid_dust_alarm > 0) skid_dust_alarm -= 1;
    else {
        skid_dust_alarm = 3;
        dummy_effect_create(spr_skid_dust, 0.3, x, y + 13 * dsin(angle + 90), depth - 1);
    }

    // Cancel skid:
    if(ground == false || (angle_relative >= 25 && angle_relative <= 315) || sign(x_speed) == 0 ||
        sign(x_speed) != animation_direction || input_direction = animation_direction || input_lock_alarm > 0) action_state = ACTION_DEFAULT;
}

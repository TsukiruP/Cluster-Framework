/// player_action_skid()
// Try to outrun this demon to get left in the dust.

if(ground = true && action_state == ACTION_DEFAULT && input_lock_alarm == 0) {
    if(angle_relative < 45 || angle_relative > 315) {
        // Trigger skid:
        if(((x_speed >= 4.5 && player_input[INP_LEFT, CHECK_HELD] == true) || (x_speed <= -4.5 && player_input[INP_RIGHT, CHECK_HELD] == true))) {
            action_state = ACTION_SKID;

            // Play animation:
            if(tag_hold_state == 3) animation_target = "tag_skid";
            else {
                if(abs(x_speed) >= x_top_speed) animation_target = "skid_fast";
                else animation_target = "skid";
            }

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

    // Skid turn:
    if(tag_hold_state != 3) {
        if(sign(x_speed) != -input_direction && animation_current != "skid_turn") {
            if(input_direction != 0 && animation_direction != input_direction) {
                x_speed = 0;

                // Play animation:
                animation_target     = "skid_turn";
                animation_direction *= -1;
            } else action_state = ACTION_DEFAULT;
        }
    }

    // Create skid dust:
    if(skid_dust_alarm > 0) skid_dust_alarm -= 1;
    else {
        skid_dust_alarm = 3;
        dummy_effect_create(spr_skid_dust, 0.3, x, y + 13 * dsin(angle + 90), depth - 1);
    }

    // Cancel skid:
    if(ground == false || (angle_relative >= 25 && angle_relative <= 315) || (input_direction == 0 && animation_current != "skid_turn") || //(sign(x_speed) == input_direction && tag_hold_state == 3) ||
        (animation_current == "skid_turn" && animation_finished == true) || input_lock_alarm > 0) action_state = ACTION_DEFAULT;
}

// Turn:
if(ground == true && animation_finished == true) {
    if(animation_current == "turn") animation_target = "stand";
    if(animation_current == "tag_turn") animation_target = "tag_stand";
}

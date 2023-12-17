/// player_action_skid()
// Try to outrun this demon to get left in the dust.

var skid_classic;

// Classic skid:
skid_classic = (global.gameplay_skid == false || character_data == CHAR_CLASSIC);

// Trigger skid:
if(ground = true && action_state == ACTION_DEFAULT && input_lock_alarm == 0) {
    if(skid_classic == false || (skid_classic == true && (angle_relative < 45 || angle_relative > 315))) {
        // Trigger skid:
        if(abs(x_speed) >= 4.5 && sign(x_speed) == -input_direction) {
            action_state = ACTION_SKID;

            // Play animation:
            if(abs(x_speed) >= x_top_speed && tag_animations == false) animation_target = "skid_fast";
            else animation_target = "skid";

            if(skid_classic == true) animation_direction = sign(x_speed);

            // Play sound:
            sound_play_single("snd_skid");
        }
    }
}

// Skid:
if(action_state == ACTION_SKID) {
    // Skid turn:
    if(global.gameplay_turn == true && character_data != CHAR_CLASSIC && tag_animations == false) {
        if(input_direction != 0 && sign(x_speed) != -input_direction && animation_current != "skid_turn" && animation_direction != input_direction) {
            x_speed = 0;

            // Play animation:
            animation_target     = "skid_turn";
            animation_direction *= -1;
        }
    }

    // Create skid dust:
    if(x_speed != 0) {
        if(skid_dust_alarm > 0) skid_dust_alarm -= 1;
        else {
            skid_dust_alarm = 3;
            dummy_effect_create(spr_skid_dust, 0.3, x, y + 13 * dsin(angle + 90), depth - 1);
        }
    }

    // Cancel skid:
    if(ground == false || (angle_relative >= 25 && angle_relative <= 315) || (sign(x_speed) == input_direction) ||
    (((skid_classic == false && x_speed != 0 && sign(x_speed) != -input_direction) || (skid_classic == true && sign(x_speed) == input_direction)) && animation_current != "skid_turn") ||
    (animation_current == "skid_turn" && animation_finished == true) || input_lock_alarm > 0) action_state = ACTION_DEFAULT;
}

// Turn:
if(ground == true && animation_finished == true && animation_current == "turn") animation_target = "stand";

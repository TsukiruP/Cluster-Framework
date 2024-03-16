/// player_action_skid()
// Try to outrun this demon to get left in the dust.

var skid_classic;

// Classic skid:
skid_classic = (global.gameplay_skid == false || character_data == CHAR_CLASSIC);

// Trigger skid:
if (ground = true && action_state == ACTION_DEFAULT && input_lock_alarm == 0) {
    if (skid_classic == false || (skid_classic == true && (ground_angle < 45 || ground_angle > 315))) {
        // Trigger skid:
        if (abs(g_speed) >= 4.5 && sign(g_speed) == -input_direction) {
            action_state = ACTION_SKID;

            // Play animation:
            if (abs(g_speed) >= x_top_speed && tag_animations == false) player_set_animation("skid_fast");
            else player_set_animation("skid");

            if (skid_classic == true) animation_direction = sign(g_speed);

            // Play sound:
            sound_play_single("snd_skid");
        }
    }
}

// Skid:
if (action_state == ACTION_SKID) {
    // Skid turn:
    if (global.gameplay_turn == true && character_data != CHAR_CLASSIC && tag_animations == false) {
        if (input_direction != 0 && sign(g_speed) != -input_direction && animation_current != "skid_turn" && animation_direction != input_direction) {
            g_speed = 0;

            // Play animation:
            player_set_animation("skid_turn");
        }
    }

    // Create skid dust:
    if (g_speed != 0) {
        if (skid_dust_alarm > 0) skid_dust_alarm -= 1;
        else {
            skid_dust_alarm = 3;
            //dummy_effect_create(spr_skid_dust, 0.3, x, y + main_height * dsin(ground_angle + 90), depth - 1);
        }
    }

    // Cancel skid:
    if (ground == false || (ground_angle >= 25 && ground_angle <= 315) || (sign(g_speed) == input_direction) ||
        (((skid_classic == false && g_speed != 0 && sign(g_speed) != -input_direction) || (skid_classic == true && sign(g_speed) == input_direction)) && animation_current != "skid_turn") ||
        (animation_current == "skid_turn" && animation_finished == true) || input_lock_alarm > 0) action_state = ACTION_DEFAULT;
}

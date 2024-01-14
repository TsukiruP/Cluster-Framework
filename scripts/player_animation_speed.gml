/// player_animation_speed()
// Sets the animation speed.

// Wait speed:
if (character_data == CHAR_SONIC) {
    if (animation_current == "wait_partner") {
        if (floor(animation_current_frame) == animation_end_frame) animation_speed = player_get_animation("wait_partner", 7) * 0.25;
        else animation_speed = player_get_animation("wait_partner", 7);
    }
}

// Running speed:
if (ground == true) {
    if (action_state == ACTION_PEEL_OUT) {
        animation_speed = 0.25 + (abs(peel_out_timer) * 0.01);
    } else {
        if (animation_current == "walk" || animation_current == "walk_fast" || animation_current == "jog" || animation_current == "jog_fast") {
            animation_speed = 0.20 + (abs(g_speed)/ 30);
        }

        if (animation_current == "run" || animation_current == "dash") {
            animation_speed = 0.25 + (abs(g_speed)/ 25);
        }
    }
}

// Flight & fall animation speed:
if (action_state == ACTION_JUMP && animation_current == "roll" ||
    animation_current == "spin_flight" || animation_current == "spin_fall" || animation_current == "spring_flight" || animation_current == "spring_fall" ||
    animation_current == "leap_flight" || animation_current == "leap_fall" || animation_current == "fly_cancel") {
    animation_rendering_speed = 0.25 * max(1 + abs(g_speed) / 25 + abs(y_speed) / 25, 1);
    animation_speed           = animation_rendering_speed;
}

// Roll speed:
if (action_state == ACTION_ROLL) {
    if (ground == true) {
        animation_speed            = 0.25 + (abs(g_speed) / 12);
        aniimation_rendering_speed = animation_speed;

        miles_tails_speed          = 0.14 + (abs(g_speed) / 25);
    } else {
        aniimation_rendering_speed = animation_speed;
    }
}

// Drop Dash:
if (drop_dash_state == 2) {
    animation_speed            = 0.25 + ((drop_dash_speed + (abs(x_speed) / 4)) / 12);
    aniimation_rendering_speed = animation_speed;
}

/// player_action_jump()
// A jump to the sky turns to a rider kick.

// Varying jump:
if (y_speed < jump_release && action_state == ACTION_JUMP && jump_complete == false && player_input[INP_JUMP, CHECK_HELD] == false) {
    y_speed = jump_release;
}

// Jump!:
if ((ground == true || (action_state == ACTION_CARRY && player_input[INP_DOWN, CHECK_HELD] == true)) && player_input[INP_JUMP, CHECK_PRESSED] == true) {
    // Ignore some ground based actions:
    if (action_state != ACTION_CROUCH && action_state != ACTION_SPIN_DASH && action_state != ACTION_PEEL_OUT && tunnel_lock == false) {

        y_speed      = -(dsin(ground_angle) * x_speed) - (dcos(ground_angle) * -jump_force);
        x_speed      =  (dcos(ground_angle) * x_speed) - (dsin(ground_angle) * -jump_force);
        ground       =  false;
        action_state =  ACTION_JUMP;

        // Create water splash:
        if (instance_exists(obj_water_surface)) {
            if (floor(y) == obj_water_surface.y - 13) dummy_effect_create(spr_splash_jump, 0.13, x - 8 * animation_direction, obj_water_surface.y, depth - 1, animation_direction);
        }

        // Play sound:
        sound_play_single("snd_jump");
    }
}

if (action_state == ACTION_JUMP) {
    // Complete jump:
    if (y_speed > 0 && jump_complete == false) jump_complete = true;

    /*
    // Loop animation:
    if (character_data != CHAR_CLASSIC && animation_current == "roll" && animation_next != "spin_flight") {
        animation_next       = "spin_flight";
        animation_next_frame = player_get_animation("spin_flight", 5);
        animation_loop_count = 0;
    }
    */

    // Reset upon landing:
    if (ground == true) action_state = ACTION_DEFAULT;
}


// Variable clean up:
if (ground == true || action_state == ACTION_CARRY) {
    if (jump_complete != false) jump_complete = false;
    if (roll_rebounce != false) roll_rebounce = false;
    if (score_multiplier != 0) score_multiplier = 0;
}

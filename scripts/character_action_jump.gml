/// character_action_jump()
// A jump to the sky turns to a rider kick.

// Varying jump:
if(y_speed < jump_release && action_state == ACTION_JUMP && jump_complete == false && input_jump == false) {
    y_speed = jump_release;
}

// Jump!:
if((ground == true || (action_state == ACTION_CARRY && input_down == true)) && !character_collision_top(x, y - 6, angle, mask_big) && input_jump_pressed == true) {
    // Ignore some ground based actions:
    if(action_state != ACTION_CROUCH && action_state != ACTION_SPIN_DASH && action_state != ACTION_PEEL_OUT && tunnel_lock == false) {
        if(terrain_angle_change == false) character_set_angle(gravity_angle);

        x_speed      =  (dcos(angle_relative) * ground_speed) - (dsin(angle_relative) * -jump_force);
        y_speed      = -(dsin(angle_relative) * ground_speed) - (dcos(angle_relative) * -jump_force);
        ground       =  false;
        action_state =  ACTION_JUMP;

        character_set_angle(gravity_angle);

        // Create water splash:
        if(instance_exists(obj_water_surface)) {
            if(floor(y) == obj_water_surface.y - 13) dummy_effect_create(spr_splash_jump, 0.13, x - 8 * animation_direction, obj_water_surface.y, depth - 1, animation_direction);
        }

        // Play sound:
        sound_play_single("snd_jump");
    }
}

if(action_state == ACTION_JUMP) {
    // Complete jump:
    if(y_speed > 0 && jump_complete == false) jump_complete = true;

    if(character_data != CHAR_CLASSIC && animation_current == "roll" && animation_next != "spin_flight") {
        animation_next       = "spin_flight";
        animation_next_frame = 2;
        animation_loop_count = 0;
    }

    if(animation_current == "spin_flight" && y_speed >= 0) animation_next = "spin_fall";
}


// Variable clean up:
if(ground == true || action_state == ACTION_CARRY) {
    jump_complete = false;
}

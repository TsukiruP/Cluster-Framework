/// player_animation_core()
// Core of the animation system.

if (timeline_index != player_get_animation(animation_target)) {
    // Store previous animation:
    animation_previous = animation_current;

    // Update current animation:
    animation_current = animation_target;
    timeline_set(player_get_animation(animation_target));

    animation_finished = false;
}

/*
// Load target animation::
if (animation_current != animation_target) {
    // Store the previous animaiton:
    animation_previous = animation_current;

    // Update current animation:
    animation_current = animation_target;
    player_get_animation();

    // Start from first frame:
    animation_current_frame = animation_start_frame;

    // Clean up finished variable:
    animation_finished = false;
}

// Play animation
if (animation_finished == false) {
    // Target frame:
    if (sign(animation_speed) == -1) animation_target_frame = animation_start_frame;
    else animation_target_frame = animation_end_frame;

    // Update current frame:
    animation_current_frame += animation_speed;

    // Handle last frame:
    if (abs(floor(animation_current_frame)) > animation_target_frame && sign(animation_current_frame) == sign(animation_speed)) {
        // Loop the animation if called for:
        if (animation_loop_count != 0) {
            animation_current_frame = animation_loop_frame;

            if (animation_loop_count != -1) animation_loop_count -= 1;
        } else {
            // Set to last frame:
            animation_current_frame = animation_target_frame;

            // Go into next animation, if it's been given:
            if (animation_next != "") {
                animation_target = animation_next;

                if (animation_next_frame != 0) {
                    animation_current       = animation_target;
                    animation_current_frame = animation_next_frame;

                    // Get animation data:
                    player_get_animation();

                    // Set flags:
                    animation_finished = false;
                }
            } else {
                animation_finished = true;
            }
        }
    }
}

miles_tails_frame += miles_tails_speed;
if (floor(miles_tails_frame) > sprite_get_number(spr_miles_tails)) miles_tails_frame = 0;

/// character_animation_core()
// Core of the animation system.

// Load target animation::
if(animation_current != animation_target) {
    // Store the previous animaiton:
    animation_previous = animation_current;

    // Update current animation:
    animation_current = animation_target;
    character_get_animation();

    // Start from first frame:
    animation_current_frame = animation_start_frame;

    // Clean up finished variable:
    animation_finished = false;
}

// Play animation
if(animation_finished == false) {
    // Update current frame:
    animation_current_frame += animation_speed;

    // Handle last frame:
    if(floor(animation_current_frame) > animation_end_frame) {
        // Loop the animation if called for:
        if(animation_loop_count != 0) {
            animation_current_frame = animation_loop_frame;

            if(animation_loop_count != -1) animation_loop_count -= 1;
        } else {
            // Set to last frame:
            animation_current_frame = animation_end_frame;

            // Go into next animation, if it's been given:
            if(animation_next != "") {
                animation_target = animation_next;

                if(animation_next_frame != 0) {
                    animation_current       = animation_target;
                    animation_current_frame = animation_next_frame;

                    // Get animation data:
                    character_get_animation();

                    // Set flags:
                    animation_finished = false;
                }
            } else animation_finished = true;
        }
    }
}

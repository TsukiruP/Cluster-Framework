/// character_animation_core()
// Core of the animation system.

// Reset changed flag:
animation_changed = false;

// Check if the animation has changed:
if(animation_current != animation_previous) {
    animation_previous = animation_current;

    // Get animation data:
    character_get_animation();

    // Start from the first franme:
    animation_current_frame = animation_start_frame;

    // Set flags:
    animation_changed  = true;
    animation_finished = false;
}

// Play the animation if not finished:
if(animation_finished == false) {
    // Update animation frame:
    animation_current_frame += animation_speed;

    // Check if we're on the last frame:
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
                animation_current = animation_next;

                if(animation_next_frame != 0) {
                    animation_previous      = animation_current;
                    animation_current_frame = animation_next_frame;

                    // Get animation data:
                    character_get_animation();

                    // Set flags:
                    animation_changed  = true;
                    animation_finished = false;
                }
            } else animation_finished = true;
        }
    }
}

// Miles' tails:
if(miles_tails_sprite != noone) miles_tailes_frame += miles_tails_speed;

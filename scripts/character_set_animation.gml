/// character_set_animation(animation, sprite, start frame, end frame, loop frame, loop count, speed, [next], [next frame], [flag frame])

if(animation_current == argument[0]) {
    animation_sprite      = argument[1];
    animation_start_frame = argument[2];
    animation_end_frame   = argument[3];
    animation_loop_frame  = argument[4];
    animation_loop_count  = argument[5];
    animation_speed       = argument[6];

    // Set animation next:
    if(argument_count >= 8) {
        animation_next       = argument[7];

        // Set next frame:
        if(argument_count >= 9) animation_next_frame = argument[8];
        else animation_next_frame = 0;
    } else {
        animation_next       = "";
        animation_next_frame = 0;
    }

    if(argument_count >= 10) animation_flag_frame  = argument[9];
}

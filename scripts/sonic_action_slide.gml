/// sonic_action_slide()

if (ground == true && action_state == ACTION_DEFAULT && player_input[INP_SPECIAL, CHECK_HELD]) {
    action_state = ACTION_SLIDE;
    animation_target = "slide";
    g_speed = 5 * animation_direction;
}

if (action_state == ACTION_SLIDE) {
    hitbox_width    = 13;
    hitbox_height   = 12;
    hitbox_offset_x = 9;
    hitbox_offset_y = 4;


    if(g_speed == 0) action_state = ACTION_DEFAULT;
}

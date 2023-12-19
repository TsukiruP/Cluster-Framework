/// player_animations()
// Replaces a set of animations with their tag varients.

if(tag_animations == false) {
    switch(character_data) {
        default:
            // Default:
            player_add_animation(CHAR_SONIC, "stand",          spr_sonic_stand_tag,      0,  3,  0, -1, 0.20);
            player_add_animation(CHAR_SONIC, "turn",           spr_sonic_turn_tag,       0,  2,  0,  0, 0.40);
            player_add_animation(CHAR_SONIC, "walk",           spr_sonic_walk_tag,       0,  7,  0, -1, 0.25);
            player_add_animation(CHAR_SONIC, "walk_fast",      spr_sonic_walk_fast_tag,  0,  7,  0, -1, 0.25);
            player_add_animation(CHAR_SONIC, "jog",            spr_sonic_jog_tag,        0,  7,  0, -1, 0.25);

            // Look:
            player_add_animation(CHAR_SONIC, "look",           spr_sonic_look_tag,       0,  2,  0,  0, 0.20, "stand", 0, 1);

            // Crouch:
            player_add_animation(CHAR_SONIC, "crouch",         spr_sonic_crouch_tag,     0,  2,  0,  0, 0.20, "stand", 0, 1);

            // Skid:
            player_add_animation(CHAR_SONIC, "skid",           spr_sonic_skid_tag,       0,  2,  1, -1, 0.35);

            // Spring:
            player_add_animation(CHAR_SONIC, "spring_flight",  spr_sonic_spring_tag,     0,  2,  0, -1, 0.20);
            player_add_animation(CHAR_SONIC, "spring_fall",    spr_sonic_spring_tag,     3, 11,  9, -1, 0.20);

    }

    // Update animation:
    player_get_animation();
    tag_animations = true;
} else {
    switch(character_data) {
        default:
            sonic_add_animations();
    }

    // Update animation:
    player_get_animation();
    tag_animations = false;
}

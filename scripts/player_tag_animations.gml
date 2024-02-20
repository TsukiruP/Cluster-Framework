/// player_tag_animations()
// Replaces a set of animations with their tag varients.

/* Replace animations:
if (tag_animations == false) {
    switch (character_data) {
        case CHAR_MILES:
            // Default:
            player_add_animation(CHAR_MILES, "stand",          spr_miles_stand_tag,      0,  3,  0, -1, 0.20);
            player_add_animation(CHAR_MILES, "turn",           spr_miles_turn_tag,       0,  2,  0,  0, 0.50);
            player_add_animation(CHAR_MILES, "walk",           spr_miles_walk_tag,       0,  7,  0, -1, 0.25);
            player_add_animation(CHAR_MILES, "walk_fast",      spr_miles_walk_fast_tag,  0,  7,  0, -1, 0.25);
            player_add_animation(CHAR_MILES, "jog",            spr_miles_jog_tag,        0,  7,  0, -1, 0.25);

            // Look:
            player_add_animation(CHAR_MILES, "look",           spr_miles_look_tag,       0, 10,  3, -1, 0.20, "stand", 0, 2);

            // Crouch:
            player_add_animation(CHAR_MILES, "crouch",         spr_miles_crouch_tag,     0, 18,  3, -1, 0.20, "stand", 0, 3);

            // Skid:
            player_add_animation(CHAR_MILES, "skid",           spr_miles_skid_tag,       0,  2,  1, -1, 0.35);

            // Spring:
            player_add_animation(CHAR_MILES, "spring_flight",  spr_miles_spring_tag,     0,  2,  0, -1, 0.20);
            player_add_animation(CHAR_MILES, "spring_fall",    spr_miles_spring_tag,     3, 11,  9, -1, 0.20);
            break;

        default:
            // Default:
            player_add_animation(CHAR_SONIC, "stand",          spr_sonic_stand_tag,      0,  3,  0, -1, 0.20);
            player_add_animation(CHAR_SONIC, "turn",           spr_sonic_turn_tag,       0,  2,  0,  0, 0.50);
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
}

// Reset animations:
else {
    switch (character_data) {
        case CHAR_MILES:
            miles_add_animations();
            break;

        default:
            sonic_add_animations();
    }

    // Update animation:
    player_get_animation();
    tag_animations = false;
}

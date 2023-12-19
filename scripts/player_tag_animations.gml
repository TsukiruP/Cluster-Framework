/// player_animations()
// Replaces a set of animations with their tag varients.

if(tag_animations == false) {
    switch(character_data) {
        default:
            // Default:
            player_replace_animation("stand",         spr_sonic_stand_tag,      0,  3,  0, -1, 0.20);
            player_replace_animation("turn",          spr_sonic_turn_tag,       0,  2,  0,  0, 0.40);
            player_replace_animation("walk",          spr_sonic_walk_tag,       0,  7,  0, -1, 0.25);
            player_replace_animation("walk_fast",     spr_sonic_walk_fast_tag,  0,  7,  0, -1, 0.25);
            player_replace_animation("jog",           spr_sonic_jog_tag,        0,  7,  0, -1, 0.25);

            // Look:
            player_replace_animation("look",          spr_sonic_look_tag,       0,  2,  0,  0, 0.20);
            player_replace_animation("look_end",      spr_sonic_look_tag,       3,  4,  0,  0, 0.20, "stand");

            // Crouch:
            player_replace_animation("crouch",        spr_sonic_crouch_tag,     0,  2,  0,  0, 0.20);
            player_replace_animation("crouch_end",    spr_sonic_crouch_tag,     3,  4,  0,  0, 0.20, "stand");

            // Skid:
            player_replace_animation("skid",          spr_sonic_skid_tag,       0,  2,  1, -1, 0.35);

            // Spring:
            player_replace_animation("spring_flight", spr_sonic_spring_tag,     0,  2,  0, -1, 0.20);
            player_replace_animation("spring_fall",   spr_sonic_spring_tag,     3, 11,  9, -1, 0.20);

    }

    // Update animation:
    player_get_animation();
    tag_animations = true;
} else {
    switch(character_data) {
        default:
            // Default:
            player_replace_animation("stand",         spr_sonic_stand,          0, 34,  0, -1, 0.20);
            player_replace_animation("turn",          spr_sonic_turn,           0,  1,  0,  0, 0.50);
            player_replace_animation("walk",          spr_sonic_walk,           0,  7,  0, -1, 0.25);
            player_replace_animation("walk_fast",     spr_sonic_walk_fast,      0,  7,  0, -1, 0.25);
            player_replace_animation("jog",           spr_sonic_jog,            0,  7,  0, -1, 0.25);

            // Look:
            player_replace_animation("look",          spr_sonic_look,           0,  5,  2, -1, 0.20);
            player_replace_animation("look_end",      spr_sonic_look,           6,  7,  0,  0, 0.20, "stand");

            // Crouch:
            player_replace_animation("crouch",        spr_sonic_crouch,         0,  3,  0,  0, 0.20);
            player_replace_animation("crouch_end",    spr_sonic_crouch,         4,  5,  0,  0, 0.20, "stand");

            // Skid:
            player_replace_animation("skid",          spr_sonic_skid,           0,  2,  1, -1, 0.35);

            // Spring:
            player_replace_animation("spring_flight", spr_sonic_spring,         0,  3,  1, -1, 0.20);
            player_replace_animation("spring_fall",   spr_sonic_spring,         4, 12, 10, -1, 0.20);

    }

    // Update animation:
    player_get_animation();
    tag_animations = false;
}

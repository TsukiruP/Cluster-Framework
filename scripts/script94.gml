
// Default:
character_add_animation(CHAR_SONIC,    "stand",          spr_sonic_stand,            0,  34,  0, -1, 0.20);

// Wait:
character_add_animation(CHAR_SONIC,    "wait_short",     spr_sonic_wait_short,       0, 22,  0,  0, 0.18, "stand");
character_add_animation(CHAR_SONIC,    "wait_long",      spr_sonic_wait_long,        0, 21, 18, -1, 0.10);

character_add_animation(CHAR_SONIC,    "walk",           spr_sonic_walk,             0,  7,  0, -1, 0.25);
character_add_animation(CHAR_SONIC,    "walk_fast",      spr_sonic_walk_fast,        0,  7,  0, -1, 0.25);
character_add_animation(CHAR_SONIC,    "jog",            spr_sonic_jog,              0,  7,  0, -1, 0.25);
character_add_animation(CHAR_SONIC,    "jog_fast",       spr_sonic_jog_fast,         0,  7,  0, -1, 0.25);
character_add_animation(CHAR_SONIC,    "run",            spr_sonic_run,              0,  7,  0, -1, 0.25);
character_add_animation(CHAR_SONIC,    "dash",           spr_sonic_dash,             0,  3,  0, -1, 0.25);

// Tag default:
character_add_animation(CHAR_SONIC,    "tag_stand",      spr_sonic_tag_stand,        0,  3,  0, -1, 0.20);
character_add_animation(CHAR_SONIC,    "tag_walk",       spr_sonic_tag_walk,         0,  7,  0, -1, 0.25);
character_add_animation(CHAR_SONIC,    "tag_walk_fast",  spr_sonic_tag_walk_fast,    0,  7,  0, -1, 0.25);
character_add_animation(CHAR_SONIC,    "tag_jog",        spr_sonic_tag_jog,          0,  7,  0, -1, 0.25);

// Spin flight/fall:
character_add_animation(CHAR_SONIC,    "spin_flight",    spr_sonic_spin_flight,      0,  9,  2, -1, 0.30, "spin_fall");
character_add_animation(CHAR_SONIC,    "spin_fall",      spr_sonic_spin_fall,        0,  3,  1, -1, 0.30);

// Look:
character_add_animation(CHAR_SONIC,    "look",           spr_sonic_look,             0,  5,  2, -1, 0.20);
character_add_animation(CHAR_SONIC,    "look_end",       spr_sonic_look,             6,  7,  0,  0, 0.20, "stand");

// Tag look:
character_add_animation(CHAR_SONIC,    "tag_look",       spr_sonic_tag_look,         0,  2,  0,  0, 0.20);
character_add_animation(CHAR_SONIC,    "tag_look_end",   spr_sonic_tag_look,         3,  4,  0,  0, 0.20, "tag_stand");

// Crouch:
character_add_animation(CHAR_SONIC,    "crouch",         spr_sonic_crouch,           0,  3,  0,  0, 0.20);
character_add_animation(CHAR_SONIC,    "crouch_end",     spr_sonic_crouch,           4,  5,  0,  0, 0.20, "stand");

// Tag crouch:
character_add_animation(CHAR_SONIC,    "tag_crouch",     spr_sonic_tag_crouch,       0,  2,  0,  0, 0.20);
character_add_animation(CHAR_SONIC,    "tag_crouch_end", spr_sonic_tag_crouch,       3,  4,  0,  0, 0.20, "tag_stand");

// Spin dash:
character_add_animation(CHAR_SONIC,    "spin_dash",      spr_sonic_spin_dash,        0,  3,  0, -1, 0.30);
character_add_animation(CHAR_SONIC,    "super_spin",     spr_sonic_super_spin,       0,  3,  0,  0, 0.30);

// Roll:
character_add_animation(CHAR_SONIC,    "roll",           spr_sonic_roll,             0,  3,  0, -1, 0.30);

// Skid:
character_add_animation(CHAR_SONIC,    "skid",           spr_sonic_skid,             0,  2,  1, -1, 0.35);
character_add_animation(CHAR_SONIC,    "tag_skid",       spr_sonic_tag_skid,         0,  2,  1, -1, 0.35);

// Land:
character_add_animation(CHAR_SONIC,    "land",           spr_sonic_land,             0,  2,  0,  0, 0.20, "stand");

// Hurt:
character_add_animation(CHAR_SONIC,    "hurt",           spr_sonic_hurt,             0,  4,  0,  0, 0.20);

// Death:
character_add_animation(CHAR_SONIC,    "death",          spr_sonic_death,            0,  5,  4, -1, 0.20);

// Ready:
character_add_animation(CHAR_SONIC,    "ready",          spr_sonic_ready,            0, 36,  0,  0, 0.18, "stand");

// Spring:
character_add_animation(CHAR_SONIC,    "spring_flight",  spr_sonic_spring,           0,  3,  1, -1, 0.20);
character_add_animation(CHAR_SONIC,    "spring_fall",    spr_sonic_spring,           4, 12, 10, -1, 0.20);

// Tag jump:
character_add_animation(CHAR_SONIC,    "tag_flight",     spr_sonic_tag_jump,         0,  2,  0, -1, 0.20);
character_add_animation(CHAR_SONIC,    "tag_fall",       spr_sonic_tag_jump,         3, 11,  9, -1, 0.20);

// Breathe:
character_add_animation(CHAR_SONIC,    "breathe",        spr_sonic_breathe,          0,  1,  0,  0, 0.10);

switch(character_data) {
    // Sonic
    case CHAR_SONIC:
        // Default:
        character_add_animation(CHAR_SONIC,    "stand",          spr_sonic_stand,            0,  34,  0, -1, 0.20);

        // Wait:
        character_add_animation(CHAR_SONIC,    "wait_short",     spr_sonic_wait_short,       0, 22,  0,  0, 0.18, "stand");
        character_add_animation(CHAR_SONIC,    "wait_long",      spr_sonic_wait_long,        0, 21, 18, -1, 0.10);

        character_add_animation(CHAR_SONIC,    "walk",           spr_sonic_walk,             0,  7,  0, -1, 0.25);
        character_add_animation(CHAR_SONIC,    "walk_fast",      spr_sonic_walk_fast,        0,  7,  0, -1, 0.25);
        character_add_animation(CHAR_SONIC,    "jog",            spr_sonic_jog,              0,  7,  0, -1, 0.25);
        character_add_animation(CHAR_SONIC,    "jog_fast",       spr_sonic_jog_fast,         0,  7,  0, -1, 0.25);
        character_add_animation(CHAR_SONIC,    "run",            spr_sonic_run,              0,  7,  0, -1, 0.25);
        character_add_animation(CHAR_SONIC,    "dash",           spr_sonic_dash,             0,  3,  0, -1, 0.25);

        // Tag default:
        character_add_animation(CHAR_SONIC,    "tag_stand",      spr_sonic_tag_stand,        0,  3,  0, -1, 0.20);
        character_add_animation(CHAR_SONIC,    "tag_walk",       spr_sonic_tag_walk,         0,  7,  0, -1, 0.25);
        character_add_animation(CHAR_SONIC,    "tag_walk_fast",  spr_sonic_tag_walk_fast,    0,  7,  0, -1, 0.25);
        character_add_animation(CHAR_SONIC,    "tag_jog",        spr_sonic_tag_jog,          0,  7,  0, -1, 0.25);

        // Spin flight/fall:
        character_add_animation(CHAR_SONIC,    "spin_flight",    spr_sonic_spin_flight,      0,  9,  2, -1, 0.30, "spin_fall");
        character_add_animation(CHAR_SONIC,    "spin_fall",      spr_sonic_spin_fall,        0,  3,  1, -1, 0.30);

        // Look:
        character_add_animation(CHAR_SONIC,    "look",           spr_sonic_look,             0,  5,  2, -1, 0.20);
        character_add_animation(CHAR_SONIC,    "look_end",       spr_sonic_look,             6,  7,  0,  0, 0.20, "stand");

        // Tag look:
        character_add_animation(CHAR_SONIC,    "tag_look",       spr_sonic_tag_look,         0,  2,  0,  0, 0.20);
        character_add_animation(CHAR_SONIC,    "tag_look_end",   spr_sonic_tag_look,         3,  4,  0,  0, 0.20, "tag_stand");

        // Crouch:
        character_add_animation(CHAR_SONIC,    "crouch",         spr_sonic_crouch,           0,  3,  0,  0, 0.20);
        character_add_animation(CHAR_SONIC,    "crouch_end",     spr_sonic_crouch,           4,  5,  0,  0, 0.20, "stand");

        // Tag crouch:
        character_add_animation(CHAR_SONIC,    "tag_crouch",     spr_sonic_tag_crouch,       0,  2,  0,  0, 0.20);
        character_add_animation(CHAR_SONIC,    "tag_crouch_end", spr_sonic_tag_crouch,       3,  4,  0,  0, 0.20, "tag_stand");

        // Spin dash:
        character_add_animation(CHAR_SONIC,    "spin_dash",      spr_sonic_spin_dash,        0,  3,  0, -1, 0.30);
        character_add_animation(CHAR_SONIC,    "super_spin",     spr_sonic_super_spin,       0,  3,  0,  0, 0.30);

        // Roll:
        character_add_animation(CHAR_SONIC,    "roll",           spr_sonic_roll,             0,  3,  0, -1, 0.30);

        // Skid:
        character_add_animation(CHAR_SONIC,    "skid",           spr_sonic_skid,             0,  2,  1, -1, 0.35);
        character_add_animation(CHAR_SONIC,    "tag_skid",       spr_sonic_tag_skid,         0,  2,  1, -1, 0.35);

        // Land:
        character_add_animation(CHAR_SONIC,    "land",           spr_sonic_land,             0,  2,  0,  0, 0.20, "stand");

        // Hurt:
        character_add_animation(CHAR_SONIC,    "hurt",           spr_sonic_hurt,             0,  4,  0,  0, 0.20);

        // Death:
        character_add_animation(CHAR_SONIC,    "death",          spr_sonic_death,            0,  5,  4, -1, 0.20);

        // Ready:
        character_add_animation(CHAR_SONIC,    "ready",          spr_sonic_ready,            0, 36,  0,  0, 0.18, "stand");

        // Spring:
        character_add_animation(CHAR_SONIC,    "spring_flight",  spr_sonic_spring,           0,  3,  1, -1, 0.20);
        character_add_animation(CHAR_SONIC,    "spring_fall",    spr_sonic_spring,           4, 12, 10, -1, 0.20);

        // Tag jump:
        character_add_animation(CHAR_SONIC,    "tag_flight",     spr_sonic_tag_jump,         0,  2,  0, -1, 0.20);
        character_add_animation(CHAR_SONIC,    "tag_fall",       spr_sonic_tag_jump,         3, 11,  9, -1, 0.20);

        // Breathe:
        character_add_animation(CHAR_SONIC,    "breathe",        spr_sonic_breathe,          0,  1,  0,  0, 0.10);
        break;

    // Miles:
    case CHAR_MILES:
        // Default:
        character_add_animation(CHAR_MILES,    "stand",          spr_miles_stand,            0, 15,  0, -1, 0.20);

        // Wait:
        character_add_animation(CHAR_MILES,    "wait_short",     spr_miles_wait_short,       0, 13,  0,  0, 0.15, "stand");
        character_add_animation(CHAR_MILES,    "wait_long",      spr_miles_wait_long,        0, 41, 11, -1, 0.13);

        character_add_animation(CHAR_MILES,    "walk",           spr_miles_walk,             0,  7,  0, -1, 0.25);
        character_add_animation(CHAR_MILES,    "walk_fast",      spr_miles_walk_fast,        0,  7,  0, -1, 0.25);
        character_add_animation(CHAR_MILES,    "jog",            spr_miles_jog,              0,  7,  0, -1, 0.25);
        character_add_animation(CHAR_MILES,    "jog_fast",       spr_miles_jog_fast,         0,  7,  0, -1, 0.25);
        character_add_animation(CHAR_MILES,    "run",            spr_miles_run,              0,  7,  0, -1, 0.25);

        // Tag default:
        character_add_animation(CHAR_MILES,    "tag_stand",      spr_miles_tag_stand,        0,  4,  0, -1, 0.20);
        character_add_animation(CHAR_MILES,    "tag_walk",       spr_miles_tag_walk,         0,  7,  0, -1, 0.25);
        character_add_animation(CHAR_MILES,    "tag_walk_fast",  spr_miles_tag_walk_fast,    0,  7,  0, -1, 0.25);
        character_add_animation(CHAR_MILES,    "tag_jog",        spr_miles_tag_jog,          0,  7,  0, -1, 0.25);

        // Spin flight/fall:
        character_add_animation(CHAR_MILES,    "spin_flight",    spr_miles_spin_flight,      0,  5,  2,  0, 0.30, "roll");
        character_add_animation(CHAR_MILES,    "spin_fall",      spr_miles_spin_fall,        0,  5,  3, -1, 0.30);

        // Look:
        character_add_animation(CHAR_MILES,    "look",           spr_miles_look,             0,  5,  2, -1, 0.20);
        character_add_animation(CHAR_MILES,    "look_end",       spr_miles_look,             6,  7,  0,  0, 0.20, "stand");

        // Tag look:
        character_add_animation(CHAR_MILES,    "tag_look",       spr_miles_tag_look,         0, 10,  3, -1, 0.20);
        character_add_animation(CHAR_MILES,    "tag_look_end",   spr_miles_tag_look,        11, 12,  0,  0, 0.20, "tag_stand");

        // Crouch:
        character_add_animation(CHAR_MILES,    "crouch",         spr_miles_crouch,           0,  9,  1, -1, 0.20);
        character_add_animation(CHAR_MILES,    "crouch_end",     spr_miles_crouch,          10, 11,  0,  0, 0.20, "stand");

        // Tag crouch:
        character_add_animation(CHAR_MILES,    "tag_crouch",     spr_miles_tag_crouch,       0, 10,  3, -1, 0.20);
        character_add_animation(CHAR_MILES,    "tag_crouch_end", spr_miles_tag_crouch,      11, 12,  0,  0, 0.20, "tag_stand");

        // Spin dash:
        character_add_animation(CHAR_MILES,    "spin_dash",      spr_miles_spin_dash,        0,  7,  0, -1, 0.30);

        // Roll:
        character_add_animation(CHAR_MILES,    "roll",           spr_miles_roll,             0,  3,  0, -1, 0.30);

        // Skid:
        character_add_animation(CHAR_MILES,    "skid",           spr_miles_skid,             0,  2,  1, -1, 0.35);
        character_add_animation(CHAR_MILES,    "tag_skid",       spr_miles_tag_skid,         0,  2,  1, -1, 0.35);

        // Land:
        character_add_animation(CHAR_MILES,    "land",           spr_miles_land,             0,  2,  0,  0, 0.20, "stand");

        // Hurt:
        character_add_animation(CHAR_MILES,    "hurt",           spr_miles_hurt,             0,  4,  0,  0, 0.20);

        // Death:
        character_add_animation(CHAR_MILES,    "death",          spr_miles_death,            0,  5,  4, -1, 0.20);

        // Ready:
        character_add_animation(CHAR_MILES,    "ready",          spr_miles_ready,            0, 28,  0,  0, 0.18, "stand");

        // Spring:
        character_add_animation(CHAR_MILES,    "spring_flight",  spr_miles_spring,           0,  2,  0, -1, 0.20);
        character_add_animation(CHAR_MILES,    "spring_fall",    spr_miles_spring,           3, 11,  9, -1, 0.20);

        // Tag jump:
        character_add_animation(CHAR_MILES,    "tag_flight",     spr_miles_tag_jump,         0,  2,  0, -1, 0.20);
        character_add_animation(CHAR_MILES,    "tag_fall",       spr_miles_tag_jump,         3, 11,  9, -1, 0.20);

        // Breathe:
        character_add_animation(CHAR_MILES,    "breathe",        spr_miles_breathe,          0,  1,  0,  0, 0.10);
        break;

    case CHAR_KNUCKLES:
        // Default:
        character_add_animation(CHAR_KNUCKLES, "stand",          spr_knuckles_stand,         0,  8,  0, -1, 0.20);

        // Wait:
        character_add_animation(CHAR_KNUCKLES, "wait_short",     spr_knuckles_wait_short,    0, 18,  0,  0, 0.18, "stand");
        character_add_animation(CHAR_KNUCKLES, "wait_long",      spr_knuckles_wait_long,     0, 15,  9, -1, 0.15);

        character_add_animation(CHAR_KNUCKLES, "walk",           spr_knuckles_walk,          0,  7,  0, -1, 0.25);
        character_add_animation(CHAR_KNUCKLES, "walk_fast",      spr_knuckles_walk_fast,     0,  7,  0, -1, 0.25);
        character_add_animation(CHAR_KNUCKLES, "jog",            spr_knuckles_jog,           0,  7,  0, -1, 0.25);
        character_add_animation(CHAR_KNUCKLES, "jog_fast",       spr_knuckles_jog_fast,      0,  7,  0, -1, 0.25);
        character_add_animation(CHAR_KNUCKLES, "run",            spr_knuckles_run,           0,  7,  0, -1, 0.25);

        // Tag default:
        character_add_animation(CHAR_KNUCKLES, "tag_stand",      spr_knuckles_tag_stand,     0,  4,  0, -1, 0.20);
        character_add_animation(CHAR_KNUCKLES, "tag_walk",       spr_knuckles_tag_walk,      0,  7,  0, -1, 0.25);
        character_add_animation(CHAR_KNUCKLES, "tag_walk_fast",  spr_knuckles_tag_walk_fast, 0,  7,  0, -1, 0.25);
        character_add_animation(CHAR_KNUCKLES, "tag_jog",        spr_knuckles_tag_jog,       0,  7,  0, -1, 0.25);

        // Spin flight/fall:
        character_add_animation(CHAR_KNUCKLES, "spin_flight",    spr_knuckles_spin_flight,   0,  7,  0, -1, 0.30);
        character_add_animation(CHAR_KNUCKLES, "spin_fall",      spr_knuckles_spin_fall,     0,  4,  2, -1, 0.30);

        // Look:
        character_add_animation(CHAR_KNUCKLES, "look",           spr_knuckles_look,          0,  2,  0,  0, 0.20);
        character_add_animation(CHAR_KNUCKLES, "look_end",       spr_knuckles_look,          3,  4,  0,  0, 0.20, "stand");

        // Tag look:
        character_add_animation(CHAR_KNUCKLES, "tag_look",       spr_knuckles_tag_look,      0,  2,  0,  0, 0.20);
        character_add_animation(CHAR_KNUCKLES, "tag_look_end",   spr_knuckles_tag_look,      3,  4,  0,  0, 0.20, "tag_stand");

        // Crouch:
        character_add_animation(CHAR_KNUCKLES, "crouch",         spr_knuckles_crouch,        0,  3,  0,  0, 0.20);
        character_add_animation(CHAR_KNUCKLES, "crouch_end",     spr_knuckles_crouch,        4,  6,  0,  0, 0.20, "stand");

        // Tag crouch:
        character_add_animation(CHAR_KNUCKLES, "tag_crouch",     spr_knuckles_tag_crouch,    0,  2,  0,  0, 0.20);
        character_add_animation(CHAR_KNUCKLES, "tag_crouch_end", spr_knuckles_tag_crouch,    3,  4,  0,  0, 0.20, "tag_stand");

        // Spin dash:
        character_add_animation(CHAR_KNUCKLES, "spin_dash",      spr_knuckles_spin_dash,     0,  3,  0, -1, 0.30);
        character_add_animation(CHAR_KNUCKLES, "super_spin",     spr_knuckles_super_spin,    0,  3,  0,  0, 0.30);

        // Roll:
        character_add_animation(CHAR_KNUCKLES, "roll",           spr_knuckles_roll,          0,  3,  0, -1, 0.30);

        // Skid:
        character_add_animation(CHAR_KNUCKLES, "skid",           spr_knuckles_skid,          0,  2,  1, -1, 0.35);
        character_add_animation(CHAR_KNUCKLES, "tag_skid",       spr_knuckles_tag_skid,      0,  2,  1, -1, 0.35);

        // Land:
        character_add_animation(CHAR_KNUCKLES, "land",           spr_knuckles_land,          0,  2,  0,  0, 0.20, "stand");

        // Hurt:
        character_add_animation(CHAR_KNUCKLES, "hurt",           spr_knuckles_hurt,          0,  4,  0,  0, 0.20);

        // Death:
        character_add_animation(CHAR_KNUCKLES, "death",          spr_knuckles_death,         0,  5,  4, -1, 0.20);

        // Ready:
        character_add_animation(CHAR_KNUCKLES, "ready",          spr_knuckles_ready,         0, 30,  0,  0, 0.18, "stand");

        // Spring:
        character_add_animation(CHAR_KNUCKLES, "spring_flight",  spr_knuckles_spring,        0,  2,  0, -1, 0.20);
        character_add_animation(CHAR_KNUCKLES, "spring_fall",    spr_knuckles_spring,        3,  9,  7, -1, 0.20);

        // Tag jump:
        character_add_animation(CHAR_KNUCKLES, "tag_flight",     spr_knuckles_tag_jump,      0,  2,  0, -1, 0.20);
        character_add_animation(CHAR_KNUCKLES, "tag_fall",       spr_knuckles_tag_jump,      3, 11,  9, -1, 0.20);

        // Breathe:
        character_add_animation(CHAR_KNUCKLES, "breathe",        spr_knuckles_breathe,       0,  1,  0,  0, 0.10);
        break;

    // Classic:
    default:
        // Default:
        character_add_animation(CHAR_NONE,     "stand",          spr_classic_stand,          0,  0,  0,  0, 0.20);

        // Wait:
        character_add_animation(CHAR_NONE,     "wait_short",     spr_classic_stand,          1,  4,  1,  3, 0.15, "stand");
        character_add_animation(CHAR_NONE,     "wait_long",      spr_classic_stand,          5, 64,  5, -1, 0.15);

        character_add_animation(CHAR_NONE,     "jog",            spr_classic_jog,            0,  5,  0, -1, 0.25);
        character_add_animation(CHAR_NONE,     "run",            spr_classic_run,            0,  5,  0, -1, 0.25);

        // Look:
        character_add_animation(CHAR_NONE,     "look",           spr_classic_misc,           0,  0,  0, -1, 0.20);

        // Crouch:
        character_add_animation(CHAR_NONE,     "crouch",         spr_classic_misc,           1,  1,  1,  0, 0.20);

        // Spin dash:
        character_add_animation(CHAR_NONE,     "spin_dash",      spr_classic_spin_dash,      0,  3,  0, -1, 0.30);

        // Roll:
        character_add_animation(CHAR_NONE,     "roll",           spr_classic_roll,           0,  7,  0, -1, 0.30);

        // Skid:
        character_add_animation(CHAR_NONE,     "skid",           spr_classic_skid,           0,  1,  0, -1, 0.35);

        // Hurt:
        character_add_animation(CHAR_NONE,     "hurt",           spr_classic_misc,           2,  2,  2,  0, 0.20);

        // Death:
        character_add_animation(CHAR_NONE,     "death",          spr_classic_death,          0,  0,  0,  0, 0);
        character_add_animation(CHAR_NONE,     "drown",          spr_classic_death,          1,  1,  0,  0, 0);

        // Ready:
        character_add_animation(CHAR_NONE,     "ready",          spr_classic_stand,          5, 64,  0,  0, 0.15, "stand");

        // Spring:
        character_add_animation(CHAR_NONE,     "spring_flight",  spr_classic_misc,           4,  4,  4,  0, 0);
        character_add_animation(CHAR_NONE,     "spring_fall",    spr_classic_misc,           4,  4,  4,  0, 0);

        // Breathe:
        character_add_animation(CHAR_NONE,     "breathe",        spr_classic_misc,           0,  1,  0,  0, 0.10);
        break;
}

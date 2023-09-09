// miles_add_animations()

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

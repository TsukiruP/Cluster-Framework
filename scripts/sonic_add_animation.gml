/// sonic_add_animations()

// Default:
character_add_animation(CHAR_SONIC, "stand",          spr_sonic_stand,          0,  34,  0, -1, 0.20);

// Wait:
character_add_animation(CHAR_SONIC, "wait_short",     spr_sonic_wait_short,     0, 22,  0,  0, 0.18, "stand");
character_add_animation(CHAR_SONIC, "wait_long",      spr_sonic_wait_long,      0, 21, 18, -1, 0.10);

character_add_animation(CHAR_SONIC, "walk",           spr_sonic_walk,           0,  7,  0, -1, 0.25);
character_add_animation(CHAR_SONIC, "walk_fast",      spr_sonic_walk_fast,      0,  7,  0, -1, 0.25);
character_add_animation(CHAR_SONIC, "jog",            spr_sonic_jog,            0,  7,  0, -1, 0.25);
character_add_animation(CHAR_SONIC, "jog_fast",       spr_sonic_jog_fast,       0,  7,  0, -1, 0.25);
character_add_animation(CHAR_SONIC, "run",            spr_sonic_run,            0,  7,  0, -1, 0.25);
character_add_animation(CHAR_SONIC, "dash",           spr_sonic_dash,           0,  3,  0, -1, 0.25);

// Tag default:
character_add_animation(CHAR_SONIC, "tag_stand",      spr_sonic_tag_stand,      0,  3,  0, -1, 0.20);
character_add_animation(CHAR_SONIC, "tag_walk",       spr_sonic_tag_walk,       0,  7,  0, -1, 0.25);
character_add_animation(CHAR_SONIC, "tag_walk_fast",  spr_sonic_tag_walk_fast,  0,  7,  0, -1, 0.25);
character_add_animation(CHAR_SONIC, "tag_jog",        spr_sonic_tag_jog,        0,  7,  0, -1, 0.25);

// Spin flight/fall:
character_add_animation(CHAR_SONIC, "spin_flight",    spr_sonic_spin_flight,    0,  5,  2,  0, 0.30, "roll");
character_add_animation(CHAR_SONIC, "spin_fall",      spr_sonic_spin_fall,      0,  3,  1, -1, 0.30);

// Look:
character_add_animation(CHAR_SONIC, "look",           spr_sonic_look,           0,  5,  2, -1, 0.20);
character_add_animation(CHAR_SONIC, "look_end",       spr_sonic_look,           6,  7,  0,  0, 0.20, "stand");

// Tag look:
character_add_animation(CHAR_SONIC, "tag_look",       spr_sonic_tag_look,       0,  2,  0,  0, 0.20);
character_add_animation(CHAR_SONIC, "tag_look_end",   spr_sonic_tag_look,       3,  4,  0,  0, 0.20, "tag_stand");

// Crouch:
character_add_animation(CHAR_SONIC, "crouch",         spr_sonic_crouch,         0,  3,  0,  0, 0.20);
character_add_animation(CHAR_SONIC, "crouch_end",     spr_sonic_crouch,         4,  5,  0,  0, 0.20, "stand");

// Tag crouch:
character_add_animation(CHAR_SONIC, "tag_crouch",     spr_sonic_tag_crouch,     0,  2,  0,  0, 0.20);
character_add_animation(CHAR_SONIC, "tag_crouch_end", spr_sonic_tag_crouch,     3,  4,  0,  0, 0.20, "tag_stand");

// Spin dash:
character_add_animation(CHAR_SONIC, "spin_dash",      spr_sonic_spin_dash,      0,  3,  0, -1, 0.30);
character_add_animation(CHAR_SONIC, "super_spin",     spr_sonic_super_spin,     0,  3,  0,  0, 0.30);

// Roll:
character_add_animation(CHAR_SONIC, "roll",           spr_sonic_roll,           0,  3,  0, -1, 0.30);

// Skid:
character_add_animation(CHAR_SONIC, "skid",           spr_sonic_skid,           0,  2,  1, -1, 0.35);
character_add_animation(CHAR_SONIC, "tag_skid",       spr_sonic_tag_skid,       0,  2,  1, -1, 0.35);

// Land:
character_add_animation(CHAR_SONIC, "land",           spr_sonic_land,           0,  2,  0,  0, 0.20, "stand");

// Hurt:
character_add_animation(CHAR_SONIC, "hurt",           spr_sonic_hurt,           0,  4,  0,  0, 0.20);

// Death:
character_add_animation(CHAR_SONIC, "death",          spr_sonic_death,          0,  5,  4, -1, 0.20);

// Ready:
character_add_animation(CHAR_SONIC, "ready",          spr_sonic_ready,          0, 36,  0,  0, 0.18, "stand");

// Spring:
character_add_animation(CHAR_SONIC, "spring_flight",  spr_sonic_spring,         0,  3,  1, -1, 0.20);
character_add_animation(CHAR_SONIC, "spring_fall",    spr_sonic_spring,         4, 12, 10, -1, 0.20);

// Tag jump:
character_add_animation(CHAR_SONIC, "tag_flight",     spr_sonic_tag_jump,       0,  2,  0, -1, 0.20);
character_add_animation(CHAR_SONIC, "tag_fall",       spr_sonic_tag_jump,       3, 11,  9, -1, 0.20);

// Breathe:
character_add_animation(CHAR_SONIC, "breathe",        spr_sonic_breathe,        0,  1,  0,  0, 0.10);

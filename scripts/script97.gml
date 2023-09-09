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

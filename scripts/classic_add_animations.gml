// classic_add_animations()

// Default:
player_add_animation(CHAR_CLASSIC,     "stand",          spr_classic_stand,          0,  0,  0,  0, 0.20);

// Wait:
player_add_animation(CHAR_CLASSIC,     "wait_short",     spr_classic_stand,          1,  4,  1,  3, 0.15, "stand");
player_add_animation(CHAR_CLASSIC,     "wait_long",      spr_classic_stand,          5, 64,  5, -1, 0.15);

player_add_animation(CHAR_CLASSIC,     "jog",            spr_classic_jog,            0,  5,  0, -1, 0.25);
player_add_animation(CHAR_CLASSIC,     "run",            spr_classic_run,            0,  5,  0, -1, 0.25);

// Look:
player_add_animation(CHAR_CLASSIC,     "look",           spr_classic_misc,           0,  0,  0, -1, 0.20);

// Crouch:
player_add_animation(CHAR_CLASSIC,     "crouch",         spr_classic_misc,           1,  1,  1,  0, 0.20);

// Spin dash:
player_add_animation(CHAR_CLASSIC,     "spin_dash",      spr_classic_spin_dash,      0,  3,  0, -1, 0.30);

// Roll:
player_add_animation(CHAR_CLASSIC,     "roll",           spr_classic_roll,           0,  7,  0, -1, 0.30);

// Skid:
player_add_animation(CHAR_CLASSIC,     "skid",           spr_classic_skid,           0,  1,  0, -1, 0.35);

// Hurt:
player_add_animation(CHAR_CLASSIC,     "hurt",           spr_classic_misc,           2,  2,  2,  0, 0.20);

// Death:
player_add_animation(CHAR_CLASSIC,     "death",          spr_classic_death,          0,  0,  0,  0, 0);
player_add_animation(CHAR_CLASSIC,     "drown",          spr_classic_death,          1,  1,  0,  0, 0);

// Ready:
player_add_animation(CHAR_CLASSIC,     "ready",          spr_classic_stand,          5, 64,  0,  0, 0.15, "stand");

// Spring:
player_add_animation(CHAR_CLASSIC,     "spring_flight",  spr_classic_misc,           4,  4,  4,  0, 0);
player_add_animation(CHAR_CLASSIC,     "spring_fall",    spr_classic_misc,           4,  4,  4,  0, 0);

// Breathe:
player_add_animation(CHAR_CLASSIC,     "breathe",        spr_classic_misc,           5,  5,  5,  0, 0.10);

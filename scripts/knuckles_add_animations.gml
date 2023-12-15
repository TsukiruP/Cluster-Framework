// knuckles_add_animations()
/*
// Default:
player_add_animation(CHAR_KNUCKLES, "stand",          spr_knuckles_stand,         0,  8,  0, -1, 0.20);

// Wait:
player_add_animation(CHAR_KNUCKLES, "wait_short",     spr_knuckles_wait_short,    0, 18,  0,  0, 0.18, "stand");
player_add_animation(CHAR_KNUCKLES, "wait_long",      spr_knuckles_wait_long,     0, 15,  9, -1, 0.15);

player_add_animation(CHAR_KNUCKLES, "walk",           spr_knuckles_walk,          0,  7,  0, -1, 0.25);
player_add_animation(CHAR_KNUCKLES, "walk_fast",      spr_knuckles_walk_fast,     0,  7,  0, -1, 0.25);
player_add_animation(CHAR_KNUCKLES, "jog",            spr_knuckles_jog,           0,  7,  0, -1, 0.25);
player_add_animation(CHAR_KNUCKLES, "jog_fast",       spr_knuckles_jog_fast,      0,  7,  0, -1, 0.25);
player_add_animation(CHAR_KNUCKLES, "run",            spr_knuckles_run,           0,  7,  0, -1, 0.25);

// Tag default:
player_add_animation(CHAR_KNUCKLES, "tag_stand",      spr_knuckles_tag_stand,     0,  4,  0, -1, 0.20);
player_add_animation(CHAR_KNUCKLES, "tag_walk",       spr_knuckles_tag_walk,      0,  7,  0, -1, 0.25);
player_add_animation(CHAR_KNUCKLES, "tag_walk_fast",  spr_knuckles_tag_walk_fast, 0,  7,  0, -1, 0.25);
player_add_animation(CHAR_KNUCKLES, "tag_jog",        spr_knuckles_tag_jog,       0,  7,  0, -1, 0.25);

// Spin flight/fall:
player_add_animation(CHAR_KNUCKLES, "spin_flight",    spr_knuckles_spin_flight,   0,  7,  0, -1, 0.30);
player_add_animation(CHAR_KNUCKLES, "spin_fall",      spr_knuckles_spin_fall,     0,  4,  2, -1, 0.30);

// Look:
player_add_animation(CHAR_KNUCKLES, "look",           spr_knuckles_look,          0,  2,  0,  0, 0.20);
player_add_animation(CHAR_KNUCKLES, "look_end",       spr_knuckles_look,          3,  4,  0,  0, 0.20, "stand");

// Tag look:
player_add_animation(CHAR_KNUCKLES, "tag_look",       spr_knuckles_tag_look,      0,  2,  0,  0, 0.20);
player_add_animation(CHAR_KNUCKLES, "tag_look_end",   spr_knuckles_tag_look,      3,  4,  0,  0, 0.20, "tag_stand");

// Crouch:
player_add_animation(CHAR_KNUCKLES, "crouch",         spr_knuckles_crouch,        0,  3,  0,  0, 0.20);
player_add_animation(CHAR_KNUCKLES, "crouch_end",     spr_knuckles_crouch,        4,  6,  0,  0, 0.20, "stand");

// Tag crouch:
player_add_animation(CHAR_KNUCKLES, "tag_crouch",     spr_knuckles_tag_crouch,    0,  2,  0,  0, 0.20);
player_add_animation(CHAR_KNUCKLES, "tag_crouch_end", spr_knuckles_tag_crouch,    3,  4,  0,  0, 0.20, "tag_stand");

// Spin dash:
player_add_animation(CHAR_KNUCKLES, "spin_dash",      spr_knuckles_spin_dash,     0,  3,  0, -1, 0.30);
player_add_animation(CHAR_KNUCKLES, "super_spin",     spr_knuckles_super_spin,    0,  3,  0,  0, 0.30);

// Roll:
player_add_animation(CHAR_KNUCKLES, "roll",           spr_knuckles_roll,          0,  3,  0, -1, 0.30);

// Skid:
player_add_animation(CHAR_KNUCKLES, "skid",           spr_knuckles_skid,          0,  2,  1, -1, 0.35);
player_add_animation(CHAR_KNUCKLES, "tag_skid",       spr_knuckles_tag_skid,      0,  2,  1, -1, 0.35);

// Land:
player_add_animation(CHAR_KNUCKLES, "land",           spr_knuckles_land,          0,  2,  0,  0, 0.20, "stand");

// Hurt:
player_add_animation(CHAR_KNUCKLES, "hurt",           spr_knuckles_hurt,          0,  4,  0,  0, 0.20);

// Death:
player_add_animation(CHAR_KNUCKLES, "death",          spr_knuckles_death,         0,  5,  4, -1, 0.20);

// Ready:
player_add_animation(CHAR_KNUCKLES, "ready",          spr_knuckles_ready,         0, 30,  0,  0, 0.18, "stand");

// Spring:
player_add_animation(CHAR_KNUCKLES, "spring_flight",  spr_knuckles_spring,        0,  2,  0, -1, 0.20);
player_add_animation(CHAR_KNUCKLES, "spring_fall",    spr_knuckles_spring,        3,  9,  7, -1, 0.20);

// Tag jump:
player_add_animation(CHAR_KNUCKLES, "tag_flight",     spr_knuckles_tag_jump,      0,  2,  0, -1, 0.20);
player_add_animation(CHAR_KNUCKLES, "tag_fall",       spr_knuckles_tag_jump,      3, 11,  9, -1, 0.20);

// Breathe:
player_add_animation(CHAR_KNUCKLES, "breathe",        spr_knuckles_breathe,       0,  1,  0,  0, 0.10);

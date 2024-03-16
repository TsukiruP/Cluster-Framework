// miles_add_animations()
/*
// Default:
player_add_animation(CHAR_MILES,    "stand",          spr_miles_stand,          0, 15,  0, -1, 0.20);
player_add_animation(CHAR_MILES,    "turn",           spr_miles_turn,           0,  1,  0,  0, 0.50);
player_add_animation(CHAR_MILES,    "walk",           spr_miles_walk,           0,  7,  0, -1, 0.25);
player_add_animation(CHAR_MILES,    "walk_fast",      spr_miles_walk_fast,      0,  7,  0, -1, 0.25);
player_add_animation(CHAR_MILES,    "jog",            spr_miles_jog,            0,  7,  0, -1, 0.25);
player_add_animation(CHAR_MILES,    "jog_fast",       spr_miles_jog_fast,       0,  7,  0, -1, 0.25);
player_add_animation(CHAR_MILES,    "run",            spr_miles_run,            0,  7,  0, -1, 0.25);

// Wait:
player_add_animation(CHAR_MILES,    "wait_leader",    spr_miles_wait_leader,    0, 50, 11, -1, 0.13);
player_add_animation(CHAR_MILES,    "wait_partner",   spr_miles_wait_partner,   0, 61, 54, -1, 0.15);

// Ready:
player_add_animation(CHAR_MILES,    "ready",          spr_miles_ready,          0, 30,  0,  0, 0.18, "stand");

// Land:
player_add_animation(CHAR_MILES,    "land",           spr_miles_land,           0,  2,  0,  0, 0.20, "stand");

// Spin flight/fall:
player_add_animation(CHAR_MILES,    "spin_flight",    spr_miles_spin_flight,    0,  5,  2,  0, 0.30, "roll");
player_add_animation(CHAR_MILES,    "spin_fall",      spr_miles_spin_fall,      0,  5,  3, -1, 0.30);

// Look:
player_add_animation(CHAR_MILES,    "look",           spr_miles_look,           0,  5,  2, -1, 0.20, "", 0, 1);

// Crouch:
player_add_animation(CHAR_MILES,    "crouch",         spr_miles_crouch,         0, 17,  2, -1, 0.20, "", 0, 1);

// Spin dash:
player_add_animation(CHAR_MILES,    "spin_dash",      spr_miles_spin_dash,      0,  7,  0, -1, 0.30);

// Roll:
player_add_animation(CHAR_MILES,    "roll",           spr_miles_roll,           0,  3,  0, -1, 0.30);

// Skid:
player_add_animation(CHAR_MILES,    "skid",           spr_miles_skid,           0,  3,  1, -1, 0.35);
player_add_animation(CHAR_MILES,    "skid_fast",      spr_miles_skid_fast,      0,  2,  1, -1, 0.35);
player_add_animation(CHAR_MILES,    "skid_turn",      spr_miles_skid_turn,      0,  3,  0,  0, 0.35);

// Balance:
player_add_animation(CHAR_MILES,    "balance_back",   spr_miles_balance_back,   0,  7,  0, -1, 0.20);
player_add_animation(CHAR_MILES,    "balance_front",  spr_miles_balance_front,  0,  8,  1, -1, 0.20);

// Push:
player_add_animation(CHAR_MILES,    "push",           spr_miles_push,           0,  8,  1, -1, 0.20);

// Spring:
player_add_animation(CHAR_MILES,    "spring_flight",  spr_miles_spring,         0,  2,  0, -1, 0.20);
player_add_animation(CHAR_MILES,    "spring_fall",    spr_miles_spring,         3, 11,  9, -1, 0.20);

// Breathe:
player_add_animation(CHAR_MILES,    "breathe",        spr_miles_breathe,        0,  1,  0,  0, 0.10);

// Hurt:
player_add_animation(CHAR_MILES,    "hurt",           spr_miles_hurt,           0,  4,  0,  0, 0.20);

// Death:
player_add_animation(CHAR_MILES,    "death",          spr_miles_death,          0,  5,  4, -1, 0.20);

// Frog:

// Throw:

// Glide carry:

// Fly:
player_add_animation(CHAR_MILES,    "fly",            spr_miles_fly,            0, 15,  0, -1, 0.30);
player_add_animation(CHAR_MILES,    "fly_drop",       spr_miles_fly,           16, 25, 18, -1, 0.25);
player_add_animation(CHAR_MILES,    "fly_turn",       spr_miles_fly_turn,       0,  1,  0,  0, 0.50, "fly");
player_add_animation(CHAR_MILES,    "fly_cancel",     spr_miles_fly_cancel,     0,  3,  2, -1, 0.20);

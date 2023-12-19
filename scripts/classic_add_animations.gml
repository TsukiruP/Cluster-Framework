// classic_add_animations()

// Default:
player_add_animation(CHAR_CLASSIC,  "stand",          spr_classic_stand,        0,  0,  0,  0, 0.20);
player_add_animation(CHAR_CLASSIC,  "jog",            spr_classic_jog,          0,  5,  0, -1, 0.25);
player_add_animation(CHAR_CLASSIC,  "run",            spr_classic_run,          0,  5,  0, -1, 0.25);

// Wait:
player_add_animation(CHAR_CLASSIC,  "wait_leader",    spr_classic_stand,        1,  4,  1, -1, 0.15);
player_add_animation(CHAR_CLASSIC,  "wait_partner",   spr_classic_stand,        5, 17,  5, -1, 0.15);

// Ready:

// Look:
player_add_animation(CHAR_CLASSIC,  "look",           spr_classic_misc,         0,  0,  0,  0, 0.20);

// Crouch
player_add_animation(CHAR_CLASSIC,  "crouch",         spr_classic_misc,         1,  1,  0,  0, 0.20);

// Spin Dash:
player_add_animation(CHAR_CLASSIC,  "spin_dash",      spr_classic_spin_dash,    0,  3,  0, -1, 0.30);

// Roll:
player_add_animation(CHAR_CLASSIC,  "roll",           spr_classic_roll,         0,  7,  0, -1, 0.30);

// Skid:
player_add_animation(CHAR_CLASSIC,  "skid",           spr_classic_skid,         0,  1,  0, -1, 0.35);

// Balance:
player_add_animation(CHAR_CLASSIC,  "balance_back",   spr_classic_balance,      0,  2,  0, -1, 0.20);
player_add_animation(CHAR_CLASSIC,  "balance_front",  spr_classic_balance,      3,  5,  3, -1, 0.20);

// Push:
player_add_animation(CHAR_CLASSIC,  "push",           spr_classic_push,         0,  3,  0, -1, 0.20);

// Spring:
player_add_animation(CHAR_CLASSIC,  "spring",         spr_classic_misc,         4,  4,  4,  0, 0);

// Breathe:
player_add_animation(CHAR_CLASSIC,  "breathe",        spr_classic_misc,         5,  5,  5,  0, 0.10);

// Hurt:
player_add_animation(CHAR_CLASSIC,  "hurt",           spr_classic_misc,         2,  2,  2,  0, 0.20);

// Death:
player_add_animation(CHAR_CLASSIC,  "death",          spr_classic_death,        0,  0,  0,  0, 0);
player_add_animation(CHAR_CLASSIC,  "drown",          spr_classic_death,        1,  1,  0,  0, 0);

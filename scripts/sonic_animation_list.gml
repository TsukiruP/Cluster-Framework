/// sonic_animation_list()

// Default:
player_add_animation(CHAR_SONIC, "stand",         ctl_sonic_stand) //,     tml_sonic_stand_tag);
player_add_animation(CHAR_SONIC, "turn",          ctl_sonic_turn) //,      tml_sonic_turn_tag);
player_add_animation(CHAR_SONIC, "walk",          ctl_sonic_walk) //      tml_sonic_walk_tag);
player_add_animation(CHAR_SONIC, "walk_fast",     ctl_sonic_walk_fast) // tml_sonic_walk_fast_tag);
player_add_animation(CHAR_SONIC, "jog",           ctl_sonic_jog) //,       tml_sonic_jog_tag);
player_add_animation(CHAR_SONIC, "jog_fast",      ctl_sonic_jog_fast);
player_add_animation(CHAR_SONIC, "run",           ctl_sonic_run);

// Wait:
player_add_animation(CHAR_SONIC, "wait",          ctl_sonic_wait_leader, ctl_sonic_wait_partner);

// Balance:
player_add_animation(CHAR_SONIC, "balance_front", ctl_sonic_balance_front);
player_add_animation(CHAR_SONIC, "balance_back",  ctl_sonic_balance_back);

// Push:
player_add_animation(CHAR_SONIC, "push",          ctl_sonic_push);

// Spin Jump:
player_add_animation(CHAR_SONIC, "spin_flight",   ctl_sonic_spin_flight);
player_add_animation(CHAR_SONIC, "spin_fall",     ctl_sonic_spin_fall);

// Look:
player_add_animation(CHAR_SONIC, "look",          ctl_sonic_look);

// Crouch:
player_add_animation(CHAR_SONIC, "crouch",        ctl_sonic_crouch);


// Spin Dash:
player_add_animation(CHAR_SONIC, "spin_dash",     ctl_sonic_spin_dash);
player_add_animation(CHAR_SONIC, "spin_charge",   ctl_sonic_spin_charge);

// Roll:
player_add_animation(CHAR_SONIC, "roll",          ctl_sonic_roll);

// Skid:
player_add_animation(CHAR_SONIC, "skid",          ctl_sonic_skid);
player_add_animation(CHAR_SONIC, "skid_fast",     ctl_sonic_skid_fast);
player_add_animation(CHAR_SONIC, "skid_turn",     ctl_sonic_skid_turn);

// Spring:
player_add_animation(CHAR_SONIC, "spring_flight", ctl_sonic_spring_flight);
player_add_animation(CHAR_SONIC, "spring_fall",   ctl_sonic_spring_fall);

// Hurt:
player_add_animation(CHAR_SONIC, "hurt",          ctl_sonic_hurt);

// Death:
player_add_animation(CHAR_SONIC, "death",         ctl_sonic_death);

/*
// Balance:
player_add_animation(CHAR_SONIC, "balance_front", tml_sonic_balance_front);
player_add_animation(CHAR_SONIC, "balance_back",  tml_sonic_balance_back);

// Push:
player_add_animation(CHAR_SONIC, "push",          tml_sonic_push);

player_add_animation(CHAR_SONIC, "hammer",         tml_sonic_hammer);
/*
// Default:
player_add_animation(CHAR_SONIC,    "stand",          spr_sonic_stand,          0, 34,  0, -1, 0.20);
player_add_animation(CHAR_SONIC,    "turn",           spr_sonic_turn,           0,  1,  0,  0, 0.50);
player_add_animation(CHAR_SONIC,    "walk",           spr_sonic_walk,           0,  7,  0, -1, 0.25);
player_add_animation(CHAR_SONIC,    "walk_fast",      spr_sonic_walk_fast,      0,  7,  0, -1, 0.25);
player_add_animation(CHAR_SONIC,    "jog",            spr_sonic_jog,            0,  7,  0, -1, 0.25);
player_add_animation(CHAR_SONIC,    "jog_fast",       spr_sonic_jog_fast,       0,  7,  0, -1, 0.25);
player_add_animation(CHAR_SONIC,    "run",            spr_sonic_run,            0,  7,  0, -1, 0.25);
player_add_animation(CHAR_SONIC,    "dash",           spr_sonic_dash,           0,  3,  0, -1, 0.25);

// Wait:
player_add_animation(CHAR_SONIC,    "wait_leader",    spr_sonic_wait_leader,    0, 21, 18, -1, 0.10);
player_add_animation(CHAR_SONIC,    "wait_partner",   spr_sonic_wait_partner,   0, 21,  2, -1, 0.15);

// Ready:
player_add_animation(CHAR_SONIC,    "ready",          spr_sonic_ready,          0, 36,  0,  0, 0.18, "stand");

// Land:
player_add_animation(CHAR_SONIC,    "land",           spr_sonic_land,           0,  2,  0,  0, 0.20, "stand");

// Spin flight/fall:
player_add_animation(CHAR_SONIC,    "spin_flight",    spr_sonic_spin_flight,    0,  5,  2,  0, 0.30, "roll");
player_add_animation(CHAR_SONIC,    "spin_fall",      spr_sonic_spin_fall,      0,  3,  1, -1, 0.30);

// Look:
player_add_animation(CHAR_SONIC,    "look",           spr_sonic_look,           0,  5,  2, -1, 0.20, "", 0, 1);

// Crouch:
player_add_animation(CHAR_SONIC,    "crouch",         spr_sonic_crouch,         0,  3,  0,  0, 0.20, "", 0, 1);

// Spin dash:
player_add_animation(CHAR_SONIC,    "spin_dash",      spr_sonic_spin_dash,      0,  3,  0, -1, 0.30);
player_add_animation(CHAR_SONIC,    "super_spin",     spr_sonic_spin_charge,    0,  3,  0,  0, 0.30, "spin_dash");

// Roll:
player_add_animation(CHAR_SONIC,    "roll",           spr_sonic_roll,           0,  3,  0, -1, 0.30);

// Skid:
player_add_animation(CHAR_SONIC,    "skid",           spr_sonic_skid,           0,  2,  1, -1, 0.35);
player_add_animation(CHAR_SONIC,    "skid_fast",      spr_sonic_skid_fast,      0,  3,  2, -1, 0.35);
player_add_animation(CHAR_SONIC,    "skid_turn",      spr_sonic_skid_turn,      0,  3,  0,  0, 0.35);

// Balance:
player_add_animation(CHAR_SONIC,    "balance_back",   spr_sonic_balance_back,   0,  8,  1, -1, 0.20);
player_add_animation(CHAR_SONIC,    "balance_front",  spr_sonic_balance_front,  0,  8,  1, -1, 0.20);

// Push:
player_add_animation(CHAR_SONIC,    "push",           spr_sonic_push,           0,  8,  1, -1, 0.20);

// Spring:
player_add_animation(CHAR_SONIC,    "spring_flight",  spr_sonic_spring,         0,  3,  1, -1, 0.20);
player_add_animation(CHAR_SONIC,    "spring_fall",    spr_sonic_spring,         4, 12, 10, -1, 0.20);

// Breathe:
player_add_animation(CHAR_SONIC,    "breathe",        spr_sonic_breathe,        0,  1,  0,  0, 0.10);

// Hurt:
player_add_animation(CHAR_SONIC,    "hurt",           spr_sonic_hurt,           0,  4,  0,  0, 0.20);

// Death:
player_add_animation(CHAR_SONIC,    "death",          spr_sonic_death,          0,  5,  4, -1, 0.20);

// Slide:
player_add_animation(CHAR_SONIC,    "slide",          spr_sonic_slide,          0,  3,  0, -1, 0.20);
*/

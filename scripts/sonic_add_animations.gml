/// sonic_add_animations()

// Default:
player_add_animation(CHAR_SONIC, "stand",         tml_sonic_stand);
player_add_animation(CHAR_SONIC, "turn",          tml_sonic_turn);
player_add_animation(CHAR_SONIC, "walk",          tml_sonic_walk);
player_add_animation(CHAR_SONIC, "walk_fast",     tml_sonic_walk_fast);
player_add_animation(CHAR_SONIC, "jog",           tml_sonic_jog);
player_add_animation(CHAR_SONIC, "jog_fast",      tml_sonic_jog_fast);
player_add_animation(CHAR_SONIC, "run",           tml_sonic_run);

// Spin Jump:
player_add_animation(CHAR_SONIC, "spin_flight",   tml_sonic_spin_flight);
player_add_animation(CHAR_SONIC, "spin_fall",     tml_sonic_spin_fall);

// Look:
player_add_animation(CHAR_SONIC, "look",          tml_sonic_look);
player_add_animation(CHAR_SONIC, "look_end",      tml_sonic_look_end);

// Crouch:
player_add_animation(CHAR_SONIC, "crouch",        tml_sonic_crouch);
player_add_animation(CHAR_SONIC, "crouch_end",    tml_sonic_crouch_end);

// Spin Dash:
player_add_animation(CHAR_SONIC, "spin_dash",     tml_sonic_spin_dash);
player_add_animation(CHAR_SONIC, "spin_charge",   tml_sonic_spin_charge);

// Roll:
player_add_animation(CHAR_SONIC, "roll",          tml_sonic_roll);

// Skid:
player_add_animation(CHAR_SONIC, "skid",          tml_sonic_skid);
player_add_animation(CHAR_SONIC, "skid_fast",     tml_sonic_skid_fast);
player_add_animation(CHAR_SONIC, "skid_turn",     tml_sonic_skid_turn);

// Balance:
player_add_animation(CHAR_SONIC, "balance_back",  tml_sonic_balance_back);
player_add_animation(CHAR_SONIC, "balance_front", tml_sonic_balance_front);

// Spring:
player_add_animation(CHAR_SONIC, "spring_flight", tml_sonic_spring_flight);
player_add_animation(CHAR_SONIC, "spring_fall",   tml_sonic_spring_fall);

// Push:
player_add_animation(CHAR_SONIC, "push",          tml_sonic_push);

// Hurt:
player_add_animation(CHAR_SONIC, "hurt",          tml_sonic_hurt);

// Death:
player_add_animation(CHAR_SONIC, "death",         tml_sonic_death);


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

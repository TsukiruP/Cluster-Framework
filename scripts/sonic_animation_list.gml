/// sonic_animation_list()

// Default:
player_add_animation(CHAR_SONIC, "idle",          ctl_sonic_idle) //,     tml_sonic_idle_tag);
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

// Omochao:
player_add_animation(CHAR_SONIC, "omochao",          ctl_sonic_omochao);

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

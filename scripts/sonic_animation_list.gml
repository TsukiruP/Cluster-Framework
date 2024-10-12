/// sonic_animation_list()

// Stand:
player_add_animation(CHAR_SONIC, "stand",         ctl_sonic_stand); //,     tml_sonic_idle_tag);

// Balance:
player_add_animation(CHAR_SONIC, "cliff_front",   ctl_sonic_cliff_front);
player_add_animation(CHAR_SONIC, "cliff_back",    ctl_sonic_cliff_back);

// Wait:
player_add_animation(CHAR_SONIC, "wait",          ctl_sonic_wait_leader, ctl_sonic_wait_partner);

// Ready:
player_add_animation(CHAR_SONIC, "ready",         ctl_sonic_ready);

// Land:
player_add_animation(CHAR_SONIC, "land",          ctl_sonic_land);

// Omochao:
player_add_animation(CHAR_SONIC, "omochao",       ctl_sonic_omochao);
player_add_animation(CHAR_SONIC, "omochao_end",   ctl_sonic_omochao_end);

// Turn:
player_add_animation(CHAR_SONIC, "turn",          ctl_sonic_turn) //,      tml_sonic_turn_tag);
player_add_animation(CHAR_SONIC, "turn_brake",    ctl_sonic_turn_brake);

// Run:
player_add_animation(CHAR_SONIC, "run_0",         ctl_sonic_run_0) //      tml_sonic_walk_tag);
player_add_animation(CHAR_SONIC, "run_1",         ctl_sonic_run_1) // tml_sonic_walk_fast_tag);
player_add_animation(CHAR_SONIC, "run_2",         ctl_sonic_run_2) //,       tml_sonic_jog_tag);
player_add_animation(CHAR_SONIC, "run_3",         ctl_sonic_run_3);
player_add_animation(CHAR_SONIC, "run_4",         ctl_sonic_run_4);

// Look:
player_add_animation(CHAR_SONIC, "look",          ctl_sonic_look);
player_add_animation(CHAR_SONIC, "look_end",      ctl_sonic_look_end);

// Crouch:
player_add_animation(CHAR_SONIC, "crouch",        ctl_sonic_crouch);
player_add_animation(CHAR_SONIC, "crouch_end",    ctl_sonic_crouch_end);

// Spin Dash:
player_add_animation(CHAR_SONIC, "spin_dash",     ctl_sonic_spin_dash);
player_add_animation(CHAR_SONIC, "spin_charge",   ctl_sonic_spin_charge);

// Spin:
player_add_animation(CHAR_SONIC, "spin",          ctl_sonic_roll, ctl_sonic_spin_flight, ctl_sonic_spin_fall);

// Brake:
player_add_animation(CHAR_SONIC, "brake",         ctl_sonic_brake);
player_add_animation(CHAR_SONIC, "brake_fast",    ctl_sonic_brake_fast);

// Push:
player_add_animation(CHAR_SONIC, "push",          ctl_sonic_push);

// Spring:
player_add_animation(CHAR_SONIC, "spring_flight", ctl_sonic_spring_flight);
player_add_animation(CHAR_SONIC, "spring_fall",   ctl_sonic_spring_fall);

// Breathe:

// Goal:

// Hurt:
player_add_animation(CHAR_SONIC, "hurt",          ctl_sonic_hurt);

// Death:
player_add_animation(CHAR_SONIC, "death",         ctl_sonic_death);

// Hammer:
player_add_animation(CHAR_SONIC, "hammer",        ctl_sonic_hammer);

// Insta:
player_add_animation(CHAR_SONIC, "insta",         ctl_sonic_insta);

// Skid:
player_add_animation(CHAR_SONIC, "somersault",    ctl_sonic_somersault);
player_add_animation(CHAR_SONIC, "skid",          ctl_sonic_skid);
player_add_animation(CHAR_SONIC, "skid_end",      ctl_sonic_skid_end);

// Air Dash:
player_add_animation(CHAR_SONIC, "air_dash",      ctl_sonic_air_dash);

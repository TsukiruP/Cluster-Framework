/// animation_init_sonic()
// Initializes Sonic's animations.

// Stand:
animation_set(CHAR_SONIC, "stand", ctl_sonic_stand); //,     tml_sonic_idle_tag);

// Balance:
animation_set(CHAR_SONIC, "cliff_front", ctl_sonic_cliff_front);
animation_set(CHAR_SONIC, "cliff_back", ctl_sonic_cliff_back);

// Wait:
animation_set(CHAR_SONIC, "wait", ctl_sonic_wait_leader, ctl_sonic_wait_partner);

// Ready:
animation_set(CHAR_SONIC, "ready", ctl_sonic_ready);

// Land:
animation_set(CHAR_SONIC, "land", ctl_sonic_land);

// Omochao:
animation_set(CHAR_SONIC, "omochao", ctl_sonic_omochao);
animation_set(CHAR_SONIC, "omochao_end", ctl_sonic_omochao_end);

// Turn:
animation_set(CHAR_SONIC, "turn", ctl_sonic_turn) //,      tml_sonic_turn_tag);
animation_set(CHAR_SONIC, "turn_brake", ctl_sonic_turn_brake);

// Run:
animation_set(CHAR_SONIC, "run_0", ctl_sonic_run_0) //      tml_sonic_walk_tag);
animation_set(CHAR_SONIC, "run_1", ctl_sonic_run_1) // tml_sonic_walk_fast_tag);
animation_set(CHAR_SONIC, "run_2", ctl_sonic_run_2) //,       tml_sonic_jog_tag);
animation_set(CHAR_SONIC, "run_3", ctl_sonic_run_3);
animation_set(CHAR_SONIC, "run_4", ctl_sonic_run_4);
animation_set(CHAR_SONIC, "run_5", ctl_sonic_run_5);

// Look:
animation_set(CHAR_SONIC, "look", ctl_sonic_look);
animation_set(CHAR_SONIC, "look_end", ctl_sonic_look_end);

// Crouch:
animation_set(CHAR_SONIC, "crouch", ctl_sonic_crouch);
animation_set(CHAR_SONIC, "crouch_end", ctl_sonic_crouch_end);

// Spin Dash:
animation_set(CHAR_SONIC, "spin_dash", ctl_sonic_spin_dash);
animation_set(CHAR_SONIC, "spin_charge", ctl_sonic_spin_charge);

// Spin:
animation_set(CHAR_SONIC, "spin", ctl_sonic_roll, ctl_sonic_spin_flight, ctl_sonic_spin_fall);

// Brake:
animation_set(CHAR_SONIC, "brake", ctl_sonic_brake);
animation_set(CHAR_SONIC, "brake_fast", ctl_sonic_brake_fast);

// Push:
animation_set(CHAR_SONIC, "push", ctl_sonic_push);

// Spring:
animation_set(CHAR_SONIC, "spring_flight", ctl_sonic_spring_flight);
animation_set(CHAR_SONIC, "spring_fall", ctl_sonic_spring_fall);

// Breathe:

// Goal:

// Hurt:
animation_set(CHAR_SONIC, "hurt", ctl_sonic_hurt);

// Death:
animation_set(CHAR_SONIC, "death", ctl_sonic_death);

// Hammer:
animation_set(CHAR_SONIC, "hammer", ctl_sonic_hammer);

// Insta:
animation_set(CHAR_SONIC, "insta", ctl_sonic_insta);

// Skid:
animation_set(CHAR_SONIC, "somersault", ctl_sonic_somersault);
animation_set(CHAR_SONIC, "skid", ctl_sonic_skid);
animation_set(CHAR_SONIC, "skid_end", ctl_sonic_skid_end);

// Air Dash:
animation_set(CHAR_SONIC, "air_dash", ctl_sonic_air_dash);

// Stomp:
animation_set(CHAR_SONIC, "stomp", ctl_sonic_stomp);
animation_set(CHAR_SONIC, "stomp_land", ctl_sonic_stomp_land);

// Super Peel Out:
animation_set(CHAR_SONIC, "peel_out", ctl_sonic_peel_out);

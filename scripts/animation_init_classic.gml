/// animation_init_classic()
// Initializes Classic's animations.

// Stand:
animation_add(CHAR_CLASSIC, "stand", ctl_classic_stand);

// Cliff:
animation_add(CHAR_CLASSIC, "cliff_front", ctl_classic_cliff_front);
animation_add(CHAR_CLASSIC, "cliff_back", ctl_classic_cliff_back);

// Wait:
animation_add(CHAR_CLASSIC, "wait", ctl_classic_wait_leader, ctl_classic_wait_partner);

// Ready:

// Run:
animation_add(CHAR_CLASSIC, "run_0", ctl_classic_run_0);
animation_add(CHAR_CLASSIC, "run_1", ctl_classic_run_1);

// Look:
animation_add(CHAR_CLASSIC, "look", ctl_classic_look);

// Crouch:
animation_add(CHAR_CLASSIC, "crouch", ctl_classic_crouch);

// Spin Dash:
animation_add(CHAR_CLASSIC, "spin_dash", ctl_classic_spin_dash);

// Spin:
animation_add(CHAR_CLASSIC, "spin", ctl_classic_roll);

// Brake:
animation_add(CHAR_CLASSIC, "brake", ctl_classic_brake);

// Hurt:
animation_add(CHAR_CLASSIC, "hurt", ctl_classic_hurt);

// Death:
animation_add(CHAR_CLASSIC, "death", ctl_classic_death, ctl_classic_drown);

// Push:
animation_add(CHAR_CLASSIC, "push", ctl_classic_push);

// Spring:
animation_add(CHAR_CLASSIC, "spring", ctl_classic_spring);

// Breathe:
animation_add(CHAR_CLASSIC, "breathe", ctl_classic_breathe);

// Goal:

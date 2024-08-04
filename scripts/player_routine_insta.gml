/// player_routine_insta()
// It's not even really a shield...

// Disable shield:
status_shield_allow = false;

// Set invincibility
status_insta_alarm = 8;

// Set action:
player_set_action(player_action_jump);

// Set animation:
player_set_animation("insta");

// Create shield:
if (character_id == CHAR_SONIC) {
    with (instance_create(x, y, eff_player)) {
        ctl_initialize(ctl_shield_insta);
    
        depth         = other.depth;
        image_xscale  = other.image_xscale;
        player_handle = other.id;
    }
}

// Play sound:
sound_play("snd_shield_insta");

/// player_routine_insta()
// It's not even really a shield...

// Set invincibility:
status_insta_alarm = 8;

// Create shield:
if (character_id == CHAR_SONIC) {
    with (instance_create(x, y, eff_player)) {
        ctl_initialize(ctl_shield_insta);
    
        depth         = other.depth;
        image_xscale  = other.image_xscale;
        image_angle   = gravity_angle(other);
        player_handle = other.id;
    }
}

// Play sound:
sound_play("snd_shield_insta");

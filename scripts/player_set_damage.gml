/// player_set_damage(obj)
//

// Exit if already hurt, dying, or invincible:
if (state_current == player_state_death || ((state_current == player_state_hurt || status_insta_alarm > 0 || status_invin != INVIN_NONE) && argument0 != self)) {
    exit;
}

var damage_handle, hurt_direction;

// Damage handle:
damage_handle = argument0.id;

// Hurt direction:
hurt_direction = esign(x - damage_handle.x, 1);

// Death:
if (damage_handle == self.id || (input_cpu == false && global.game_rings == 0 && status_shield == 0)) {
    // Set speed:
    if (drown == false) {
        y_speed = -7;
    }

    // Set state:
    player_set_state(player_state_death);

    // Player 1 specific:
    if (input_cpu == false) {
        // Disable pause:
        global.pause_allow = false;

        // Stop jingles:
        with (ctrl_audio) {
            event_user(2);
        }
    }
}

// Hurt:
else {
    // Set speed:
    x_speed =  2 * hurt_direction;
    y_speed = -4;

    // Set invincibility:
    status_invin = INVIN_HURT;

    // Set state:
    player_set_state(player_state_hurt);

    // Reset shield:
    if (input_cpu == false && status_shield != 0) {
        status_shield = 0;
    }

    // Ring loss:
    else if (input_cpu == false){
        player_ring_loss();
    }
}

// Play sound:
if (damage_handle == self.id) {
    if (drown == true) {
        sound_play("snd_drown");
    } else {
        sound_play("snd_hurt");
    }
} else if ((input_cpu == false && shield_handle != noone) || input_cpu == true || state_target == player_state_death) {
    if (object_is_ancestor(damage_handle.object_index, par_spike)) {
        sound_play("snd_spike");
    } else {
        sound_play("snd_hurt");
    }
}

// Underwater physics:
if (physics_id == PHYS_WATER) {
    x_speed /= 2;
    y_speed /= 2;
}

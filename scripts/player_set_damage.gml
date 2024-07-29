/// player_set_damage(obj)
//

// Exit if already hurt, dying, or invincible:
if (action_current == player_action_hurt || action_current == player_action_death || status_invin > 0) {
    exit;
}

var damage_handle, hurt_direction;

// Damage handle:
damage_handle = argument0.id;

// Hurt direction:
if (sign(x - damage_handle.x) == 0) {
    hurt_direction = 1;
} else {
    hurt_direction = sign(x - damage_handle.x);
}

// Death:
if (damage_handle == self.id || (input_cpu == false && global.game_rings == 0 && status_shield == 0)) {
    // Set physics:
    if (drowned == false) {
        y_speed = -7;
    }

    // Set action:
    player_set_action(player_action_death);

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
    // Set physics:
    x_speed =  2 * hurt_direction;
    y_speed = -4;

    // Set invincibility:
    status_invin = INVIN_HURT;

    // Set action:
    player_set_action(player_action_hurt);

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
    if (drowned == true) {
        sound_play("snd_drown");
    } else {
        sound_play("snd_hurt");
    }
} else if ((input_cpu == false && shield_handle != noone) || input_cpu == true || action_current == player_action_death) {
    if (object_is_ancestor(damage_handle.object_index, par_spike)) {
        sound_play("snd_spike");
    } else {
        sound_play("snd_hurt");
    }
}

// Underwater physics:
if (physics_type == PHYS_UNDERWATER) {
    x_speed /= 2;
    y_speed /= 2;
}

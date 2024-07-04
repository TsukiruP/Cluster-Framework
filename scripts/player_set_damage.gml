/// player_set_damage(obj)
//

if (action_current == player_action_hurt || action_current == player_action_death || status_invin > 0) exit;

// Hurt:
if ((input_cpu == false && (global.game_rings > 0 || status_shield != 0)) || input_cpu == true) {
    // Set physics:
    x_speed =  2 * sign(x - argument0.x);
    y_speed = -4;

    // Set invincibility:
    status_invin       = INVIN_HURT;
    status_invin_alarm = 120;

    // Set action:
    player_set_action(player_action_hurt);

    // Play sound:
    if ((input_cpu == false && status_shield != 0) || input_cpu == true) {
        // Reset shield:
        if (input_cpu == false) status_shield = 0;

        if (object_is_ancestor(argument0.object_index, par_spike)) sound_play("snd_spike");
        else sound_play("snd_hurt");
    }

    // Ring loss:
    else if (input_cpu == false){
        player_ring_loss();
    }
}

// Death:
else {
    // Set physics:
    x_speed =  0;
    y_speed = -7;

    // Set action:
    player_set_action(player_action_death);

    // Play sound:
    if (drowned == false) {
        if (object_is_ancestor(argument0.object_index, par_spike)) sound_play("snd_spike");
        else sound_play("snd_hurt");
    } else {
        sound_play("snd_drown");
    }

    // Player 1 specific:
    if (input_cpu == false) {
        // Disable pause:
        global.pause_allow = false;

        // Stop jingles:
        if (sound_isplaying("bgm_muteki")) sound_stop("bgm_muteki");
        if (sound_isplaying("bgm_speed_up")) sound_stop("bgm_speed_up");
    }
}

/// player_action_hurt(obj)
// Ouchie ouch ouch.

// Don't bother if in the middle of dying, already hurt, or have invincibility:
if(action_state == ACTION_DEATH || action_state == ACTION_HURT || invincibility_type > 0) exit;

// Hurt:
if((input_cpu == false && (global.stage_rings > 0 || shield_data != 0)) || input_cpu == true) {
    ground              =  false;
    action_state        =  ACTION_HURT;
    invincibility_type  =  1;
    invincibility_alarm = -1;
    
    if(physics_type == PHYS_UNDERWATER) {
        x_speed =  sign(x - argument0.x);
        y_speed = -2;
    } else {
        x_speed =  2 * sign(x - argument0.x);
        y_speed = -4;
    }
    
    // Play sound:
    if((input_cpu == false && shield_data != 0)) {
        // Clear shield:
        if(input_cpu == false) shield_data = 0;
        
        // Play sound:
        if(object_is_ancestor(argument0.object_index, par_spike)) sound_play("snd_spike");
        else sound_play("snd_hurt");
    }
    else if(input_cpu == false) {
        player_ring_loss();
    }
} else {
    // Die:
    action_state = ACTION_DEATH;
    
    // Play sound:
    if(object_is_ancestor(argument0.object_index, par_spike)) sound_play("snd_spike");
    else sound_play("snd_hurt");
}

// Clock Over:
if(input_cpu == false && clock_up_state != 0) {
    // Play sound:
    // Since this is dependent on the Clock Up state, we play the sound first.
    if(clock_up_state == 2) sound_play("snd_hyper_clock_over");
    else sound_play("snd_clock_over");

    clock_up_state      = 0;
    global.object_ratio = 1;
}

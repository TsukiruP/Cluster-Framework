/// character_state_hurt(obj)
// Ouchie ouch ouch.

// Don't bother if already hurt, in the middle of dying, or have invincibility:
if( action_state == ACTION_DEATH || action_state == ACTION_HURT || invincibility_type > 0) exit;

// Hurt:
if((control_type == 1 && (global.stage_rings > 0 || shield_data != 0)) || control_type == 2) {
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
    if((control_type == 1 && shield_data != 0) || control_type == 2) {
        // Clear shield:
        if(control_type == 1) shield_data = 0;
        
        // Play sound:
        if(object_is_ancestor(argument0.object_index, par_spike)) sound_play("snd_spike");
        else sound_play("snd_hurt");
    } else if(control_type == 1) character_ring_loss();
} else {
    // Die:
    action_state = ACTION_DEATH;
    
    // Play sound:
    if(object_is_ancestor(argument0.object_index, par_spike)) sound_play("snd_spike");
    else sound_play("snd_hurt");
}

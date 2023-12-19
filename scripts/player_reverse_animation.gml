/// player_reverse_animation([next, multiplier])
// Reverses the given animation and sets the given animation as the next animation:

var animation_multiplier;

// Animation multiplier:
if(argument_count >= 2) animation_multiplier = argument[1];
else animation_multiplier = 1;

animation_speed        *= -1 * animation_multiplier;
animation_current_frame = animation_flag_frame + 1;
animation_loop_count    = 0;
animation_finished      = false;

if(argument_count >= 1) animation_next = argument[0];

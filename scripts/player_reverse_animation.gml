/// player_reverse_animation([next])
// Reverses the given animation and sets the given animation as the next animation:

animation_speed        *= -1;
animation_current_frame = animation_flag_frame + 1;
animation_loop_count    = 0;
animation_finished      = false;

if(argument_count >= 1) animation_next = argument[0];

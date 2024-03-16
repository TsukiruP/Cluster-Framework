/// player_set_animation(animation, [start, reload])
//

// Animation moment:
if (argument_count >= 2) animation_moment = argument[1];
else animation_moment = 0;

// Animation reload:
if (argument_count >= 3) animation_reload = argument[2];
else animation_reload = false;

// Animation target:
animation_target = argument[0];

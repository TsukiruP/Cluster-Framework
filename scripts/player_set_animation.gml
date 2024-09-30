/// player_set_animation(animation, [start])
// Sets the target animation to be loaded next frame.

// Initialize:
animation_previous = animation_current;
animation_current = argument0;
animation_moment = 0;

// Set moment:
if (argument_count >= 2)
{
    animation_moment = argument[1];
}

player_animation_core();

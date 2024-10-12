/// player_set_animation(animation, [start])
// Sets the target animation to be loaded next frame.

if (animation_current != argument0 || argument_count >= 2)
{
    // Initialize:
    animation_previous = animation_current;
    animation_current = argument0;
    animation_changed = true;
    animation_moment = 0;

    // Set moment:
    if (argument_count >= 2)
    {
        animation_moment = argument[1];
    }

    // Animate:
    player_animation_core();

    // Object collision:
    player_collision_object();
}

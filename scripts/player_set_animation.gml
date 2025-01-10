/// player_set_animation(animation, [start])
/* Sets the target animation and plays it immediately. */

if (animation_current != argument0 || argument_count >= 2)
{
    animation_previous = animation_current;
    animation_current = argument0;
    animation_changed = true;
    animation_moment = 0;

    if (argument_count >= 2)
    {
        animation_moment = argument[1];
    }

    player_animation_core();
}

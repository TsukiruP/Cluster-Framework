/// player_animation_core()
// Core of the animation system.

if ((timeline_index != player_get_animation(animation_target, animation_varient)) || animation_reload = true) {
    // Store previous animation:
    animation_previous = animation_current;

    // Update current animation:
    animation_current = animation_target;
    timeline_set(player_get_animation(animation_target, animation_varient), animation_moment);

    // Reset finished:
    animation_finished = false;

    // Reset trigger:
    animation_trigger = false;

    // Reset reload:
    animation_reload = false;
}

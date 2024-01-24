/// player_animation_core()
// Core of the animation system.

if (timeline_index != player_get_animation(animation_target)) {
    // Store previous animation:
    animation_previous = animation_current;

    // Update current animation:
    animation_current = animation_target;
    timeline_set(player_get_animation(animation_target));

    animation_finished = false;
}

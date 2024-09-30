/// player_animation_core()
// Core of the animation system.

var y_radius_temp;

// Store previous radius:
y_radius_temp = y_radius;

// Animation
player_animation_variant();
player_animation_speed();

// Load target animation:
if ((ctl_index != player_get_animation(animation_current, animation_variant)) || animation_reload == true)
{
    // Set animation:
    timeline_set(player_get_animation(animation_current, animation_variant), animation_moment);

    // Reset finished:
    animation_finished = false;

    // Reset trigger:
    animation_trigger = false;

    // Reset reload:
    animation_reload = false;

    // Reset timer:
    animation_timer = 0;
}

// Execute custom timeline:
ctl_update();
script_execute(ctl_index);
animation_timer += 1;

// Reset skip:
if (animation_skip == true)
{
    animation_skip = false;
}

// Position fix:
if (on_ground == true)
{
    x += (y_radius_temp - y_radius) * dsin(mask_rotation);
    y += (y_radius_temp - y_radius) * dcos(mask_rotation);
}

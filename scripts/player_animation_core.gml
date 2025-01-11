/// player_animation_core()
/* Executes the player's animation.
Snaps the player to the ground should there be a change in y radius. */

var y_radius_temp;

y_radius_temp = y_radius;

sequence_speed = player_get_animation_speed();
animation_variant = player_get_animation_variant();

// Load target animation:
if (sequence_index != player_get_animation(animation_current, animation_variant))
{
    sequence_set(player_get_animation(animation_current, animation_variant), animation_moment);

    animation_finished = false;
    animation_trigger = false;
    animation_time = 0;
}

sequence_update();
script_execute(sequence_index);
animation_time += 1;

if (animation_skip == true)
{
    animation_skip = false;
}

if (animation_changed == true)
{
    animation_changed = false;
}

if (on_ground == true)
{
    x += (y_radius_temp - y_radius) * dsin(mask_rotation);
    y += (y_radius_temp - y_radius) * dcos(mask_rotation);
}

// SSE bandaid:
if (x_radius < 8)
{
    x_radius = 8;
}

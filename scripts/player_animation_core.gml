/// player_animation_core()
/// @desc Performs an animation step for the player.
/// @returns {void}

var y_radius_temp; y_radius_temp = y_radius;

player_get_animation_speed();
player_get_animation_variant();

if (sequence_index != player_get_animation(animation_current, animation_variant))
{
    sequence_set(player_get_animation(animation_current, animation_variant), animation_moment);
    animation_trigger = false;
    animation_time = 0;
}

sequence_execute();
animation_time += 1;

if (animation_skip) animation_skip = false;
if (animation_changed) animation_changed = false;

if (on_ground)
{
    x += dsin(mask_direction) * (y_radius_temp - y_radius);
    y += dcos(mask_direction) * (y_radius_temp - y_radius);
}

player_animation_fix();

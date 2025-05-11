/// player_animation_core()
/// @desc Performs an animation step for the player.
/// @returns {void}

var y_radius_temp; y_radius_temp = y_radius;
var animation_sequence; animation_sequence = player_get_animation_sequence(animation_current);

if (sequence_index != animation_sequence)
{
    sequence_set(animation_sequence, animation_moment);
    animation_trigger = false;
    animation_time = 0;
}

player_set_animation_speed();
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

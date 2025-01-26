/// player_react(obj, [collision, side])
/* Executes the reaction script of the given instance. */

var reaction_handle, object_handle, reaction, collision;

reaction_handle = argument0;
object_handle = reaction_handle.object_index;
reaction = reaction_handle.reaction_index;

if (script_exists(reaction))
{
    var x_speed_temp, y_speed_temp;

    x_speed_temp = x_speed;
    y_speed_temp = y_speed;

    collision = player_get_collision(reaction_handle);
    if (argument_count > 1) collision |= argument[1];

    if (object_is_ancestor(object_handle, par_obstacle))
    {
        var side;

        side = angle_wrap(round(point_direction(reaction_handle.x, reaction_handle.y, x, y) / ANGLE_UP) * ANGLE_UP);
        if (argument_count > 2) side = argument[2];

        script_execute(reaction, reaction_handle, collision, side);
    }
    else script_execute(reaction, reaction_handle, collision);

    if (object_is_ancestor(object_handle, par_terrain))
    {
        if (x_speed_temp != x_speed || y_speed_temp != y_speed || !instance_exists(reaction_handle)) return true;
    }

    if (state_changed == true) return true;
}

return false;

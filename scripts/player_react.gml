/// player_react(obj, [collision, side])
/* Executes the reaction script of the given instance. */

var object_handle, reaction, collision;

object_handle = argument0;
reaction = object_handle.reaction_index;

if (script_exists(reaction))
{
    var x_speed_temp, y_speed_temp;

    x_speed_temp = x_speed;
    y_speed_temp = y_speed;

    collision = player_get_collision(object_handle);
    if (argument_count > 1) collision = argument[1];

    if (object_is_ancestor(object_handle.object_index, par_terrain))
    {
        var side;

        side = angle_wrap(round(point_direction(object_handle.x, object_handle.y, x, y) / ANGLE_UP) * ANGLE_UP);
        if (argument_count > 2) side = argument[2];

        script_execute(reaction, object_handle, collision, side);

        if (x_speed_temp != x_speed || y_speed_temp != y_speed || !instance_exists(object_handle)) return true;
    }
    else script_execute(reaction, object_handle, collision);

    if (state_changed == true) return true;
}

return false;

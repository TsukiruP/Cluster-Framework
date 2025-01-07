/// player_react(obj, [collision, side])
// Executes the reaction script of the given instance.

var object_handle, reaction, collision;

object_handle = argument0;
reaction = object_handle.reaction_index;

// Abort:
if (!script_exists(reaction))
{
    return false;
}

// Collision:
collision = player_get_collision(object_handle);

if (argument_count >= 2)
{
    collision = argument[1];
}

// Execute reaction:
if (object_is_ancestor(object_handle.object_index, par_terrain))
{
    var side;

    // Side:
    side = angle_wrap(round(point_direction(object_handle.x, object_handle.y, x, y) / ANGLE_UP) * ANGLE_UP);

    if (argument_count >= 3)
    {
        side = argument[2];
    }

    return script_execute(reaction, object_handle, collision, side);
}

return script_execute(reaction, object_handle, collision);

/// player_react(obj, [hitbox, side])
/* Executes the reaction script of the given instance. */

var reaction_id, reaction, hitbox;

reaction_id = argument0;
reaction = reaction_id.reaction_index;

if (script_exists(reaction))
{
    var x_speed_temp, y_speed_temp;

    x_speed_temp = x_speed;
    y_speed_temp = y_speed;

    hitbox = player_get_hitbox(reaction_id);
    if (argument_count > 1) hitbox |= argument[1];

    if (object_is_ancestor(reaction_id.object_index, par_solid))
    {
        var side;

        side = angle_wrap(round(point_direction(reaction_id.x, reaction_id.y, x, y) / ANGLE_UP) * ANGLE_UP);
        if (argument_count > 2) side = argument[2];

        if (!reaction_id.reaction_mask || (reaction_id.reaction_mask && (hitbox & HIT_SOLID)))
        {
            script_execute(reaction, reaction_id, hitbox, side);
        }
    }
    else script_execute(reaction, reaction_id, hitbox);

    if (ds_list_find_index(solid_list, reaction_id) != -1)
    {
        if (x_speed_temp != x_speed || y_speed_temp != y_speed || !instance_exists(reaction_id)) return true;
    }

    if (state_changed == true) return true;
}

return false;

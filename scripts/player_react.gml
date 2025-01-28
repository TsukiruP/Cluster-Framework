/// player_react(obj, [interaction, side])
/* Executes the reaction script of the given instance. */

var reaction_handle, reaction, interaction;

reaction_handle = argument0;
reaction = reaction_handle.reaction_index;

if (script_exists(reaction))
{
    var x_speed_temp, y_speed_temp;

    x_speed_temp = x_speed;
    y_speed_temp = y_speed;

    interaction = player_get_interaction(reaction_handle);
    if (argument_count > 1) interaction |= argument[1];

    if (object_is_ancestor(reaction_handle.object_index, par_terrain))
    {
        var side;

        side = angle_wrap(round(point_direction(x, y, reaction_handle.x, reaction_handle.y) / ANGLE_UP) * ANGLE_UP);
        if (argument_count > 2) side = argument[2];

        if (!reaction_handle.reaction_mask || (reaction_handle.reaction_mask && interaction & INTERACT_SOLID))
        {
            script_execute(reaction, reaction_handle, interaction, side);
        }
    }
    else script_execute(reaction, reaction_handle, interaction);

    if (ds_list_find_index(solid_list, reaction_handle) != -1)
    {
        if (x_speed_temp != x_speed || y_speed_temp != y_speed || !instance_exists(reaction_handle)) return true;
    }

    if (state_changed == true) return true;
}

return false;

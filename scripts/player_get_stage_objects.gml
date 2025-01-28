/// player_get_stage_objects()
/* Refreshes the lists of interactable and solid objects. */

var player, x_int, y_int, sine, csine, x1, y1, x2, y2, interaction;

// Reset lists:
ds_list_clear(interaction_list);
ds_list_clear(solid_list);

// Initialize bounding rectangle:
player = id;

x_int = floor(x);
y_int = floor(y);
sine = dsin(mask_rotation);
csine = dcos(mask_rotation);

x1 = x_int - (csine * wall_radius * 2) - (sine * y_radius * 2);
y1 = y_int + (sine * wall_radius * 2) - (csine * y_radius * 2);
x2 = x_int + (csine * wall_radius * 2) + (sine * y_radius * 2);
y2 = y_int - (sine * wall_radius * 2) + (csine * y_radius * 2);

// Evaluate all stage objects:
with (par_culled)
{
    if (script_exists(reaction_index) && !reaction_mask)
    {
        with (player) interaction = player_get_interaction(other);
        if (interaction != 0) ds_list_add(other.interaction_list, id);
    }

    if (object_is_ancestor(object_index, par_terrain))
    {
        if (!collision || (layer > -1 && layer != other.layer) || collision_rectangle(x1, y1, x2, y2, id, true, false) == noone) continue;
        ds_list_add(other.solid_list, id);
    }
}

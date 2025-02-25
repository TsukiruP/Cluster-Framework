/// player_get_stage_objects()
/// @desc Refreshes the list of stage objects.
/// @returns {void}

var hitbox; hitbox = 0;
var player_inst; player_inst = id;
var x_int; x_int = floor(x);
var y_int; y_int = floor(y);
var sine; sine = dsin(mask_direction);
var csine; csine = dcos(mask_direction);

var x1; x1 = x_int - (csine * wall_radius * 2) - (sine * y_radius * 3 + 1);
var y1; y1 = y_int + (sine * wall_radius * 2) - (csine * y_radius * 3 + 1);
var x2; x2 = x_int + (csine * wall_radius * 2) + (sine * y_radius * 3 + 1);
var y2; y2 = y_int - (sine * wall_radius * 2) + (csine * y_radius * 3 + 1);

/* AUTHOR NOTE: you should use the player_inst's widest radii here instead so that interactions can be properly processed.
However, the horizontal and vertical radii MUST come out greater than the base radii used for collision! */

// Reset lists:
ds_list_clear(reaction_list);
ds_list_clear(solid_list);

// Evaluate all stage objects:
with (par_culled)
{
    if (script_exists(reaction_index))
    {
        with (player_inst) hitbox = player_get_hitbox(other);
        if (hitbox != 0) ds_list_add(player_inst.reaction_list, id);
        if (reaction_mask && collision_rectangle(x1, y1, x2, y2, id, true, false) != noone) ds_list_add(player_inst.reaction_list, id);
    }

    if (object_is_ancestor(object_index, par_solid))
    {
        if (!collision || (layer > -1 && layer != player_inst.layer)) continue;
        if (collision_rectangle(x1, y1, x2, y2, id, true, false) == noone) continue;
        ds_list_add(player_inst.solid_list, id);
    }
}

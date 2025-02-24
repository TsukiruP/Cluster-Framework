/// player_get_stage_objects()
/// @desc Refreshes the list of interactable and solid objects.
/// @returns {void}

var hitbox; hitbox = 0;
var player; player = id;
var x_int; x_int = floor(x);
var y_int; y_int = floor(y);
var sine; sine = dsin(mask_rotation);
var csine; csine = dcos(mask_rotation);

var x1; x1 = x_int - (csine * wall_radius * 2) - (sine * y_radius * 2);
var y1; y1 = y_int + (sine * wall_radius * 2) - (csine * y_radius * 2);
var x2; x2 = x_int + (csine * wall_radius * 2) + (sine * y_radius * 2);
var y2; y2 = y_int - (sine * wall_radius * 2) + (csine * y_radius * 2);

// Reset lists:
ds_list_clear(reaction_list);
ds_list_clear(solid_list);

// Evaluate all stage objects:
with (par_culled)
{
    if (script_exists(reaction_index) && !reaction_mask)
    {
        with (player) hitbox = player_get_hitbox(other);
        if (hitbox != 0) ds_list_add(other.reaction_list, id);
    }

    if (object_is_ancestor(object_index, par_solid))
    {
        if (!collision || (layer > -1 && layer != other.layer) || collision_rectangle(x1, y1, x2, y2, id, true, false) == noone) continue;
        ds_list_add(other.solid_list, id);
    }
}

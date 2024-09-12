/// player_get_solids()
// Generates a list of solids for the player that they are in collision with.

var x_int, y_int, sine, csine, x1, y1, x2, y2;

// Reset solid list:
ds_list_clear(solid_list);

// Initialize bounding rectangle:
x_int = floor(x);
y_int = floor(y);
sine = dsin(mask_rotation);
csine = dcos(mask_rotation);

x1 = x_int - (csine * wall_radius * 2) - (sine * y_radius * 2);
y1 = y_int + (sine * wall_radius * 2) - (csine * y_radius * 2);
x2 = x_int + (csine * wall_radius * 2) + (sine * y_radius * 2);
y2 = y_int - (sine * wall_radius * 2) + (csine * y_radius * 2);

// Evaluate all solids:
with (par_terrain)
{
    // Continue:
    if (collision_layer > -1 && collision_layer != other.collision_layer)
    {
        continue; // Layer mismatch
    }

    if (collision_rectangle(x1, y1, x2, y2, id, true, false) == noone)
    {
        continue; // Not within the bounding rectangle
    }

    // Add solid to list:
    ds_list_add(other.solid_list, id);
}

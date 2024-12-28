/// animation_get(character, animation, variant)
// Returns a timeline from the animation grid.

with (mgr_animation)
{
    var grid_width, grid_height, grid_x, grid_y, grid_timeline;

    // Grid size:
    grid_width = ds_grid_width(animation_grid) - 1;
    grid_height = ds_grid_height(animation_grid) - 1;

    // Grid coordinates:
    grid_x = 2;
    grid_y = 0;

    // Check character:
    if (ds_grid_value_exists(animation_grid, 0, 0, grid_width, grid_height, argument0))
    {
        // Update y:
        grid_y = ds_grid_value_y(animation_grid, 0, 0, grid_width, grid_height, argument0);
    }

    // Check animation:
    if (ds_grid_value_exists(animation_grid, 0, grid_y, grid_width, grid_height, argument1))
    {
        // Find animation:
        grid_y = ds_grid_value_y(animation_grid, 0, grid_y, grid_width, grid_height, argument1);

        // Find variant:
        if (ds_grid_get(animation_grid, argument2 + 2, grid_y) != 0)
        {
            grid_x = argument2 + 2;
        }
    }

    return ds_grid_get(animation_grid, grid_x, grid_y);
}

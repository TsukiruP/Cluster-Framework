/// animation_get(character, animation, variant)
// Returns a timeline from the animation grid.

with (mgr_animation)
{
    var grid_x, grid_y, grid_timeline;

    // Grid column:
    grid_x = 2;

    // Grid row:
    grid_y = ds_grid_value_y(animation_grid, 0, 0, ds_grid_width(animation_grid) - 1, ds_grid_height(animation_grid) - 1, argument0);

    // Find animation:
    grid_y = ds_grid_value_y(animation_grid, 0, grid_y, ds_grid_width(animation_grid) - 1, ds_grid_height(animation_grid) - 1, argument1);

    // Find variant:
    if (ds_grid_get(animation_grid, argument2 + 2, grid_y) != 0)
    {
        grid_x = argument2 + 2;
    }

    // Return:
    return ds_grid_get(animation_grid, grid_x, grid_y);
}

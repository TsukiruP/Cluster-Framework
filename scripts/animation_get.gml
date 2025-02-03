/// animation_get(character, animation, variant)
/* Returns a sequence from the animation grid. */

with (ctrl_animation)
{
    var grid_width, grid_height, grid_x, grid_y;

    grid_width = ds_grid_width(animation_grid) - 1;
    grid_height = ds_grid_height(animation_grid) - 1;
    grid_x = 2;
    grid_y = 0;

    // Character:
    if (ds_grid_value_exists(animation_grid, 0, 0, grid_width, grid_height, argument0))
    {
        grid_y = ds_grid_value_y(animation_grid, 0, 0, grid_width, grid_height, argument0);
    }

    // Animation:
    if (ds_grid_value_exists(animation_grid, 0, grid_y, grid_width, grid_height, argument1))
    {
        grid_y = ds_grid_value_y(animation_grid, 0, grid_y, grid_width, grid_height, argument1);
        if (ds_grid_get(animation_grid, argument2 + 2, grid_y) != 0) grid_x = argument2 + 2;
    }

    return ds_grid_get(animation_grid, grid_x, grid_y);
}

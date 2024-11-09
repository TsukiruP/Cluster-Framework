/// player_get_animation(animation, variant)
// Returns a timeline based on the given animation and variant. Defaults to a character's first animation if it is not able to be found.

if (global.animation_grid != -1)
{
    if (global.animation_initialized == true)
    {
        var animation_row, animation_check;

        // Animation row:
        animation_row = ds_grid_value_y(global.animation_grid, 0, global.animation_coordinates[character_id, 0], 10, global.animation_coordinates[character_id, 1], argument0);

        if (animation_row == -1)
        {
            animation_row = global.animation_coordinates[character_id, 0];
        }

        // Check the ds grid:
        if (ds_grid_get(global.animation_grid, argument1 + 2, animation_row) == 0)
        {
            animation_check = ds_grid_get(global.animation_grid, 2, animation_row);
        }
        else
        {
            animation_check = ds_grid_get(global.animation_grid, argument1 + 2, animation_row);
        }

        // Return a timeline:
        return animation_check;
    }
}

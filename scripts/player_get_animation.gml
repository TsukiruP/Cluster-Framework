/// player_get_animation(animation, varient)
// Returns a timeline based on the given animation and varient.
// Defaults to a character's first animation if it is not able to be found.

if (global.animation_grid != -1) {
    if (global.animation_initialized == true) {
        var animation_row;

        // Animation row:
        animation_row = ds_grid_value_y(global.animation_grid, 0, global.animation_coordinates[character_data, 0], 10, global.animation_coordinates[character_data, 1], argument0);

        if (animation_row == -1) animation_row = global.animation_coordinates[character_data, 0];

        // Return a timeline:
        return ds_grid_get(global.animation_grid, 2, animation_row);
    }

}

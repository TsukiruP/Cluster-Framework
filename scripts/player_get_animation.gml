/// player_get_animation(animation, varient)
// Sets animation data based on the current animation, or returns specific information about the given animation.

if (global.animation_grid != -1) {
    if (global.animation_initialized == true) {
        var animation_row;

        // Animation row:
        animation_row = ds_grid_value_y(global.animation_grid, 0, global.animation_coordinates[character_data, 0], 10, global.animation_coordinates[character_data, 1], argument0);

        if (animation_row == -1) animation_row = 0;

        // Return a timeline:
        return ds_grid_get(global.animation_grid, 2, animation_row);

        /*var animation_row, animation_argument;

        // Animation argument:
        if (argument_count >= 2) animation_argument = argument[0];
        else animation_argument = animation_current;

        // Animation row:
        animation_row = ds_grid_value_y(global.animation_grid, 0, global.animation_coordinates[character_data, 0], 10, global.animation_coordinates[character_data, 1], animation_argument);

        if (animation_row != -1) {
            // Return a specific argument:
            if (argument_count >= 2) return ds_grid_get(global.animation_grid, argument[1], animation_row);

            // Set animation data:
            else {
                animation_sprite      = ds_grid_get(global.animation_grid,  2, animation_row);
                animation_start_frame = ds_grid_get(global.animation_grid,  3, animation_row);
                animation_end_frame   = ds_grid_get(global.animation_grid,  4, animation_row);
                animation_loop_frame  = ds_grid_get(global.animation_grid,  5, animation_row);
                animation_loop_count  = ds_grid_get(global.animation_grid,  6, animation_row);
                animation_speed       = ds_grid_get(global.animation_grid,  7, animation_row);
                animation_next        = ds_grid_get(global.animation_grid,  8, animation_row);
                animation_next_frame  = ds_grid_get(global.animation_grid,  9, animation_row);
                animation_flag_frame  = ds_grid_get(global.animation_grid, 10, animation_row);
            }
        }*/
    }

}

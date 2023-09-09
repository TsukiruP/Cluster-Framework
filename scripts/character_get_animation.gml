/// character_get_animation()

if(global.animation_grid != -1) {
    if(global.animation_initialized = true){
        var animation_range;

        animation_range = ds_grid_value_y(global.animation_grid, 0, global.animation_coordinates[character_data, 0], 10, global.animation_coordinates[character_data, 1] - 1, animation_current);

        animation_sprite      = ds_grid_get(global.animation_grid,  2, animation_range);
        animation_start_frame = ds_grid_get(global.animation_grid,  3, animation_range);
        animation_end_frame   = ds_grid_get(global.animation_grid,  4, animation_range);
        animation_loop_frame  = ds_grid_get(global.animation_grid,  5, animation_range);
        animation_loop_count  = ds_grid_get(global.animation_grid,  6, animation_range);
        animation_speed       = ds_grid_get(global.animation_grid,  7, animation_range);
        animation_next        = ds_grid_get(global.animation_grid,  8, animation_range);
        animation_next_frame  = ds_grid_get(global.animation_grid,  9, animation_range);
        animation_flag_frame  = ds_grid_get(global.animation_grid, 10, animation_range);
    }
}

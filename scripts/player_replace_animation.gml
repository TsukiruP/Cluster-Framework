/// player_replace_animation(animation, sprite, start frame, end frame, loop frame, loop count, speed, [next, next frame, flag frame])
// Replaces the given animation with the given information:

var animation_range, animation_next_temp, animation_next_frame_temp, animation_flag_frame_temp;

// Animation range:
animation_range = ds_grid_value_y(global.animation_grid, 0, global.animation_coordinates[character_data, 0], 1, global.animation_coordinates[character_data, 1], argument[0]);

// Set next animation:
if(argument_count >= 8) animation_next_temp = argument[7];
else animation_next_temp = "";

// Set next animation frame:
if(argument_count >= 9) animation_next_frame_temp = argument[8];
else animation_next_frame_temp = 0;

// Set flag frame:
if(argument_count >= 10) animation_flag_frame_temp = argument[9];
else animation_flag_frame_temp = 0;

// Replace animation data:
if(animation_range != -1) {
    ds_grid_set(global.animation_grid,  2, animation_range, argument[1]);
    ds_grid_set(global.animation_grid,  3, animation_range, argument[2]);
    ds_grid_set(global.animation_grid,  4, animation_range, argument[3]);
    ds_grid_set(global.animation_grid,  5, animation_range, argument[4]);
    ds_grid_set(global.animation_grid,  6, animation_range, argument[5]);
    ds_grid_set(global.animation_grid,  7, animation_range, argument[6]);
    ds_grid_set(global.animation_grid,  8, animation_range, animation_next_temp);
    ds_grid_set(global.animation_grid,  9, animation_range, animation_next_frame_temp);
    ds_grid_set(global.animation_grid, 10, animation_range, animation_flag_frame_temp);
}

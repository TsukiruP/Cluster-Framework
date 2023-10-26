/// player_add_animation(character, animation, sprite, start frame, end frame, loop frame, loop count, speed, [next, next frame, flag frame])

var animation_next_temp, animation_next_frame_temp, animation_flag_frame_temp;

// Create animation grid:
if(global.animation_grid == -1) global.animation_grid = ds_grid_create(11, 1);
else ds_grid_resize(global.animation_grid, 11, ds_grid_height(global.animation_grid) + 1);

// Set the previous character's final animation:
if(global.animation_character != -1) global.animation_coordinates[global.animation_character, 1] = ds_grid_height(global.animation_grid) - 1;

// Set animation character:
if(argument[0] != global.animation_character) {
    // Change the animation character:
    global.animation_character = argument[0];
    
    // Set the current character's start:
    global.animation_coordinates[global.animation_character, 0] = max(0, ds_grid_height(global.animation_grid) - 1);
}


// Set next animation:
if(argument_count >= 9) animation_next_temp = argument[8];
else animation_next_temp = "";

// Set next animation frame:
if(argument_count >= 10) animation_next_frame_temp = argument[9];
else animation_next_frame_temp = 0;

// Set flag frame:
if(argument_count >= 11) animation_flag_frame_temp = argument[10];
else animation_flag_frame_temp = 0;

// Set next animation:
ds_grid_set(global.animation_grid,  1, ds_grid_height(global.animation_grid) - 1, argument[1]);
ds_grid_set(global.animation_grid,  2, ds_grid_height(global.animation_grid) - 1, argument[2]);
ds_grid_set(global.animation_grid,  3, ds_grid_height(global.animation_grid) - 1, argument[3]);
ds_grid_set(global.animation_grid,  4, ds_grid_height(global.animation_grid) - 1, argument[4]);
ds_grid_set(global.animation_grid,  5, ds_grid_height(global.animation_grid) - 1, argument[5]);
ds_grid_set(global.animation_grid,  6, ds_grid_height(global.animation_grid) - 1, argument[6]);
ds_grid_set(global.animation_grid,  7, ds_grid_height(global.animation_grid) - 1, argument[7]);
ds_grid_set(global.animation_grid,  8, ds_grid_height(global.animation_grid) - 1, animation_next_temp);
ds_grid_set(global.animation_grid,  9, ds_grid_height(global.animation_grid) - 1, animation_next_frame_temp);
ds_grid_set(global.animation_grid, 10, ds_grid_height(global.animation_grid) - 1, animation_flag_frame_temp);

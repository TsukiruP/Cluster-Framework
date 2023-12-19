/// player_add_animation(character, animation, sprite, start frame, end frame, loop frame, loop count, speed, [next, next frame, flag frame])
// Add an animation to the animation ds grid all player characters use.
// If the animation is already added, then it overwrites the previous information.

var animation_row, animation_next_temp, animation_next_frame_temp, animation_flag_frame_temp;

// Create animation grid:
if(global.animation_grid == -1) {
    global.animation_grid = ds_grid_create(11, 1);
    animation_row         = 0;
} else {
    if(object_index != obj_player) {
        ds_grid_resize(global.animation_grid, 11, ds_grid_height(global.animation_grid) + 1);
        animation_row = ds_grid_height(global.animation_grid) - 1;
    } else {
        animation_row = ds_grid_value_y(global.animation_grid, 0, global.animation_coordinates[character_data, 0], 10, global.animation_coordinates[character_data, 1], argument[1]);
    }
}

// Player shouldn't be initializing animation data:
if(object_index != obj_player) {
    // Set the previous character's final animation:
    if(global.animation_character != -1) global.animation_coordinates[global.animation_character, 1] = animation_row;

    // Set animation character:
    if(argument[0] != global.animation_character) {
        // Change the animation character:
        global.animation_character = argument[0];

        // Set the current character's start:
        global.animation_coordinates[global.animation_character, 0] = max(0, animation_row);
    }
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
ds_grid_set(global.animation_grid,  1, animation_row, argument[1]);
ds_grid_set(global.animation_grid,  2, animation_row, argument[2]);
ds_grid_set(global.animation_grid,  3, animation_row, argument[3]);
ds_grid_set(global.animation_grid,  4, animation_row, argument[4]);
ds_grid_set(global.animation_grid,  5, animation_row, argument[5]);
ds_grid_set(global.animation_grid,  6, animation_row, argument[6]);
ds_grid_set(global.animation_grid,  7, animation_row, argument[7]);
ds_grid_set(global.animation_grid,  8, animation_row, animation_next_temp);
ds_grid_set(global.animation_grid,  9, animation_row, animation_next_frame_temp);
ds_grid_set(global.animation_grid, 10, animation_row, animation_flag_frame_temp);

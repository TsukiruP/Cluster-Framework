/// player_add_animation(character, animation, timeline)

var animation_row;

// Create animation grid:
if (global.animation_grid == -1) {
    global.animation_grid = ds_grid_create(4, 1);
    animation_row = 0;
} else {
    ds_grid_resize(global.animation_grid, 4, ds_grid_height(global.animation_grid) + 1);
    animation_row = ds_grid_height(global.animation_grid) - 1;
}

// Set the previous character's final animation:
if (global.animation_character != -1) global.animation_coordinates[global.animation_character, 1] = animation_row;

// Set animation character:
if (argument[0] != global.animation_character) {
    // Change the animation character:
    global.animation_character = argument[0];

    // Set the current character's start:
    global.animation_coordinates[global.animation_character, 0] = max(0, animation_row);
}

for (i = 0; i < argument_count; i += 1) {
    ds_grid_set(global.animation_grid,  i, animation_row, argument[i]);
}

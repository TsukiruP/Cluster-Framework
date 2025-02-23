/// animation_add(character, animation, ...sequences)
/// @desc Adds an animation to the animation grid.
/// @param {int} character
/// @param {string} animation
/// @param {script} ...sequence
/// @returns {void}

var _character; _character = argument0;
var _animation; _animation = argument1;
var _sequence; _sequence = argument2;

var grid_width; grid_width = max(ds_grid_width(animation_grid), argument_count);
var grid_y; grid_y = ds_grid_height(animation_grid);

ds_grid_resize(animation_grid, grid_width, grid_y + 1);

ds_grid_set(animation_grid, 0, grid_y, _character);
ds_grid_set(animation_grid, 1, grid_y, _animation);

for ({var i; i = 2}; i < argument_count; i += 1)
{
    ds_grid_set(animation_grid, i, grid_y, argument[i]);
}
/// animation_get(character, animation, variant)
/// @desc Returns a sequence from the animation grid.
/// @param {int} character
/// @param {string} animation
/// @param {int} variant
/// @returns {script}

var _character; _character = argument0;
var _animation; _animation = argument1;
var _variant; _variant = argument2;

with (ctrl_animation)
{
    var grid_width; grid_width = ds_grid_width(animation_grid) - 1;
    var grid_height; grid_height = ds_grid_height(animation_grid) - 1;
    var grid_x; grid_x = 2;
    var grid_y; grid_y = 0;

    if (ds_grid_value_exists(animation_grid, 0, 0, grid_width, grid_height, _character)) grid_y = ds_grid_value_y(animation_grid, 0, 0, grid_width, grid_height, _character);

    if (ds_grid_value_exists(animation_grid, 0, grid_y, grid_width, grid_height, _animation))
    {
        grid_y = ds_grid_value_y(animation_grid, 0, grid_y, grid_width, grid_height, _animation);
        if (ds_grid_get(animation_grid, _variant + 2, grid_y)!= 0) grid_x = _variant + 2;
    }

    return ds_grid_get(animation_grid, grid_x, grid_y);
}
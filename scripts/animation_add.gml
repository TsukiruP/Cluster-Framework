/// animation_add(character, animation, variant0, variant1, ...)
/* Adds sequences to the animation grid. */

var i, grid_width, grid_y;

grid_width = max(ds_grid_width(animation_grid), argument_count);
ds_grid_resize(animation_grid, grid_width, ds_grid_height(animation_grid) + 1);
grid_y = ds_grid_height(animation_grid) - 1;

for (i = 0; i < argument_count; i += 1)
{
    ds_grid_set(animation_grid, i, grid_y, argument[i]);
}

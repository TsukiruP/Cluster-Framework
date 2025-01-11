/// hud_add_item(item)
/* Adds an item to the HUD item feed. */

with (ctrl_hud)
{
    if (item_grid != -1)
    {
        var grid_y;

        ds_grid_resize(item_grid, ds_grid_width(item_grid), ds_grid_height(item_grid) + 1);
        grid_y = ds_grid_height(item_grid) - 1;

        ds_grid_set(item_grid, 0, grid_y, argument0);
        ds_grid_set(item_grid, 1, grid_y, 0);
    }
}

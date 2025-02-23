/// hud_add_item(item)
/// @desc Adds an item to the item feed.
/// @param {int} item
/// @returns {void}

var _item; _item = argument0;

with (ctrl_hud)
{
    if (item_grid != -1)
    {
        var grid_y; grid_y = ds_grid_height(item_grid);

        ds_grid_resize(item_grid, ds_grid_width(item_grid), grid_y + 1);
        ds_grid_set(item_grid, 0, grid_y, _item);
        ds_grid_set(item_grid, 1, grid_y, 0);
    }
}
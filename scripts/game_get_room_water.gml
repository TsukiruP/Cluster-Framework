/// game_get_room_water([room])
/* Returns the water level of a room.
Defaults to the current room.
If the room has no water level set, returns -1. */

with (ctrl_game)
{
    var grid_height, room_handle;

    grid_height = ds_grid_height(room_grid) - 1;
    room_handle = room;

    if (argument_count >= 1)
    {
        room_handle = argument[0];
    }

    if (ds_grid_value_exists(room_grid, 0, 0, 0, grid_height, room_handle))
    {
        var grid_y;

        grid_y = ds_grid_value_y(room_grid, 0, 0, 0, grid_height, room_handle);
        return ds_grid_get(room_grid, 6, grid_y);
    }

    return -1;
}

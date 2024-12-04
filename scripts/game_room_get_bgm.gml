/// game_room_get_bgm([room])
// Returns the BGM from the room grid. Defaults to the current room.

with (mgr_game)
{
    var grid_height, room_handle;

    // Initialize:
    grid_height = ds_grid_height(room_grid) - 1;
    room_handle = room;

    // Set room handle:
    if (argument_count >= 1)
    {
        room_handle = argument[0];
    }

    // Check room:
    if (ds_grid_value_exists(room_grid, 0, 0, 0, grid_height, room_handle))
    {
        var grid_y;

        grid_y = ds_grid_value_y(room_grid, 0, 0, 0, grid_height, room_handle);

        // Return:
        return ds_grid_get(room_grid, 2, grid_y);
    }

    // Default to none:
    return "";
}

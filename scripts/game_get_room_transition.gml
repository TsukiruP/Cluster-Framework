/// game_get_room_transition([room])
/* Returns the transition of a room.
Defaults to checking the current room.
If the room has no transition set, returns fade. */

with (ctrl_game)
{
    var grid_height, room_handle;

    grid_height = ds_grid_height(room_grid) - 1;
    room_handle = room;
    if (argument_count > 0) room_handle = argument[0];

    if (ds_grid_value_exists(room_grid, 0, 0, 0, grid_height, room_handle))
    {
        var grid_y;

        grid_y = ds_grid_value_y(room_grid, 0, 0, 0, grid_height, room_handle);
        return ds_grid_get(room_grid, 1, grid_y);
    }

    return TRANS_FADE;
}

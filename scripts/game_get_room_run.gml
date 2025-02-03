/// game_get_room_run([room])
/* Returns the run of a room.
Defaults to the current room.
If the room has no run set, returns -1. */

with (ctrl_game)
{
    var grid_height, room_id;

    grid_height = ds_grid_height(room_grid) - 1;
    room_id = room;
    if (argument_count > 0) room_id = argument[0];

    if (ds_grid_value_exists(room_grid, 0, 0, 0, grid_height, room_id))
    {
        var grid_y;

        grid_y = ds_grid_value_y(room_grid, 0, 0, 0, grid_height, room_id);
        return ds_grid_get(room_grid, 8, grid_y);
    }

    return -1;
}

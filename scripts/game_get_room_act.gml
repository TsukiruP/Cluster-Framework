/// game_get_room_act([room])
/// @desc Returns the act of the room.
/// @param {room} [room]
/// @returns {int}

var _room; if (argument_count > 0) _room = argument[0]; else _room = room;

with (ctrl_game)
{
    var grid_height; grid_height = ds_grid_height(room_grid) - 1;
    var grid_y; grid_y = ds_grid_value_y(room_grid, 0, 0, 0, grid_height, _room);

    if (grid_y != -1) return ds_grid_get(room_grid, 5, grid_y);
    else return 0;
}

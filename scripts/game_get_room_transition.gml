/// game_get_room_transition([room])
/// @desc Returns the transition of the room.
/// @param {room} [room]
/// @returns {int}

var _room; if (argument_count > 0) _room = argument[0]; else _room = room;

with (ctrl_game)
{
    var grid_height; grid_height = ds_grid_height(room_grid) - 1;
    var grid_y; grid_y = ds_grid_value_y(room_grid, 0, 0, 0, grid_height, _room);

    return ds_grid_get(room_grid, 1, grid_y);
}
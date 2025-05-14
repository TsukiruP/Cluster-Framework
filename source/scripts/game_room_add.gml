/// game_room_add(room, [transition], [music], [background], [zone], [act], [water], [start], [run])
/// @desc Adds a room to the room grid.
/// @param {room} room
/// @param {int} [transition]
/// @param {string} [music]
/// @param {object} [background]
/// @param {string} [zone]
/// @param {int} [act]
/// @param {number} [water]
/// @param {int} [start]
/// @param {number} [run]
/// @returns {void}

var _room; _room = argument[0];
var _transition; if (argument_count > 1) _transition = argument[1]; else _transition = TRANS_FADE;
var _music; if (argument_count > 2) _music = argument[2]; else _music = "";
var _background; if (argument_count > 3) _background = argument[3]; else _background = noone;
var _zone; if (argument_count > 4) _zone = argument[4]; else _zone = "";
var _act; if (argument_count > 5) _act = argument[5]; else _act = 0;
var _water; if (argument_count > 6) _water = argument[6]; else _water = -1;
var _start; if (argument_count > 7) _start = argument[7]; else _start = START_IDLE;
var _run; if (argument_count > 8) _run = argument[8]; else _run = -1;

with (ctrl_game)
{
    if (!ds_grid_value_exists(room_grid, 0, 0, ds_grid_width(room_grid) - 1, ds_grid_height(room_grid) - 1, _room))
    {
        var grid_y; grid_y = ds_grid_height(room_grid);

        ds_grid_resize(room_grid, ds_grid_width(room_grid), grid_y + 1);
        ds_grid_set(room_grid, 0, grid_y, _room);
        ds_grid_set(room_grid, 1, grid_y, _transition);
        ds_grid_set(room_grid, 2, grid_y, _music);
        ds_grid_set(room_grid, 3, grid_y, _background);
        ds_grid_set(room_grid, 4, grid_y, _zone);
        ds_grid_set(room_grid, 5, grid_y, _act);
        ds_grid_set(room_grid, 6, grid_y, _water);
        ds_grid_set(room_grid, 7, grid_y, _start);
        ds_grid_set(room_grid, 8, grid_y, _run);
    }
}

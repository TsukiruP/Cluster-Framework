/// game_config_reset_btn(device)
/// @desc Resets a gamepad list.
/// @param {int} device
/// @returns {void}

var _device; _device = argument0;

with (ctrl_game)
{
    var input_list; input_list = ds_map_get(ds_list_find_value(gamepad_list, _device), "input_list");

    ds_list_clear(input_list);
    ds_list_add(input_list, PAD_UP);
    ds_list_add(input_list, PAD_DOWN);
    ds_list_add(input_list, PAD_LEFT);
    ds_list_add(input_list, PAD_RIGHT);
    ds_list_add(input_list, PAD_FACE1); // Jump
    ds_list_add(input_list, PAD_FACE3); // Aux
    ds_list_add(input_list, PAD_FACE4); // Swap
    ds_list_add(input_list, PAD_FACE2); // Super
    ds_list_add(input_list, PAD_BUMPERR); // Tag
    ds_list_add(input_list, PAD_BUMPERL); // Alt
    ds_list_add(input_list, PAD_START); // Start
    ds_list_add(input_list, PAD_SELECT); // Select
    ds_list_add(input_list, PAD_FACE1); // Confirm
    ds_list_add(input_list, PAD_FACE2); // Cancel
    ds_list_add(input_list, PAD_FACE3); // Log
    ds_list_add(input_list, PAD_FACE4); // Hide
}

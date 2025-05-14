/// config_read_gamepad()
/// @desc Reads the gamepad list from the config map.
/// @returns {void}

with (ctrl_config)
{
    var gamepad_list; gamepad_list = ds_list_create();

    ds_list_read(gamepad_list, config_get("input_gamepad"));

    for ({var i; i = 0}; i < min(ds_list_size(gamepad_list), PLAYER_COUNT); i += 1)
    {
        var gamepad_map; gamepad_map = ds_map_create();
        var input_list; input_list = ds_list_create();

        ds_map_read(gamepad_map, ds_list_find_value(gamepad_list, i))
        ds_list_read(input_list, ds_map_get(gamepad_map, "input_list"));
        ds_list_copy(config_get_gamepad(i, "input_list"), input_list);
        ds_list_destroy(input_list);
        config_set_gamepad(i, "input_deadzone", ds_map_get(gamepad_map, "input_deadzone"));
        config_set_gamepad(i, "input_confirm", ds_map_get(gamepad_map, "input_confirm"));
        config_set_gamepad(i, "input_style", ds_map_get(gamepad_map, "input_style"));
        ds_map_destroy(gamepad_map);
    }

    ds_list_destroy(gamepad_list);
}

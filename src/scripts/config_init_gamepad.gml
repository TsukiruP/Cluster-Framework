/// config_init_gamepad()
/// @desc Initializes gamepad list and maps.
/// @returns {void}

with (ctrl_config)
{
    for ({var i; i = 0}; i < PLAYER_COUNT; i += 1)
    {
        var gamepad_map; gamepad_map = ds_map_create();

        ds_map_set(gamepad_map, "input_list", ds_list_create());
        ds_map_set(gamepad_map, "input_deadzone", 0.1);
        ds_map_set(gamepad_map, "input_confirm", 0);
        ds_map_set(gamepad_map, "input_style", 0);
        ds_list_add(gamepad_list, gamepad_map);
    }
}

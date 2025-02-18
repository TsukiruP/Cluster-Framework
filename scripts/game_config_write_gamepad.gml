/// game_config_write_gamepad()
/// @desc Writes a list of gamepad maps to the config map.
/// @returns {void}

with (ctrl_game)
{
    var i;
    var gamepad_list; gamepad_list = ds_list_create();

    for (i = 0; i < PLAYER_COUNT; i += 1)
    {
        var gamepad_map; gamepad_map = ds_map_create();

        ds_map_set(gamepad_map, "input_list", ds_list_write(game_config_get_gamepad(i, "input_list")));
        ds_map_set(gamepad_map, "input_deadzone", game_config_get_gamepad(i, "input_deadzone"));
        ds_map_set(gamepad_map, "input_confirm",  game_config_get_gamepad(i, "input_confirm"));
        ds_map_set(gamepad_map, "input_style", game_config_get_gamepad(i, "input_style"));
        ds_list_add(gamepad_list, ds_map_write(gamepad_map));
        ds_map_destroy(gamepad_map);
    }

    game_set_config("input_gamepad", ds_list_write(gamepad_list));
    ds_list_destroy(gamepad_list);
}

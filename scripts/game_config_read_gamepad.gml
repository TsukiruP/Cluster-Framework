/// game_config_read_gamepad()
/* Reads a gamepad list from the config map. */

with (ctrl_game)
{
    var i, config_list, config_map, input_list;

    config_list = ds_list_create();
    ds_list_read(config_list, game_get_config("input_gamepad"));

    for (i = 0; i < PLAYER_COUNT; i += 1)
    {
        config_map = ds_map_create();
        ds_map_read(config_map, ds_list_find_value(config_list, i));

        input_list = ds_list_create();
        ds_list_read(input_list, ds_map_get(config_map, "input_list"));
        ds_list_copy(game_config_get_gamepad(i, "input_list"), input_list);
        ds_list_destroy(input_list);

        game_config_set_gamepad(i, "input_deadzone", ds_map_get(config_map, "input_deadzone"));
        game_config_set_gamepad(i, "input_confirm", ds_map_get(config_map, "input_confirm"));
        game_config_set_gamepad(i, "input_style", ds_map_get(config_map, "input_style"));

        ds_map_destroy(config_map);
    }

    ds_list_destroy(config_list);
}

/// game_config_read_gamepad()
/* Reads a gamepad list from the config map. */

with (ctrl_game)
{
    var i, gamepad_list, gamepad_map, input_list;

    gamepad_list = ds_list_create();
    ds_list_read(gamepad_list, game_get_config("input_gamepad"));

    for (i = 0; i < min(ds_list_size(gamepad_list), PLAYER_COUNT); i += 1)
    {
        gamepad_map = ds_map_create();
        ds_map_read(gamepad_map, ds_list_find_value(gamepad_list, i));

        input_list = ds_list_create();
        ds_list_read(input_list, ds_map_get(gamepad_map, "input_list"));
        ds_list_copy(game_config_get_gamepad(i, "input_list"), input_list);
        ds_list_destroy(input_list);

        game_config_set_gamepad(i, "input_deadzone", ds_map_get(gamepad_map, "input_deadzone"));
        game_config_set_gamepad(i, "input_confirm", ds_map_get(gamepad_map, "input_confirm"));
        game_config_set_gamepad(i, "input_style", ds_map_get(gamepad_map, "input_style"));

        ds_map_destroy(gamepad_map);
    }

    ds_list_destroy(gamepad_list);
}

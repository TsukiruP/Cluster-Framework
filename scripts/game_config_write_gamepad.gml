/// game_config_write_gamepad()
/* Writes a gamepad list to the config map. */

with (ctrl_game)
{
    var i, gamepad_list, gamepad_map, input_list, input_deadzone, input_confirm, input_style;

    gamepad_list = ds_list_create();

    for (i = 0; i < PLAYER_COUNT; i += 1)
    {
        gamepad_map = ds_map_create();

        input_list = ds_list_write(game_config_get_gamepad(i, "input_list"));
        input_deadzone = game_config_get_gamepad(i, "input_deadzone");
        input_confirm = game_config_get_gamepad(i, "input_confirm");
        input_style = game_config_get_gamepad(i, "input_style");

        ds_map_add(gamepad_map, "input_list", input_list);
        ds_map_add(gamepad_map, "input_deadzone", input_deadzone);
        ds_map_add(gamepad_map, "input_confirm", input_confirm);
        ds_map_add(gamepad_map, "input_style", input_style);

        ds_list_add(gamepad_list, ds_map_write(gamepad_map));
        ds_map_destroy(gamepad_map);
    }

    game_set_config("input_gamepad", ds_list_write(gamepad_list));
    ds_list_destroy(gamepad_list);
}

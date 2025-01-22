/// game_config_write_gamepad()
/* Writes a gamepad list to the config map. */

with (ctrl_game)
{
    var i, config_list, config_map, input_list, input_deadzone, input_confirm, input_style;

    config_list = ds_list_create();

    for (i = 0; i < PLAYER_COUNT; i += 1)
    {
        config_map = ds_map_create();

        input_list = ds_list_write(game_config_get_gamepad(i, "input_list"));
        input_deadzone = game_config_get_gamepad(i, "input_deadzone");
        input_confirm = game_config_get_gamepad(i, "input_confirm");
        input_style = game_config_get_gamepad(i, "input_style");

        ds_map_add(config_map, "input_list", input_list);
        ds_map_add(config_map, "input_deadzone", input_deadzone);
        ds_map_add(config_map, "input_confirm", input_confirm);
        ds_map_add(config_map, "input_style", input_style);

        ds_list_add(config_list, ds_map_write(config_map));
        ds_map_destroy(config_map);
    }

    game_set_config("input_gamepad", ds_list_write(config_list));
    ds_list_destroy(config_list);
}

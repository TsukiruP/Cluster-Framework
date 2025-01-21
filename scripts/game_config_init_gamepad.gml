/// game_config_init_gamepad()
/* Initializes the gamepad list and maps. */

with (ctrl_game)
{
    var i, gamepad_map;

    for (i = 0; i < PLAYER_COUNT; i += 1)
    {
        gamepad_map = ds_map_create();
        ds_list_add(gamepad_list, gamepad_map);

        ds_map_add(gamepad_map, "input_list", ds_list_create());
        ds_map_add(gamepad_map, "input_deadzone", 0.1);
        ds_map_add(gamepad_map, "input_confirm", 0);
        ds_map_add(gamepad_map, "input_style", 0);
    }
}

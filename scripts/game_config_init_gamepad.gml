/// game_config_init_gamepad()
/// @desc Initializes gamepad list and maps.
/// @returns {void}

with (ctrl_game)
{
    var gamepad_map;

    for ({var i; i = 0}; i < PLAYER_COUNT; i += 1)
    {
        gamepad_map = ds_map_create();
        ds_map_set(gamepad_map, "input_list", ds_list_create());
        ds_map_set(gamepad_map, "input_deadzone", 0.1);
        ds_map_set(gamepad_map, "input_confirm", 0);
        ds_map_set(gamepad_map, "input_style", 0);
        ds_list_add(gamepad_list, gamepad_map);
    }
}
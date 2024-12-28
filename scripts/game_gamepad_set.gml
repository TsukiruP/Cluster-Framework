/// game_gamepad_set(id, input, button)
// Sets a button in a gamepad list.

with (mgr_game)
{
    ds_list_replace(game_config_get("input_gamepad" + string(argument0)), argument1, argument2);
}

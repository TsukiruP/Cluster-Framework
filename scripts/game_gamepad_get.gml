/// game_gamepad_get(id, input)
// Returns a button from a gamepad list.

with (mgr_game)
{
    return ds_list_find_value(game_get_config("input_gamepad" + string(argument0)), argument1);
}

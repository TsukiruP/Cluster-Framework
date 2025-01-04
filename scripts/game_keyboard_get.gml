/// game_keyboard_get(input)
// Returns a key from the keyboard list.

with (mgr_game)
{
    return ds_list_find_value(game_get_config("input_keyboard"), argument0);
}

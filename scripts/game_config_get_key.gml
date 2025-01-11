/// game_config_get_key(input)
/* Returns a key from the keyboard list. */

with (ctrl_game)
{
    return ds_list_find_value(game_get_config("input_keyboard"), argument0);
}

/// game_config_set_key(input, key)
/* Sets a key in the keyboard list. */

with (ctrl_game)
{
    ds_list_replace(game_get_config("input_keyboard"), argument0, argument1);
}

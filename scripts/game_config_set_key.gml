/// game_config_set_key(input, key)
/* Sets a key in the keyboard list. */

with (ctrl_game)
{
    ds_list_replace(keyboard_list, argument0, argument1);
}

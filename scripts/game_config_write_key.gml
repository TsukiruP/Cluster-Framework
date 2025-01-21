/// game_config_write_key()
/* Writes the keyboard list to the config map. */

with (ctrl_game)
{
    game_set_config("input_keyboard", ds_list_write(keyboard_list));
}

/// game_keyboard_set(input, key)
// Sets a key in the keyboard list.

with (mgr_game)
{
    ds_list_replace(game_config_get("input_keyboard"), argument0, argument1);
}

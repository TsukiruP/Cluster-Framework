/// game_keyboard_set(input, key)
// Sets a key in the keyboard list.

with (mgr_game)
{
    ds_list_replace(keyboard_list, argument0, argument1);
}

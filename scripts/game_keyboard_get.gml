/// game_keyboard_get(input)
// Returns the input stored in the keyboard list.

with (mgr_game)
{
    return ds_list_find_value(keyboard_list, argument0);;
}

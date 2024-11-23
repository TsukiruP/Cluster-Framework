/// game_gamepad_get(id, input)
// Returns a button from a gamepad list.

with (mgr_game)
{
    return ds_list_find_value(gamepad_list[argument0], argument1);
}

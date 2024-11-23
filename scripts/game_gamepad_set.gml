/// game_gamepad_set(id, input, button)
// Sets a button in a gamepad list.

with (mgr_game)
{
    ds_list_replace(gamepad_list[argument0], argument1, argument2);
}

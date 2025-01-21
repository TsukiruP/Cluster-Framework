/// game_config_set_deadzone(id, deadzone)
/* Sets the deadzone in a gamepad map. */

with (ctrl_game)
{
    ds_map_set(ds_list_find_value(gamepad_list, argument0), "input_deadzone", argument1);
}

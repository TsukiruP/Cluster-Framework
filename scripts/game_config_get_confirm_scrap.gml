/// game_config_get_confirm(id)
/* Returns the deadzone from a gamepad map. */

with (ctrl_game)
{
    ds_map_get(ds_list_find_value(gamepad_list, argument0), "input_deadzone");
}

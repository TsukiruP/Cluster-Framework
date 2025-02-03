/// game_config_set_gamepad(index, key, val)
/* Sets a value in a gamepad map. */

with (ctrl_game) ds_map_set(ds_list_find_value(gamepad_list, argument0), argument1, argument2);

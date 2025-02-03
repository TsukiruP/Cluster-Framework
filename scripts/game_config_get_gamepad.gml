/// game_config_get_gamepad(index, key)
/* Returns a value from a gamepad map. */

with (ctrl_game) ds_map_get(ds_list_find_value(gamepad_list, argument0), argument1);

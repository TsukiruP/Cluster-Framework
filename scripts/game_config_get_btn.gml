/// game_config_get_btn(index, input)
/* Returns a button from a gamepad list. */

with (ctrl_game) return ds_list_find_value(ds_map_get(ds_list_find_value(gamepad_list, argument0), "input_list"), argument1);

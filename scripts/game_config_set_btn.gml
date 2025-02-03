/// game_config_set_btn(id, input, button)
/* Sets a button in a gamepad list. */

with (ctrl_game) ds_list_replace(ds_map_get(ds_list_find_value(gamepad_list, argument0), "input_list"), argument1, argument2);

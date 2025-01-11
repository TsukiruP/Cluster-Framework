/// game_config_get_btn(id, input)
/* Returns a button from a gamepad list. */

with (ctrl_game)
{
    return ds_list_find_value(game_get_config("input_gamepad" + string(argument0)), argument1);
}

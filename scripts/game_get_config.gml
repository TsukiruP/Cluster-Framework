/// game_get_config(key)
/* Returns a value from the config map. */

with (ctrl_game)
{
    return ds_map_get(config_map, argument0);
}

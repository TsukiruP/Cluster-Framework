/// game_set_config(key, value)
/* Sets a value in the config map. */

with (mgr_game)
{
    ds_map_set(config_map, argument0, argument1);
}

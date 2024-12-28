/// game_config_get(key)
// Returns a value from the config map.

with (mgr_game)
{
    return ds_map_get(config_map, argument0);
}

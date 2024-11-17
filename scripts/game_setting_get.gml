/// game_setting_get(key)
// Returns a value from the setting map.

with (mgr_game)
{
    return ds_map_get(setting_map, argument0);
}

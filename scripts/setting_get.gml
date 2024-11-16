/// setting_get(key)
// Returns a value from the setting map.

with (mgr_game)
{
    var setting_key;

    // Initialize:
    setting_key = argument0;

    // Return:
    return ds_map_get(setting_map, setting_key);
}

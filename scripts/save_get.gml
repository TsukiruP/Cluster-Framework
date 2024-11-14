/// save_get(key)
// Returns a value from the save map.

with (mgr_game)
{
    return ds_map_get(save_map, argument0);
}

/// savedata_get(key)
// Returns a value from the savedata map.

with (mgr_game)
{
    return ds_map_get(savedata_map, argument0);
}

/// game_save_get(key)
// Returns a value from the save map.

with (mgr_game)
{
    var save_key;

    // Initialize:
    save_key = argument0;

    // Return:
    return ds_map_get(save_map, save_key);
}

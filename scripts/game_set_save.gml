/// game_set_save(key, value)
/* Sets a value in the save map. */

with (mgr_game)
{
    ds_map_set(save_map, argument0, argument1);
}

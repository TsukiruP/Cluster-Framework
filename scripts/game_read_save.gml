/// game_read_save(id)
// Reads a save file and applies it.

with (mgr_game)
{
    if (game_save_exists(argument0))
    {
        var save_temp;

        // Initialize:
        save_temp = game_load_save_buffer(argument0);

        ds_map_copy(save_map, save_temp);
        ds_map_destroy(save_temp);
    }
}

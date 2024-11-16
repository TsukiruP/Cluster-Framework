/// game_save_read(id)
// Reads a save file and applies it to the save map.

with (mgr_game)
{
    var save_id;

    // Initialize:
    save_id = argument0;

    if (game_save_exists(save_id))
    {
        var save_buffer, save_temp;

        // Buffer:
        save_buffer = buffer_create();
        buffer_load(save_buffer, save_directory + "save" + string(save_id) + ".sav");
        save_temp = ds_map_create();
        ds_map_read(save_temp, buffer_read_hex(save_buffer, buffer_get_size(save_buffer)));
        ds_map_copy(save_map, save_temp);
        ds_map_destroy(save_temp);
    }
}
